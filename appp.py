from flask import Flask, render_template, request, redirect, flash, session, url_for
from werkzeug.security import generate_password_hash, check_password_hash
from functools import wraps
import pyodbc

app = Flask(__name__)
app.secret_key = 'super_secret_key_session'

def get_db_connection():
    conn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};'
        'SERVER=localhost\\SQLEXPRESS;'
        'DATABASE=dbmsmini3;'
        'Trusted_Connection=yes;'
        'TrustServerCertificate=yes;'
    )
    return conn

def rows_to_dicts(cursor):
    columns = [column[0] for column in cursor.description]
    results = []
    for row in cursor.fetchall():
        results.append(dict(zip(columns, row)))
    return results

# =========================
# 3NF LOOKUP HELPERS
# =========================
def get_or_create_id(cursor, table, id_col, name, name_col='Name'):
    if not name or name == 'None': return None
    cursor.execute(f"SELECT {id_col} FROM {table} WHERE {name_col}=?", name)
    row = cursor.fetchone()
    if row: return row[0]
    cursor.execute(f"INSERT INTO {table} ({name_col}) OUTPUT INSERTED.{id_col} VALUES (?)", name)
    return cursor.fetchone()[0]

def get_or_create_location(cursor, address, city=None, state=None):
    if not address: return None
    cursor.execute("SELECT LocationID FROM Locations WHERE Address=? AND (City=? OR City IS NULL)", address, city)
    row = cursor.fetchone()
    if row: return row[0]
    cursor.execute("INSERT INTO Locations (Address, City, State) OUTPUT INSERTED.LocationID VALUES (?, ?, ?)", address, city, state)
    return cursor.fetchone()[0]

# =========================
# AUTHORIZATION MIDDLEWARE
# =========================
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            flash("Please log in to access this page.", "danger")
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function

def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session or session.get('role') != 'Admin':
            flash("Admin access is required to perform this action.", "danger")
            return redirect(url_for('dashboard'))
        return f(*args, **kwargs)
    return decorated_function


# =========================
# AUTH ROUTES
# =========================
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM system_users WHERE username=?", username)
        user = cursor.fetchone()
        
        if user:
            columns = [column[0] for column in cursor.description]
            user_dict = dict(zip(columns, user))
            
            if check_password_hash(user_dict['password_hash'], password):
                session['user_id'] = user_dict['user_id']
                session['username'] = user_dict['username']
                session['role'] = user_dict['role']
                flash(f"Welcome back, {user_dict['username']}!", "success")
                conn.close()
                return redirect(url_for('dashboard'))
            
        flash("Invalid username or password.", "danger")
        conn.close()
    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        role = request.form.get('role', 'User')
        
        hashed_pw = generate_password_hash(password)
        
        try:
            conn = get_db_connection()
            cursor = conn.cursor()
            cursor.execute("INSERT INTO system_users (username, password_hash, role) VALUES (?, ?, ?)", username, hashed_pw, role)
            conn.commit()
            conn.close()
            flash("Registration successful. Please log in.", "success")
            return redirect(url_for('login'))
        except pyodbc.IntegrityError:
            flash("Username already exists.", "danger")
            
    return render_template('register.html')

@app.route('/logout')
def logout():
    session.clear()
    flash("You have been logged out.", "success")
    return redirect(url_for('login'))


# =========================
# DASHBOARD
# =========================
@app.route('/')
@app.route('/dashboard')
@login_required
def dashboard():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    counts = {}
    if session.get('role') == 'Admin':
        entities = ['Criminal6', 'CaseRecord', 'Crime5', 'PoliceOfficer', 'Lawyer2', 'FamilyMember', 'Court3']
        for e in entities:
            cursor.execute(f"SELECT COUNT(*) FROM {e}")
            counts[e] = cursor.fetchone()[0]
    else:
        # Regular users get personalized stats if applicable, or zeroed counts
        counts = {e: 0 for e in ['Criminal6', 'CaseRecord', 'Crime5', 'PoliceOfficer', 'Lawyer2', 'FamilyMember', 'Court3']}
    
    conn.close()
    
    return render_template('dashboard.html', 
                         criminal_count=counts.get('Criminal6', 0),
                         case_count=counts.get('CaseRecord', 0),
                         crime_count=counts.get('Crime5', 0),
                         police_count=counts.get('PoliceOfficer', 0),
                         lawyer_count=counts.get('Lawyer2', 0),
                         family_count=counts.get('FamilyMember', 0),
                         court_count=counts.get('Court3', 0))


# 1. CRIMINAL (Criminal6)

@app.route('/criminals')
@login_required
def criminals():
    search_query = request.args.get('q', '')
    conn = get_db_connection()
    cursor = conn.cursor()
    
    if session.get('role') == 'Admin':
        sql = """
            SELECT c.*, s.Name AS Status 
            FROM Criminal6 c
            LEFT JOIN CriminalStatuses s ON c.StatusID = s.CSID
        """
        params = []
        if search_query:
            sql += " WHERE c.FirstName LIKE ? OR c.LastName LIKE ? OR (c.FirstName + ' ' + c.LastName) LIKE ? "
            params = [f'%{search_query}%', f'%{search_query}%', f'%{search_query}%']
        sql += " ORDER BY c.CriminalID DESC"
        cursor.execute(sql, *params)
        data = rows_to_dicts(cursor)
        
        # UX IMPROVEMENT: If searching and found at least 1 criminal, go straight to the first one's report if they want a report
        if search_query and len(data) >= 1:
            conn.close()
            return redirect(url_for('criminal_detail', criminal_id=data[0]['CriminalID']))
    else:
        # Regular users see only criminals they are family members of
        sql = """
            SELECT c.*, s.Name AS Status 
            FROM Criminal6 c
            JOIN FamilyMember f ON c.CriminalID = f.CriminalID
            LEFT JOIN CriminalStatuses s ON c.StatusID = s.CSID
            WHERE f.user_id = ?
        """
        cursor.execute(sql, (session['user_id'],))
        data = rows_to_dicts(cursor)
        
    conn.close()
    return render_template('criminals.html', data=data, search_query=search_query)

@app.route('/criminal/<int:criminal_id>')
@admin_required
def criminal_detail(criminal_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Criminal Basic Info
    cursor.execute("""
        SELECT c.*, s.Name AS Status 
        FROM Criminal6 c
        LEFT JOIN CriminalStatuses s ON c.StatusID = s.CSID
        WHERE c.CriminalID = ?
    """, (criminal_id,))
    criminal = rows_to_dicts(cursor)
    if not criminal:
        flash("Criminal record not found.", "danger")
        return redirect('/criminals')
    
    # Crimes & Cases related to this criminal - including Lawyer and Court
    cursor.execute("""
        SELECT c.*, s.Name AS Severity, l.Address AS Location, 
               cr.CaseTitle, cr.CaseNumber, st.Name AS CaseStatus, v.Name AS Verdict, cr.HearingDate,
               cr.SentenceYears, cr.FineAmount,
               p.FirstName AS Officer_FName, p.LastName AS Officer_LName,
               r.Name AS Officer_Rank,
               law.FirstName AS Lawyer_FName, law.LastName AS Lawyer_LName, law.BarAssociation AS Lawyer_Firm,
               crt.CourtName, ct.Name AS CourtType
        FROM Crime5 c
        LEFT JOIN Severities s ON c.SeverityID = s.SeverityID
        LEFT JOIN Locations l ON c.LocationID = l.LocationID
        LEFT JOIN CaseRecord cr ON c.CrimeID = cr.CrimeID
        LEFT JOIN CaseStatuses st ON cr.StatusID = st.StatusID
        LEFT JOIN Verdicts v ON cr.VerdictID = v.VerdictID
        LEFT JOIN PoliceOfficer p ON c.OfficerID = p.OfficerID
        LEFT JOIN Ranks r ON p.RankID = r.RankID
        LEFT JOIN Lawyer2 law ON cr.LawyerID = law.LawyerID
        LEFT JOIN Court3 crt ON cr.CourtID = crt.CourtID
        LEFT JOIN CourtTypes ct ON crt.CourtTypeID = ct.TypeID
        WHERE c.CriminalID = ?
    """, (criminal_id,))
    related_info = rows_to_dicts(cursor)
    
    conn.close()
    return render_template('criminal_detail.html', criminal=criminal[0], related_info=related_info)

@app.route('/add_criminal', methods=['POST'])
@admin_required
def add_criminal():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    status_id = get_or_create_id(cursor, 'CriminalStatuses', 'CSID', request.form.get('status', 'Active'))

    cursor.execute("""
        INSERT INTO Criminal6 (FirstName, LastName, DateOfBirth, Gender, NationalID, Nationality, Address, PhoneNumber, StatusID)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    """, request.form['first_name'], request.form['last_name'], request.form.get('dob'), 
        request.form.get('gender'), request.form.get('national_id'), request.form.get('nationality'), 
        request.form.get('address'), request.form.get('phone'), status_id)
    conn.commit()
    conn.close()
    flash("Criminal registered successfully!", "success")
    return redirect('/criminals')

@app.route('/delete_criminal/<int:criminal_id>')
@admin_required
def delete_criminal(criminal_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Criminal6 WHERE CriminalID = ?", (criminal_id,))
    conn.commit()
    conn.close()
    flash("Criminal record deleted successfully.", "success")
    return redirect('/criminals')


# =========================
# 2. CASES (CaseRecord)
# =========================
@app.route('/cases')
@login_required
def cases():
    search_query = request.args.get('q', '')
    conn = get_db_connection()
    cursor = conn.cursor()
    
    sql = """
        SELECT cr.*, v.Name AS Verdict, s.Name AS CaseStatus, 
               crim.FirstName AS C_FirstName, crim.LastName AS C_LastName,
               ct.CourtName, co.FirstName AS Officer_FName, co.LastName AS Officer_LName
        FROM CaseRecord cr
        LEFT JOIN Verdicts v ON cr.VerdictID = v.VerdictID
        LEFT JOIN CaseStatuses s ON cr.StatusID = s.StatusID
        LEFT JOIN Crime5 c ON cr.CrimeID = c.CrimeID
        LEFT JOIN Criminal6 crim ON c.CriminalID = crim.CriminalID
        LEFT JOIN Court3 ct ON cr.CourtID = ct.CourtID
        LEFT JOIN PoliceOfficer co ON cr.OfficerID = co.OfficerID
    """
    params = []
    if session.get('role') != 'Admin':
        sql += " JOIN FamilyMember f ON crim.CriminalID = f.CriminalID WHERE f.user_id = ? "
        params.append(session['user_id'])
        if search_query:
            sql += " AND (cr.CaseTitle LIKE ? OR cr.CaseNumber LIKE ?) "
            params.extend([f'%{search_query}%', f'%{search_query}%'])
    elif search_query:
        sql += " WHERE cr.CaseTitle LIKE ? OR cr.CaseNumber LIKE ? "
        params.extend([f'%{search_query}%', f'%{search_query}%'])
        
    sql += " ORDER BY cr.CaseID DESC"
    cursor.execute(sql, *params)
        
    
    # NEW: Fetch dropdown data for the "Add Case" form
    cursor.execute("SELECT CrimeID, CrimeType FROM Crime5")
    crimes = rows_to_dicts(cursor)
    cursor.execute("SELECT CourtID, CourtName FROM Court3")
    courts = rows_to_dicts(cursor)
    cursor.execute("SELECT LawyerID, FirstName, LastName FROM Lawyer2")
    lawyers = rows_to_dicts(cursor)
    cursor.execute("SELECT OfficerID, FirstName, LastName FROM PoliceOfficer")
    officers = rows_to_dicts(cursor)
    
    data = rows_to_dicts(cursor)
    conn.close()
    return render_template('cases.html', data=data, search_query=search_query, 
                         crimes_list=crimes, courts_list=courts, 
                         lawyers_list=lawyers, officers_list=officers)

@app.route('/delete_case/<int:case_id>')
@admin_required
def delete_case(case_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM CaseRecord WHERE CaseID = ?", (case_id,))
    conn.commit()
    conn.close()
    flash("Case record deleted.", "success")
    return redirect('/cases')

@app.route('/add_case', methods=['POST'])
@admin_required
def add_case():
    conn = get_db_connection()
    cursor = conn.cursor()
    status_id = get_or_create_id(cursor, 'CaseStatuses', 'StatusID', request.form.get('status', 'Open'))

    cursor.execute("""
        INSERT INTO CaseRecord (CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, StatusID)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """, request.form['case_number'], request.form['case_title'], request.form['crime_id'], 
        request.form['court_id'], request.form['lawyer_id'], request.form['officer_id'], 
        request.form['filed_date'], status_id)
    conn.commit()
    conn.close()
    flash("Case registered successfully!", "success")
    return redirect('/cases')


# =========================
# 3. CRIME (Crime5)
# =========================
@app.route('/crimes')
@login_required
def crimes():
    search_query = request.args.get('q', '')
    conn = get_db_connection()
    cursor = conn.cursor()
    
    sql = """
        SELECT c.*, s.Name AS Severity, crim.FirstName AS C_FirstName, crim.LastName AS C_LastName, 
               cr.CaseTitle, l.Address AS Location
        FROM Crime5 c
        LEFT JOIN Severities s ON c.SeverityID = s.SeverityID
        LEFT JOIN Criminal6 crim ON c.CriminalID = crim.CriminalID
        LEFT JOIN CaseRecord cr ON c.CrimeID = cr.CrimeID
        LEFT JOIN Locations l ON c.LocationID = l.LocationID
    """
    params = []
    if session.get('role') != 'Admin':
        sql += " JOIN FamilyMember f ON crim.CriminalID = f.CriminalID WHERE f.user_id = ? "
        params.append(session['user_id'])
        if search_query:
            sql += " AND (c.CrimeType LIKE ? OR l.Address LIKE ? OR crim.FirstName LIKE ?) "
            params.extend([f'%{search_query}%', f'%{search_query}%', f'%{search_query}%'])
    elif search_query:
        sql += " WHERE c.CrimeType LIKE ? OR l.Address LIKE ? OR crim.FirstName LIKE ? OR crim.LastName LIKE ? "
        params.extend([f'%{search_query}%', f'%{search_query}%', f'%{search_query}%', f'%{search_query}%'])

    sql += " ORDER BY c.CrimeID DESC"
    cursor.execute(sql, *params)
    
    # NEW: Dropdown data
    cursor.execute("SELECT CriminalID, FirstName, LastName FROM Criminal6")
    criminals = rows_to_dicts(cursor)
    cursor.execute("SELECT OfficerID, FirstName, LastName FROM PoliceOfficer")
    officers = rows_to_dicts(cursor)

    data = rows_to_dicts(cursor)
    conn.close()
    return render_template('crimes.html', data=data, search_query=search_query,
                         criminals_list=criminals, officers_list=officers)

@app.route('/delete_crime/<int:crime_id>')
@admin_required
def delete_crime(crime_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Crime5 WHERE CrimeID = ?", (crime_id,))
    conn.commit()
    conn.close()
    flash("Crime record deleted.", "success")
    return redirect('/crimes')

@app.route('/add_crime', methods=['POST'])
@login_required
def add_crime():
    conn = get_db_connection()
    cursor = conn.cursor()
    severity_id = get_or_create_id(cursor, 'Severities', 'SeverityID', request.form['severity'])
    location_id = get_or_create_location(cursor, request.form.get('location'))

    cursor.execute("""
        INSERT INTO Crime5 (CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved)
        VALUES (?, ?, ?, ?, ?, ?, ?, 0)
    """, request.form['crime_type'], request.form.get('description'), severity_id, 
        request.form.get('date_occurred'), location_id, request.form['criminal_id'], request.form['officer_id'])
    conn.commit()
    conn.close()
    flash("Crime logged successfully!", "success")
    return redirect('/crimes')


# =========================
# 4. POLICE OFFICER (PoliceOfficer)
# =========================
@app.route('/police')
@login_required
def police():
    search_query = request.args.get('q', '')
    conn = get_db_connection()
    cursor = conn.cursor()
    
    sql = """
        SELECT p.*, r.Name AS Rank, d.Name AS Department, c.CaseTitle,
               l.Address AS Location
        FROM PoliceOfficer p
        LEFT JOIN Ranks r ON p.RankID = r.RankID
        LEFT JOIN Departments d ON p.DeptID = d.DeptID
        LEFT JOIN CaseRecord c ON p.OfficerID = c.OfficerID
        LEFT JOIN Crime5 cr ON p.OfficerID = cr.OfficerID
        LEFT JOIN Locations l ON cr.LocationID = l.LocationID
    """
    params = []
    if search_query:
        sql += " WHERE p.FirstName LIKE ? OR p.LastName LIKE ? OR p.BadgeNumber LIKE ? OR d.Name LIKE ? "
        params = [f'%{search_query}%', f'%{search_query}%', f'%{search_query}%', f'%{search_query}%']
    
    cursor.execute(sql, *params)
    data = rows_to_dicts(cursor)
    conn.close()
    return render_template('police.html', data=data, search_query=search_query)

@app.route('/delete_police/<int:officer_id>')
@admin_required
def delete_police(officer_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM PoliceOfficer WHERE OfficerID = ?", (officer_id,))
    conn.commit()
    conn.close()
    flash("Officer record deleted.", "success")
    return redirect('/police')

@app.route('/add_police', methods=['POST'])
@admin_required
def add_police():
    conn = get_db_connection()
    cursor = conn.cursor()
    rank_id = get_or_create_id(cursor, 'Ranks', 'RankID', request.form.get('rank'))
    dept_id = get_or_create_id(cursor, 'Departments', 'DeptID', request.form.get('department'))

    cursor.execute("""
        INSERT INTO PoliceOfficer (BadgeNumber, FirstName, LastName, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1)
    """, request.form['badge_number'], request.form['first_name'], request.form['last_name'], 
        rank_id, dept_id, request.form.get('phone'), request.form.get('email'), request.form.get('date_joined'))
    conn.commit()
    conn.close()
    flash("Officer enrolled successfully!", "success")
    return redirect('/police')


# =========================
# 5. LAWYER (Lawyer2)
# =========================
@app.route('/lawyers')
@login_required
def lawyers():
    search_query = request.args.get('q', '')
    conn = get_db_connection()
    cursor = conn.cursor()
    
    sql = """
        SELECT l.*, s.Name AS Specialization, cr.CaseTitle,
               l.LicenseNumber AS BarNumber, l.BarAssociation AS FirmName
        FROM Lawyer2 l
        LEFT JOIN Specializations s ON l.SpecID = s.SpecID
        LEFT JOIN CaseRecord cr ON l.LawyerID = cr.LawyerID
    """
    params = []
    if search_query:
        sql += " WHERE l.FirstName LIKE ? OR l.LastName LIKE ? OR s.Name LIKE ? "
        params = [f'%{search_query}%', f'%{search_query}%', f'%{search_query}%']
        
    sql += " ORDER BY l.LawyerID DESC"
    cursor.execute(sql, *params)
    data = rows_to_dicts(cursor)
    conn.close()
    return render_template('lawyers.html', data=data, search_query=search_query)

@app.route('/delete_lawyer/<int:lawyer_id>')
@admin_required
def delete_lawyer(lawyer_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Lawyer2 WHERE LawyerID = ?", (lawyer_id,))
    conn.commit()
    conn.close()
    flash("Lawyer record deleted.", "success")
    return redirect('/lawyers')

@app.route('/add_lawyer', methods=['POST'])
@admin_required
def add_lawyer():
    conn = get_db_connection()
    cursor = conn.cursor()
    spec_id = get_or_create_id(cursor, 'Specializations', 'SpecID', request.form.get('specialization'))

    cursor.execute("""
        INSERT INTO Lawyer2 (LicenseNumber, FirstName, LastName, SpecID, BarAssociation, PhoneNumber, Email, YearsExperience, IsDefenseAttorney)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1)
    """, request.form['bar_number'], request.form['first_name'], request.form['last_name'], 
        spec_id, request.form.get('firm_name'), request.form.get('phone'), request.form.get('email'), request.form.get('years_exp', 0))
    conn.commit()
    conn.close()
    flash("Lawyer registered successfully!", "success")
    return redirect('/lawyers')


# =========================
# 6. FAMILY MEMBER (FamilyMember)
# =========================
@app.route('/family')
@admin_required
def family():
    search_query = request.args.get('q', '')
    conn = get_db_connection()
    cursor = conn.cursor()
    
    sql = """
        SELECT f.*, r.Name AS Relationship, c.FirstName AS C_FirstName, c.LastName AS C_LastName 
        FROM FamilyMember f
        LEFT JOIN Relationships r ON f.RelID = r.RelID
        LEFT JOIN Criminal6 c ON f.CriminalID = c.CriminalID 
    """
    params = []
    if search_query:
        sql += " WHERE f.FirstName LIKE ? OR f.LastName LIKE ? OR c.FirstName LIKE ? "
        params = [f'%{search_query}%', f'%{search_query}%', f'%{search_query}%']
        
    sql += " ORDER BY f.FamilyMemberID DESC"
    cursor.execute(sql, *params)
    data = rows_to_dicts(cursor)

    # NEW: Dropdown data
    cursor.execute("SELECT CriminalID, FirstName, LastName FROM Criminal6")
    criminals = rows_to_dicts(cursor)

    conn.close()
    return render_template('family.html', data=data, search_query=search_query, criminals_list=criminals)

@app.route('/delete_family/<int:family_id>')
@admin_required
def delete_family(family_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM FamilyMember WHERE FamilyMemberID = ?", (family_id,))
    conn.commit()
    conn.close()
    flash("Family association deleted.", "success")
    return redirect('/family')

@app.route('/add_family', methods=['POST'])
@admin_required
def add_family():
    conn = get_db_connection()
    cursor = conn.cursor()
    rel_id = get_or_create_id(cursor, 'Relationships', 'RelID', request.form.get('relationship'))

    # Auto-generate portal account for family member
    username = f"{request.form['first_name']}{request.form.get('criminal_id')}".lower().replace(' ', '')
    hashed_pw = generate_password_hash('password')
    
    try:
        cursor.execute("""
            INSERT INTO system_users (username, password_hash, role) 
            OUTPUT INSERTED.user_id
            VALUES (?, ?, 'User')
        """, username, hashed_pw)
        user_id_row = cursor.fetchone()
        user_id = user_id_row[0] if user_id_row else None
    except Exception as e:
        user_id = None

    cursor.execute("""
        INSERT INTO FamilyMember (FirstName, LastName, RelID, PhoneNumber, Address, CriminalID, IsCooperating, user_id)
        VALUES (?, ?, ?, ?, ?, ?, 1, ?)
    """, request.form['first_name'], request.form['last_name'], rel_id, 
        request.form.get('phone'), request.form.get('address'), request.form.get('criminal_id'), user_id)
    conn.commit()
    conn.close()
    flash(f"Family Member added! Auto-generated login -> Username: {username} | Password: password", "success")
    return redirect('/family')


# =========================
# 7. COURT (Court3)
# =========================
@app.route('/courts')
@login_required
def courts():
    search_query = request.args.get('q', '')
    conn = get_db_connection()
    cursor = conn.cursor()
    
    sql = """
        SELECT c.*, t.Name AS CourtType, l.City, l.State, l.Address, cr.CaseTitle 
        FROM Court3 c
        LEFT JOIN CourtTypes t ON c.CourtTypeID = t.TypeID
        LEFT JOIN Locations l ON c.LocationID = l.LocationID
        LEFT JOIN CaseRecord cr ON c.CourtID = cr.CourtID
    """
    params = []
    if search_query:
        sql += " WHERE c.Name LIKE ? OR l.City LIKE ? OR l.Address LIKE ? "
        params = [f'%{search_query}%', f'%{search_query}%', f'%{search_query}%']
        
    sql += " ORDER BY c.CourtID DESC"
    cursor.execute(sql, *params)
    data = rows_to_dicts(cursor)
    conn.close()
    return render_template('courts.html', data=data, search_query=search_query)

@app.route('/delete_court/<int:court_id>')
@admin_required
def delete_court(court_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Court3 WHERE CourtID = ?", (court_id,))
    conn.commit()
    conn.close()
    flash("Court record deleted.", "success")
    return redirect('/courts')

@app.route('/add_court', methods=['POST'])
@admin_required
def add_court():
    conn = get_db_connection()
    cursor = conn.cursor()
    type_id = get_or_create_id(cursor, 'CourtTypes', 'TypeID', request.form.get('court_type'))
    loc_id = get_or_create_location(cursor, request.form.get('address'), request.form.get('city'), request.form.get('state'))

    cursor.execute("""
        INSERT INTO Court3 (CourtName, CourtTypeID, LocationID, JudgeName, PhoneNumber)
        VALUES (?, ?, ?, ?, ?)
    """, request.form['court_name'], type_id, loc_id, request.form.get('judge_name'), request.form.get('phone'))
    conn.commit()
    conn.close()
    flash("Court entry added successfully!", "success")
    return redirect('/courts')


if __name__ == '__main__':
    app.run(debug=True)
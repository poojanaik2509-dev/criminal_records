# criminal_records system 
# Crime Records Management System (CRMS)

A professional Database Management System (DBMS) built with **Python Flask** and **Microsoft SQL Server**, featuring a fully normalized **3rd Normal Form (3NF)** database architecture.

##  Features
- **Role-Based Access Control**: Separate views for Admin (Police/Staff) and Regular Users (Family/Public).
- **Criminal Dossier System**: Detailed criminal history tracking, including personal info, crimes, and case records.
- **Normalized DB Architecture**: Implemented 3NF to ensure data integrity and zero redundancy.
- **Legal & Judicial Tracking**: Manage police officers, lawyers, court hearings, and case verdicts in one place.
- **Search & Filter**: Real-time search for criminals, cases, and legal entities.

##  Technology Stack
- **Backend**: Python (Flask)
- **Database**: Microsoft SQL Server (Transact-SQL)
- **Frontend**: HTML5, Vanilla CSS3 (Glassmorphism UI), FontAwesome 6 icons
- **ORM/Driver**: PyODBC

##  Project Structure
- `appp.py`: The core Flask application backend.
- `database_3nf.sql`: The complete database schema and sample data.
- `templates/`: Folder containing all HTML5 view templates.

## ⚙️ Setup & Installation

1. **Database Setup**:
   - Open SQL Server Management Studio (SSMS).
   - Execute the `database_3nf.sql` script to create the `dbmsmini3` database and populate tables.

2. **Python Dependencies**:
   ```bash
   pip install flask pyodbc werkzeug
   ```

3. **Running the Application**:
   ```bash
   python appp.py
   ```
   The app will be available at `http://127.0.0.1:5000`.

##  Default Credentials
| Role | Username | Password |
| :--- | :--- | :--- |
| **Admin** | `Admin` | `password` |
| **User** | `User` | `password` |

---
*Developed as part of a DBMS Mini Project.*


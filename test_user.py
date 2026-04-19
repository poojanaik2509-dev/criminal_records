import pyodbc
def test():
    try:
        conn = pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};Server=localhost\\SQLEXPRESS;Database=dbmsmini3;Trusted_Connection=yes;')
        cursor = conn.cursor()
        cursor.execute("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'system_users'")
        print("system_users Columns:", [row[0] for row in cursor.fetchall()])
        conn.close()
    except Exception as e:
        print("Error:", str(e))
if __name__ == '__main__':
    test()

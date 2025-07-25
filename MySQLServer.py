import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL Server
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='Shofunlayo@21'
    )

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    # Close cursor and connection
    if 'cursor' in locals() and cursor:
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()

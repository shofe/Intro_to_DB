import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server (without database)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Shofunlayo@21"
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Create database using CREATE DATABASE IF NOT EXISTS
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as err:
        print(f"Error: {err}")

    finally:
        # Ensure everything is properly closed
        if 'cursor' in locals():
            cursor.close()
        if connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_database()

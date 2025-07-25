import mysql.connector

alx_book_store = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Shofunlayo@21",
    database="alx_book_store"
)

mycursor = alx_book_store.cursor()

"""Creating the author's table"""
mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Authors(
    author_id INT AUTO_INCREMENT PRIMARY KEY, 
    author_name VARCHAR(215) NOT NULL 
)
""")
print("Author's table created!")

mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Books(
    book_id INT AUTO_INCREMENT PRIMARY KEY, 
    title VARCHAR(130) NOT NULL, 
    author_id INT,
    FOREIGN KEY(author_id) REFERENCES Authors(author_id), 
    price DOUBLE,
    publication_date DATE 
)
""")
print("Book's table created!")

mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY, 
    customer_name VARCHAR(215) NOT NULL, 
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT NOT NULL
)
""")
print("Customer's table created!")

mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY, 
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    order_date DATE
)
""")
print("Order's table created!")


mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Order_Details(
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY, 
    order_id INT, 
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    quantity DOUBLE
)
""")
print("OrderDetail's table created!")


# Close cursor and connection
mycursor.close()
alx_book_store.close()


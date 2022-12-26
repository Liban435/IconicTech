import mysql.connector
import configparser

class Database:
    def __init__(self):
        # Read the configuration file
        config = configparser.ConfigParser()
        config.read("PL/config.ini")

        # Get the MySQL connection details from the configuration file
        mysql_config = config["mysql"]

        # Open a connection to the database
        self.db = mysql.connector.connect(
            host=mysql_config["host"],
            user=mysql_config["user"],
            password=mysql_config["password"],
            database=mysql_config["database"]
        )

        # Create a cursor to execute queries
        self.cursor = self.db.cursor()

    def execute_query(self, sql):
        self.cursor.execute(sql)
        return self.cursor

    def commit(self):
        self.db.commit()

    def rollback(self):
        self.db.rollback()

    def close(self):
        self.db.close()
        self.cursor.close()

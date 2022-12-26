import sys
sys.path.append("./DAL")
sys.path.append("./Schema")
sys.path.append("./PL")

import configparser
import mysql.connector
from tkinter import *
from tkinter import ttk
from DAL.database import Database
from Schema.queries import Queries
from PL.gui import GUI

def main():
    # Create the main window
    root = Tk()
    root.title("Iconic Tech")

    # Connect to the database
    db = Database()

    # Create the Queries object
    queries = Queries()

    # Create the GUI object and pass in the main window and database objects
    app = GUI(root, queries, db)

    # Start the GUI event loop
    root.mainloop()

if __name__ == "__main__":
    main()

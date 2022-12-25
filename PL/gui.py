import tkinter as tk

class GUI:
    def __init__(self, master, queries, db):
        self.master = master
        self.queries = queries
        self.db = db

        # Create a frame to hold the main menu
        frame = tk.Frame(self.master)
        frame.pack()

        # Create the main menu
        self.main_menu = tk.Menu(self.master)
        self.master.config(menu=self.main_menu)

        # Create the File menu
        file_menu = tk.Menu(self.main_menu)
        self.main_menu.add_cascade(label="File", menu=file_menu)
        file_menu.add_command(label="Exit", command=self.exit)

        # Create the Reports menu
        reports_menu = tk.Menu(self.main_menu)
        self.main_menu.add_cascade(label="Reports", menu=reports_menu)
        reports_menu.add_command(label="Total Sales", command=self.show_total_sales)
        reports_menu.add_command(label="Technician with Most Fixes", command=self.show_technician_with_most_fixes)
        reports_menu.add_command(label="Profits by Cashier", command=self.show_profits_by_cashier)
        reports_menu.add_command(label="Customer with Most Visits", command=self.show_customer_with_most_visits)

    def exit(self):
        self.master.destroy()

    def show_total_sales(self):
        # Get the SQL query for finding the total sales
        sql = self.queries.get_total_sales()

        # Execute the query using the Database class
        cursor = self.db.execute_query(sql)

        # Loop through the results and display them in a message box
        for (total_sales,) in cursor:
            message = f"Total sales: ${total_sales}"
            break
        tk.messagebox.showinfo("Total Sales", message)
            

    def show_technician_with_most_fixes(self):
        # Get the SQL query for finding the technician with the most fixes
        sql = self.queries.get_technician_with_most_fixes()

        # Execute the query using the Database class
        cursor = self.db.execute_query(sql)

        # Loop through the results and display them in a message box
        for (name, count) in cursor:
            message = f"{name} fixed {count} devices"
            break
        tk.messagebox.showinfo("Technician with Most Fixes", message)
            

    def show_profits_by_cashier(self):
        # Get the SQL query for showing the profits by cashier
        sql = self.queries.get_profits_by_cashier()

        # Execute the query using the Database class
        cursor = self.db.execute_query(sql)

        # Loop through the results and display them in a message box
        message = ""
        for (name, profit) in cursor:
            message += f"{name} generated ${profit} in profit\n"
            break
        tk.messagebox.showinfo("Profits by Cashier", message)
            

    def show_customer_with_most_visits(self):
        # Get the SQL query for finding the customer with the most visits
        sql = self.queries.get_customer_with_most_visits()

        # Execute the query using the Database class
        cursor = self.db.execute_query(sql)

        # Loop through the results and display them in a message box
        for (name, count) in cursor:
            message = f"{name} visited the store {count} times"
            break
        tk.messagebox.showinfo("Customer with Most Visits", message)
            


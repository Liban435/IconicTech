# Import the necessary modules
import signal
import os
import ctypes
import tkinter as tk

# Declare the process variable as a global variable
process = None

# Create the main window
root = tk.Tk()

# Create a label to display the welcome message
label = tk.Label(root, text="Welcome to the Iconic Tech Application:")
label.pack()

# Create a function to handle the user's selection
def handle_selection(choice):
  # Set a timeout of 10 seconds for the C program
  signal.alarm(10)

  # Set the SIGALRM signal handler
  signal.signal(signal.SIGALRM, sigalrm_handler)

  # Load the C program as a dynamic library
  lib = ctypes.CDLL("./Main")

  # Call the main function of the C program
  result = lib.main(ctypes.c_int(choice))

  # Convert the result from a C int to a Python int
  result = ctypes.c_int(result).value

  # Check the return code of the C program
  if result != 0:
    print("C program returned with code:", result)
  else:
    # Read the output of the C program
    output = process.stdout.read()

    # Decode the output from bytes to string
    output_str = output.decode()

    # Display the output in the GUI
    label.config(text=output_str)


# Define a signal handler for the SIGALRM signal
def sigalrm_handler(signum, frame):
  # Kill the C program
  global process
  os.kill(process.pid, signal.SIGKILL)

# Create a button for each menu option
button0 = tk.Button(root, text="0) Exit", command=lambda: handle_selection(0))
button1 = tk.Button(root, text="1) What is The Total Sales?", command=lambda: handle_selection(1))
button2 = tk.Button(root, text="2) Which Technician Fixed the Most Devices?", command=lambda: handle_selection(2))
button3 = tk.Button(root, text="3) Show The Profits Generated by the Cashier", command=lambda: handle_selection(3))
button4 = tk.Button(root, text="4) Which Customer Came To Our Store The Most?", command=lambda: handle_selection(4))
button5 = tk.Button(root, text="5) What is the Total Profit on October 1, 2022?", command=lambda: handle_selection(5))
button6 = tk.Button(root, text="6) What is the Total Customers that shopped in October?", command=lambda: handle_selection(6))
button7 = tk.Button(root, text="7) What is the Most Expensive Product?", command=lambda: handle_selection(7))
button8 = tk.Button(root, text="8) Which Employees Don't Fix Devices?", command=lambda: handle_selection(8))
button9 = tk.Button(root, text="9) Show Customers With an Email", command=lambda: handle_selection(9))
button10 = tk.Button(root, text="10) Show all the iPhone Products and Services", command=lambda: handle_selection(10))

# Pack the buttons into the window
button0.pack()
button1.pack()
button2.pack()
button3.pack()
button4.pack()
button5.pack()
button6.pack()
button7.pack()
button8.pack()
button9.pack()
button10.pack()

# Start the event loop
root.mainloop()
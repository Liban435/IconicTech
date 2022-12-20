# IconicTech
A Data Base Management Software Custom Built for a Small Mom and Pop shop

To Run This Application Using Mac OS Terminal

Use command   ls   to see the current space in memory

Use command   cd    "Folder Name" to navigate to the correct folder where the files are located


Then run the following commands in the terminal:

gcc IconicTech.c -o Main -l sqlite3
./Main

Running the program in terminal is critical so that you will create an executable file called Main. That is needed to run the Python GUI.

To run Python GUI make sure you have the latest python version and tkinter installed for it to run

1. Install Homebrew using the instructions given in the site homepage
2. brew install python3  
3. brew install python-tk
4. python3 gui.py        



Again Make Sure you run IconicTech.c before running the Python GUI. 

The reason is that when connecting Python to C 

"./Main" is the file being passed not the C file.



The Python GUI unfortunately is not highly functional, it shows the 10 Queries but when you click it, runs the C program in terminal and if you want to run the queries you have to do it the same way as the C program by typing in the terminal.

That's why I will be converting C to Python to remove that connection step and directly access the database from the GUI.


Due to issues connecting C with Python, I will be translating the program to Python and MySql

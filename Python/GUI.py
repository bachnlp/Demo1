import tkinter as tk
from tkinter import *
'''root = tk.Tk()
w = Label(root,text="Hello tkinter!")
w.pack()
root.mainloop()'''
#-----------------------------------------
'''root = tk.Tk()
v = tk.IntVar()
tk.Label(root,
         text="Choose:",
         justify = tk.LEFT,
         padx=20).pack()
tk.Radiobutton(root,
               text="Python",
               padx=20,
               variable=v,
               value=1).pack(anchor=tk.W)
tk.Radiobutton(root,
               text="Perl",
               padx=20,
               variable=v,
               value=2).pack(anchor=tk.W)
root.mainloop()'''
#-----------------------------------------
'''root = tk.Tk()
var1 = tk.IntVar()
tk.Checkbutton(root,
                 text="male",
                 variable=var1).grid(row=0,
                                     sticky=tk.W)
var2 = tk.IntVar()
tk.Checkbutton(root,
               text="female",
               variable=var2).grid(row=3,
                                   sticky=tk.W)
root.mainloop()'''
#-----------------------------------------
'''def show_entries():
    print("First_Name: %s\nLast_Name: %s" % (e1.get(),e2.get()))
root=tk.Tk()
tk.Label(root,text="First Name").grid(row=0)
tk.Label(root,text="Last Name").grid(row=1)
e1=tk.Entry(root)
e2=tk.Entry(root)
e1.grid(row=0,column=1)
e2.grid(row=1,column=1)
tk.Button(root,
          text="Quit",
          command=root.quit).grid(row=3,
                                  column=0,
                                  sticky=tk.W,
                                  pady=4)
tk.Button(root,
          text="Show",
          command=show_entries).grid(row=3,
                                     column=1,
                                     sticky=tk.W,
                                     pady=4)
root.mainloop()'''
#-----------------------------------------
'''import numpy as np
print(f"Array_10_zero:\n{np.zeros(10)}")
print(f"Array_10_one:\n{np.ones(10)*5}")'''
#-----------------------------------------
import numpy as np
arr = ([[1,2],[3,4]])
print(f"answer:\n{np.linalg.eig(arr)}")
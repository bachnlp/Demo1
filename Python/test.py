import numpy as np
import random
'''# Create a 1D array
array_1 = np.array([[1, 2, 3, 4, 5], [2, 3, 4, 5, 6], [3, 4, 5, 6, 7]])
print(array_1)
print(array_1.shape)
print(array_1.ndim)'''
#-------------------------------------------------------------------------------
'''c = np.zeros((3, 4))
print(f"\n array initial with all zeros: \n{c}")
print(np.full((3, 3), 6))
print(np.full((3, 3), 6, dtype = 'complex'))'''
#-------------------------------------------------------------------------------
'''print(np.arange(0, 20, 1))
'''
#--------------------------------------------------------------------------------
'''arr = np.array([[[1, 2, 0, 4],
                [4, 5, 6, 0],
                [2, 0, 7, 8],
                [3, 7, 4, 2]]])
print(arr[0][2][2])
print(arr[0][1:3][1:3])'''
#--------------------------------------------------------------------------------
'''a = np.array([1, 2, 3])
b = np.array([4, 5, 6])
print(f"addition: {a + b}")
print(f"Sum: {np.sum(a)}\nMin: {np.min(a)}\nMax: {np.max(a)}")'''
#--------------------------------------------------------------------------------
'''lst = [4, 5, 7, 9, 1]
a = np.array(lst)
print(f"Mean: {np.mean(a)}\nMedian: {np.median(a)}\nStandard Deviation: {np.std(a)}}")'''
#--------------------------------------------------------------------------------
'''a = np.array([[1, 2],
              [3, 4]])
b = np.array([[5, 6],
              [7, 8]])
# dot product
#print(f"Dot product:\n {np.dot(a, b)}")
print(f"Dot product:\n {a @ b}")
# Transpose
print(f"Transpose of a: \n {np.transpose(a)}")'''
#--------------------------------------------------------------------------------
#RESHAPING AN ARRAY
'''a = np.arange(6)
print(a)
print(a.reshape(1, 6))
print(a.reshape(6, 1))
print(a.reshape(2, 3))
print(a.reshape(3, 2, 1))'''
#--------------------------------------------------------------------------------
# CONCATENATING ARRAYS
'''a = np.array([[1, 2],
              [3, 4]])
b = np.array([[4, 5],
              [3, 6]])
c = np.array([[4],
              [5]])
print(np.concatenate((a, b), axis = 0))
print(np.concatenate((a, b), axis = 1))
print(np.concatenate((a, c), axis = 1))'''
#--------------------------------------------------------------------------------
# SPLITTING ARRAYS
'''a = np.array([1, 2, 3, 4, 5, 6])
b = np.split(a, 6)
print(b)'''
#--------------------------------------------------------------------------------
# RANDOM INTEGER NUMBERS
'''print(np.random.rand(2, 3))
print(np.random.randint(0, 40))
print(np.random.randn(2, 3))'''
#----------------------------------------------------------------------------------
# DETERMINANT
'''a = np.array([[1, 2, 5],
              [3, 4, 1],
              [1, 5, 6]])
d = np.linalg.det(a)
print(d)'''
#----------------------------------------------------------------------------------
# EXERCISE
'''class matrix:
    def __init__(self, data = None):
        self.data = data
    def initial_matrix(self,  x = None, y = None):
        return self.data.reshape(x, y)    
data = np.arange(0, 9)
matrix1 = matrix(data)
M = matrix1.initial_matrix(3, 3)
print(f"\n Matrix 3x3 is:\n {M}")   ''' 
#--------------------------------------------------------------------------------------
import pandas as pd
import numpy as np
'''lst = [1, 3, 5, 7, 9]
dn = {'a':1, 'b':3, 'c':5, 'd':7, 'e':9}
s1 = pd.Series(lst)
s2 = pd.Series([1, 3, 5, 7, 9], index = ['I', 'II', 'III', 'IV', 'V', 'VI'])
s3 = pd.Series(dn)
print(s2)'''
# ------------------------------------------------------------------
#retrieving the values of Series
'''s3 = pd.Series({'a': 1, 'b': 3, 'c': 5, 'd': 7, 'e': 9})
print(s3)
print(s3.loc['e']) #s.Loc[index]

#To access multiple elements of a Series, we can pass a list of indices 
print(s3.loc[['a', 'c', 'e']]) #pass a list of indices'''
# --------------------------------------------------------------------
#Extracting elements using iloc
'''s3 = pd.Series({'a': 1, 'b': 3, 'c': 5,'e': 9})
print(s3)'''
# --------------------------------------------------------------------
#Creating a Datafream from a dictionary
'''import pandas as pd
data = {
    'Name': ['John', 'Anna', 'Peter'],
    'Age':[28,24,22],
    'Height': [1.7, 1.75, 1.8]
}
#print(data)
df1 = pd.Dataframe(data)
print(df1)'''
# --------------------------------------------------------------------
# Creating a Dataframe from a dictionary with custom index
'''data = {
    'Name': ['John', 'Anna', 'Peter'],
    'Age':[28,24,22],
    'Height': [1.7, 1.75, 1.8]
}
df2 = pd.DataFrame(data, index = ['a', 'b', 'c'])
df3 = pd.DataFrame(data, index = ['a', 'b', 'c'])
df3.columns = ['Newname', 'Newage']
print(df2)'''
# --------------------------------------------------------------------
'''data = {
    'Name': ['John', 'Anna', 'Peter'],
    'Age':[28,24,22]
}
df3 = pd.DataFrame(data, index = ['a', 'b', 'c'])
df3.columns = ['Newname', 'Newage']
print(df3)'''
# --------------------------------------------------------------------
'''s1 = pd.Series([1, 3, 5, 7, 9])
s2 = pd.Series([2, 4, 6, 8, 10])
df4 = pd.DataFrame({'odd':s1, 'even':s2})
print(df4)'''
# --------------------------------------------------------------------
'''import pandas as pd
import numpy as np
data = {
    'Name': ['John', 'Anna', 'Peter'],
    'Age':[28,24,22],
    'height' : [1.75, 1.65, 1.80],
    'weight' : [70, 55, 80],
}
#print(f'Dataframe:\n{pd.DataFrame(data)}')
#print(f'Height:\n{pd.DataFrame(['name', 'age'])}')
# Slicing row and selecting columns by name
df = pd.DataFrame(data)
sliced_df = df[['Name', 'Age']][1:3]
print(sliced_df)
# select rows by a condition
filtered_df = df[df['height'] > 1.7]
print(filtered_df)
# Select a row by label
print(filtered_df.loc['a']) # return a series
print(filtered_df.loc[['a', 'c']]) # return a Dataframe
# Selecting a row based on a condition
print(df.loc[df['height' > 1.7]]) # return a Dataframe
# Selecting a single row by index
print(df.iloc[0]) # returns a series
# selecting multiple rows by index
print(df.iloc[[0, 2]]) # return a dataframe'''

# ------------------------------------------------------------------------------------------
# Read CSV
data = {
    'Name': ['John', 'Anna', 'Peter'],
    'Age':[28,24,22],
    'height' : [1.75, 1.65, 1.80],
    'weight' : [70, 55, 80],
}
df3 = pd.DataFrame(data)
df3.to_csv('data.csv', index = False) # index = False to avoid writing rows
# Reading a CSV file into a Dataframe
df4 = pd.read_csv('data.csv')
print(df4)
# Writing a DataFrame to an excel file
df3.to_excel('data.xlsx', index = False)
df4 = pd.read_excel('data.xlsx')
print(df4)
# Deleting a column from a dataframe
df3.drop('BMI', axis = 1, inplace = True)
print(df3)
# Rename column
df3.rename(columns = {'age':'Tuoi'}, inplace = True)
print(df3)
# fix index
df3['height'] = df3['height'].apply(lambda x: x*100)
print(df3)
# Add more missing values to the dataframe
df3.loc[2, 'age'] = np.nan # np.nan represents a missing value
df3.loc[0, 'height'] = np.nan
df3.loc[2, 'weight'] = np.nan
print(df3)
# Filling missing values
df3.fillna(10.0, inplace = True) # inplace = True to fill the missing values in-place
print(df3)
# Dropping rows with missing values
df3.dropna(inplace = True) # inplace = True to drop the rows with missing values in-place
print(df3)

# ------------------------------------------------------------------------------------------
# BASIC STATICTICAL FUNCTION
# Find mean
# Find median
# Find standard deviation

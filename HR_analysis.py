import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# 1.How to load data in csv
employees = pd.read_csv('employees.csv')
departments = pd.read_csv('departments.csv')

# 2. Data cleaning
print("Missing values in Employees table:\n", employees.isnull().sum())

# filling null values salaries with given salaries
employees['salary'] = employees['salary'].fillna(employees['salary'].mean())

# 3. Data visualization (Salary Distribution)
plt.figure(figsize=(10, 6))
sns.histplot(employees['salary'], kde=True, color='blue')
plt.title('Employee Salary Distribution')
plt.xlabel('Salary')
plt.ylabel('Count')
plt.savefig('salary_distribution.png')
plt.show()


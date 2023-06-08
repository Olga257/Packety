import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

data = pd.read_csv("titanic.csv")

print(data.columns, data["Sex"].head())
print('\n\n')
print(data)
print('\n\n')
colors = sns.color_palette('pastel')[ 0:5 ]

data['Pclass'] = data['Pclass'].replace({1: 'VIP', 2: 'Middle', 3: 'Working'})
table = pd.crosstab(data['Survived'], data['Pclass'])
print(table)
print('\n\n')
data['Price_Category'] = data['Fare'].apply(lambda fare: 'cheap' if fare < 25 else 'expensive')

alive_data = data[data['Survived'] == 1]
dead_data = data[data['Survived'] == 0]

filtered_data = data[(data['Price_Category'].isin(['cheap', 'expensive'])) & (data['Survived'].isin([0, 1]))]

counts = filtered_data.groupby(['Price_Category', 'Survived']).size().reset_index(name='count')

dead_data = data[data['Survived'] == 0]
alive_data = data[data['Survived'] == 1]

dead_counts = dead_data['Sex'].value_counts()
alive_counts = alive_data['Sex'].value_counts()

plt.pie(dead_counts.values, labels=dead_counts.index, colors = colors)
plt.title('Dead by Gender')
plt.show()
plt.pie(alive_counts.values, labels=alive_counts.index, colors = colors)
plt.title('Alive by Gender')
plt.show()


import pandas as pd

# -----------------------------------------
# exercise_01:
# Load provided dataset including following columns: imię,
# nazwisko, rok urodzenia, miesiac urodzenia, dzień urodzenia, miejsce
# urodzenia, miasto oddziału, departament, rok rozpoczecia pracy, miesiac
# rozpoczęcia pracy, dzień rozpoczęcia pracy, doswiadczenie (w latach).

data = pd.read_csv('dataset_pandas_pd.csv', header=None,
                   names=['name', 'surname', 'year_ob', 'month_ob', 'day_ob',
                          'city_ob', 'branch_city', 'department',
                          'year_work_start', 'month_work_start',
                          'day_work_start', 'years_experience'])
# print(data)

# -----------------------------------------

# exercise_02:
# Which surname is most common?

most_common_surname = data.value_counts('surname')
# print(most_common_surname)

# ans: 'Abacki - 7 times'

# -----------------------------------------

# exercise_03:
# add 'sex' column after 'surname' representing sex of the person

data.insert(2, 'sex', data['name'].apply(lambda x: 'female' if x[-1] == 'a' else
                                                    'male'))

# print(data.iloc[:, :5])

# -----------------------------------------

# exercise_04:
# sort data according to surname and year of birth for the same surnames

data = data.sort_values(by=['surname', 'year_ob'], ignore_index=True)


# print(data)

# -----------------------------------------

# exercise_05:
# add new column 'exp_desc' applying following values depending on
# experience: Junior (experience up to 3y), Mid (from 4 to 8), Senior (from 9
# to 12) and Expert (13+)

def experience(x):
    if x <= 3:
        return 'Junior'
    elif x <= 8:
        return 'Mid'
    elif x <= 12:
        return 'Senior'
    else:
        return 'Expert'


data['exp_desc'] = data['years_experience'].apply(experience)

# print(data)

# -----------------------------------------

# exercise_06: there are null values in column 'year_work_start'. Fill
# lacking data with average for experience range defined in previous task

data['year_work_start'] = data['year_work_start'].fillna(data.groupby(
    'exp_desc')['year_work_start'].transform('mean').round(0))

# print(data)

# -----------------------------------------

# exercise_07: which branch employs the most Data Scientists?

# print(data[['department', 'branch_city']].groupby([data['department'] ==
#                                                    'Data Science',
#                                                    'branch_city']).count())



# ans: Krakow

# -----------------------------------------

# exercise_08: rename departments according to the below: 'Software
# Development' -> 'Software Development Team', 'HR' -> 'Human Resources',
# 'Data Science' -> 'Data Analytics'

data['department'] = data['department']\
                        .replace({'Software Development': 'Software Development'
                                                          ' Team',
                                  'HR': 'Human Resources',
                                  'Data Science': 'Data Analytics'})

# print(data)

# -----------------------------------------

# exercise_09: which city does employ most people on Senior level

# print(data[['branch_city', 'exp_desc']].groupby([data['exp_desc'] == 'Senior',
#                                                 'branch_city']).count())

# ans: Krakow

# -----------------------------------------

# exercise_10: which city employs the most women on junor level

# print(data[['branch_city', 'sex', 'exp_desc']][data['sex'] == 'female']
#       .groupby(['exp_desc', 'branch_city']).count())

# ans: there is no Junior females in dataset

#  alternative solution for female & Seniors
# print(data[['branch_city', 'sex']]
#       [(data['sex'] == 'female') & (data['exp_desc'] == 'Senior')]
#       .groupby('branch_city').count())

# -----------------------------------------

# exercise_11: how many women born before 1975 is employed in Krakow office at
# mid level?
print(data)

print(data.iloc[:, :2]
      [(data['sex'] == 'female') & (data['year_ob'] < 1975)
       & (data['branch_city'] == 'Krakow') & (data['exp_desc'] == 'Mid')])

# ans: there are no women at Mid level that work in Kraków and was born
# before 1975
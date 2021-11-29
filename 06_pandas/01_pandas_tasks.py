import pandas as pd

    # exercise_01.py:Load provided dataset including following columns: imię,
    # nazwisko, rok urodzenia, miesiac urodzenia, dzień urodzenia, miejsce
    # urodzenia, miasto oddziału, departament, rok rozpoczecia pracy, miesiac
    # rozpoczęcia pracy, dzień rozpoczęcia pracy, doswiadczenie (w latach).

data = pd.read_csv('dataset_pandas_pd.csv', header=None,
                   names=['name', 'surname', 'year_ob', 'month_ob', 'day_ob',
                          'city_ob', 'branch_city', 'department',
                          'year_work_start', 'month_work_start',
                          'day_work_start', 'years_experience'])
# print(data)

    # exercise_02.py: Which surname is most common?

most_common_surname = data.value_counts('surname')
# print(most_common_surname)

    # ans: 'Abacki - 7 times'




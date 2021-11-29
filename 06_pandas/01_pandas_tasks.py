import pandas as pd

    # exercise_01.py:Load provided dataset including following columns: imię,
    # nazwisko, rok urodzenia, miesiac urodzenia, dzień urodzenia, miejsce
    # urodzenia, miasto oddziału, departament, miesiac rozpoczęcia pracy,
    # dzień rozpoczęcia pracy, doswiadczenie (w latach)

data = pd.read_csv('dataset_pandas_pd.csv')

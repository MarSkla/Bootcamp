print('\nexercise_06.py:\n\ttake several countries and create separate '
      'dictionaries for each of them (name, area, population, GDP) and build '
      'a function able to sort data (list of all dictionaries) in the '
      'following order: (a) area, (b) population, (c) density, (d) GDP')
print()  # empty line for better readability

gdp_1 = {'name': 'Quatar', 'area': 11586, 'population': 2042444, 'GDP': 130475}
gdp_2 = {'name': 'Switzerland', 'area': 41285, 'population': 8526932,
         'GDP': 64649}
gdp_3 = {'name': 'Poland', 'area': 312696, 'population': 38386000, 'GDP': 31939}
gdp_4 = {'name': 'Barbados', 'area': 430, 'population': 294560, 'GDP': 18534}
gdp_5 = {'name': 'Taiwan', 'area': 35980, 'population': 23545963, 'GDP': 53023}
gdp_6 = {'name': 'Mozambique', 'area': 799380, 'population': 26573706,
         'GDP': 1291}
gdp_7 = {'name': 'Nilfgaard', 'area': 312696, 'population': 25000000,
         'GDP': 53699}
gdp_8 = {'name': 'Harlan\'s World', 'area': 312696, 'population': 25000000,
         'GDP': 25987}

gdp = [gdp_1, gdp_2, gdp_3, gdp_4, gdp_5, gdp_6, gdp_7, gdp_8]


def sort_on_key(lst, dict_key):
    for country_dict in lst:
        country_dict['density'] = round(country_dict['population']
                                        / country_dict['area'], 2)
    sorted_lst = sorted(lst, key=lambda lst: lst[dict_key])
    for element in sorted_lst:
        print(element)


sort_on_key(gdp, 'GDP')

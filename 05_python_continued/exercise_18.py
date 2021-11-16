print("\nexercise_18.py:\n\tBuild Class 'Song' (accepting a list of strings "
      "representing single verse of the song) that consist 'sing' method "
      "that print full text", end="\n\n")


class Song:

    def __init__(self, list):
        self.list = list

    def sing(self):
        print(*self.list, sep="\n")
        
        
# song1 = Song(["jakis tekst", "jakiś tekst 2", "jakiś tekst 3"])
#
# song1.sing()


class Song_alternative:


    def __init__(self):
        self.rows_num = int(input("How many rows would you like to add? : "))
        self.song_text = [input("Add text: ") for x in range(self.rows_num)]

    def sing_alternative(self):
        print(*self.song_text, sep="\n")
        # print(self.song_text)


piosenka = Song_alternative()

piosenka.sing_alternative()
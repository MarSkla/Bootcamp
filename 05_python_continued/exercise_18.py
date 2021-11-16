print("\nexercise_18.py:\n\tBuild Class 'Song' (accepting a list of strings "
      "representing single verse of the song) that consist 'sing' method "
      "that print full text", end="\n\n")


class Song:

    def __init__(self, list):
        self.list = list

    def sing(self):
        print(*self.list, sep="\n")
        
        
song1 = Song(["jakis tekst", "jakiś tekst 2", "jakiś tekst 3"])

song1.sing()
# OOP
class DA:
    def __init__(self, name, position, workyear, skill):
        self.name = name
        self.position = position
        self.workyear = workyear
        self.skill = skill

    def upskill(self, newskill):
        print(f"I'm learning {newskill} to upskill. ")
        self.skill = newskill

    def year_passed(self, year):
        self.workyear += year
        if year == 1:
            print(f"{year} year has passed. ")
        else:
            print(f"{year} years has passed. ")

    def promoted(self):
        if self.workyear >= 10 and self.skill != "":
            self.position = "Manager"
        elif self.workyear >= 8 and self.skill != "":
            self.position = "Supervisor"
        elif self.workyear >= 5 or self.skill != "":
            self.position = "Senior"
        else:
            self.position = "Junior"

# input data
da1 = DA("Tinkwinky", "Supervisor", 8, "Coding")
da2 = DA("Dipsy", "Senior", 5, "")
da3 = DA("Lala", "Junior", 3, "")
da4 = DA("Po", "Jonior", 1, "")

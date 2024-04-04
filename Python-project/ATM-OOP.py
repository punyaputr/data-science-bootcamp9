# import module
from random import randint

class ATM:
    def __init__(self, account_name, bank_name, initial):
        self.account_name = account_name
        self.bank_name = bank_name
        self.balance = initial

    # string representation
    def __str__(self):
        return f"This is an account od {self.account_name}, bank: {self.bank_name}"

    # method => function
    def check_balance(self):
        print(f"Balance: {self.balance} THB")

    def deposit(self, money):
        self.balance += money
        print(f"Deposit successfully: your new balance: {self.balance} THB")

    def withdraw(self, money):
        self.balance -= money
        print(f"Withdraw successfully: your new balance: {self.balance} THB")

    def get_OTP(self):
        otp = randint(1000, 9999)
        print(f"Your OTP: {otp} This OTP will be available in the next 2 minutes")

    def transfer(self, money, account_number):
        self.balance -= money
        print(f"Your transfer {money} THB to {account_number} is successfull")
        print(f"Your new balance: {self.balance} THB")

    def payment (self, money, bill_number):
        self.balance -= money
        print(f"Your payment {money} THB to {bill_number} is successfull")
        print(f"Your new balance: {self.balance} THB")

## Create List of Hand
hand = ["Rock", "Paper", "Scissors"]

## Import Random code
import random

## Create random bot hand
def rand_bot_hand():
    return random.choice(hand)

## Create game function
def game():
    print("🎉 Welcome to Rock Paper Scissors game! ")
    username = (input("▶️ Please insert your name. ").lower()).capitalize()
    print(f"Hi! {username}. ")
    user_score = 0
    bot_score = 0

    # starting
    while True:
        print("Do you want to starting now?")
        print("📌 1 = Yes, 2 = No")
        start = int(input())
        if start == 2:
            print(f"Thank you {username} for visit us. ")
            break
        elif start == 1:
            print(f"OK! {username} Let's play together. ")
            print("Please select your hand.")
            print("📌 1 = Rock, 2 = Paper, 3 = Scissors")

            # user choose hand & score
            while True:
                user_hand = hand[int(input()) - 1]
                if user_hand not in hand:
                    print("Invalid choice!")
                    continue
                bot_hand = rand_bot_hand()
                print(f"😀 {username} choose: " + user_hand)
                print("🤖 Bot choose: " + bot_hand)
                if bot_hand == user_hand:
                    print("Draw! 😐")
                elif bot_hand == hand[0] and user_hand == hand[1]:
                    user_score += 1
                    print("Win! 🤗")
                elif bot_hand == hand[1] and user_hand == hand[2]:
                    user_score += 1
                    print("Win! 🤗")
                elif bot_hand == hand[2] and user_hand == hand[0]:
                    user_score += 1
                    print("Win! 🤗")
                else:
                    bot_score += 1
                    print("Lose! 😭")

                # ask for continue
                print("Do you want to continue playing?")
                print("📌 1 = Yes, 2 = No")
                end = int(input())
                if end == 1:
                    print("Let's choose the next hand ")
                    print("📌 1 = Rock, 2 = Paper, 3 = Scissors")
                elif end == 2:
                    print(f"😀 {username}'s score is: {user_score} ")
                    print(f"🤖 Bot's score is: {bot_score} ")
                    if user_score < bot_score:
                        print("You Lose! 😂")
                    elif user_score > bot_score:
                        print("You Win! 🏆")
                    else:
                        print("You Draw! 👻")
                    break
                else:
                    print("Invalid choice! ❌")

            # quiting game text
            print("🎊 Thanks for your playing. See you next time!")
            break
        else:
            print("💢 Invalid choice! Please try again. ")

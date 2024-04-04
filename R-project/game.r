game <- function () {

 ##Start
    print(" Welcome to our game!")
    flush.console()
    username <- readline("Please fill in Username : ")
    print(paste("Hi", username , ", Let's play together!"))

 ##Scores
    bot_score <- 0
    player_score <- 0

 ##Variables
    hands <- c("✊" , "📃" , "✂️")


    while (TRUE) {
        print("1 = 🔨 , 2 = 📃 , 3 = ✂️ , 0 = Quit")
        bot_hand <- sample(hands , 1)
        flush.console()
        player_nums <- readline("▶️ Please select the number : ")
        player_hand <- if (player_nums == 1) {
            print("🔨")
        } else if (player_nums == 2) {
            print("📃")
        } else if (player_nums == 3) {
            print("✂️")
        } else if (player_nums ==0) {
            print("Quit")
        } else {
            print("⁉️ Error! Please try another number")
        }
        ##Condition
            ## Draw
        if (player_hand == bot_hand) {
            print(paste("You choose" , player_hand , "vs" , "Bot choose" , bot_hand))
            print("Draw")
            print(paste("Score : Your score =" , player_score , ", Bot score =" , bot_score))
        } else if (
            ## Win
            (player_hand == "🔨" & bot_hand == "✂️") |
            (player_hand == "✂️" & bot_hand == "📃") |
            (player_hand == "📃" & bot_hand =="🔨")
        ) {
            print(paste("You choose" , player_hand , "vs" , "Bot choose" , bot_hand))
            player_score <- player_score + 1
            print("Win")
            print(paste("Score : Your score =" , player_score , ", Bot score =" , bot_score))
        } else if (
            ## Lose
            (player_hand == "🔨" & bot_hand == "📃") |
            (player_hand == "✂️" & bot_hand == "🔨") |
            (player_hand == "📃" & bot_hand =="✂️")
        ) {
            print(paste("You choose" , player_hand , "vs" , "Bot choose" , bot_hand))
            bot_score <-bot_score + 1
            print("Lose")
            print(paste("Score : Your score =" , player_score , ", Bot score =" , bot_score))
        }
        if (player_hand == "Quit") {
            print(paste("Score : Your score =" , player_score , ", Bot score =" , bot_score))
            if (player_score > bot_score) {
                print("YOU WIN")
            } else if (player_score < bot_score) {
                print("YOU LOSE")
            } else {
                print ("DRAW")
            }
            print("OK, see you later!")
            break
        }
 }
}

##menus
df_menu <- data.frame(
    name = c( "Hawaiian" , "Margherita" , "Seafood" , "Pepperoni" , "Carbonara" , "Bolognese" ) ,
    type = c( rep ("Pizza",4) , rep ("Pasta",2) ) ,
    price = c( 139 , 129 , 119 , 149 , 129 , 119 )
)

##size
df_size <- data.frame(
    size = c( "S" , "M" , "L") ,
    inch = c( 6 , 9 , 11) ,
    piece = c( 4 , 6 , 8) ,
    add_price = c(0 , 100 ,180)
)

##total
total_price <- 0
total_order <- 0

pizza_chatbot <- function() {

##Greeting
    print("Welcome to Pizza Restaurant🍕")
    flush.console()
    cus_name <- readline("Please insert your name : ")
    print(paste("Hello", cus_name , "We would like to suggest our menu"))
    print(df_menu)

##order
    while(TRUE) {
        flush.console()
        orders <- readline("▶️Which No. do you want? : ")

    ##type condition
        if  (orders >=5 & orders <= 6) {
            print(paste("ํYou order" , df_menu[orders , 2] , df_menu[orders, 1] ))
            ##confirm menu
            flush.console()
            confirm <- readline("✔️Confirm this menu? (1 = ⭕️Yes , 2 = ❌No) : ")
            if (confirm ==1) {
                print("We add this menu to your order✅")
                total_price <- total_price + df_menu[orders , 3]
                total_order <- total_order + 1
                #Anything
                flush.console()
                add_order <- readline("❓Anything else? (1 = ⭕️Yes , 2 = ❌No) : ")
                if (add_order == 1) {
                    print(df_menu)
                } else if (add_order == 2 ) {
                    break
                }
            } else if (confirm == 2) {
                print("That's fine😄")
            }
        } else if (orders >=1) {
            print(df_size)
            flush.console()
            pz_size <- readline("❔Which size do you want? : ")
            print(paste("ํYou order" , df_menu[orders , 2] , df_menu[orders, 1] , "size" , df_size[ df_size$size == pz_size , 1 ]))
            ##confirm menu
            flush.console()
            confirm <- readline("✔️Confirm this menu? (1 = ⭕️Yes , 2 = ❌No) : ")
            if (confirm == 1) {
                print("We add this menu to your order✅")
                total_price <- total_price + df_menu[orders , 3] + df_size[df_size$size == pz_size , 4]
                total_order <- total_order + 1
                 #Anything
                flush.console()
                add_order <- readline("❓Anything else? (1 = ⭕️Yes , 2 = ❌No) : ")
                if (add_order == 1) {
                    print(df_menu)
                } else if (add_order == 2 ) {
                    break
                }
            } else if (confirm == 2) {
                print("That's fine😄")
            }
        }  else {
            print("Please try another number")
            print(df_menu)
        }
    }

    ##Sumorder
    print(paste("Now you have" , total_order , "in your order"))
    print(paste0("It's $" , total_price))

    ##delivery fees
    if (total_price >= 500) {
        print(paste("You're so Lucky🎉," , cus_name))
        print("You get free delivery fees in this order")
    } else {
        print("This order have $30 delivery fees")
        total_price <- total_price + 30
        print(paste0("Now, it's $" , total_price))
    }
    ##address
    print("Well, please give me your address")
    flush.console()
    cus_add <- readline("Your address is : ")

    ##end
    print(paste("Please prepare your money $" , total_price , "Our rider will arrive in 30 minute"))
    print("Thank you for your order😁")
}

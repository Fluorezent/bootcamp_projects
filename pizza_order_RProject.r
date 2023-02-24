# hw 1 -> write script with 5-10 dialogues of user interaction
# aka basic chatbot
# ordering pizza -> maybe count the ingredients, tell if it is out of stock?
# then do the order summary

print("Welcome to our app!")
print("Hello There!")

#interaction 1
print("What is your name?")
  username <- readLines("stdin", n=1)

#interaction 2
print(paste("Hi", username))
print("What would you like for today?")
print("Type the numbers to proceed further")

while (action2 <-1) {
  print("1. Pizza, 2. Beverage")
    action <- readLines("stdin", n=1)
    if (action == 1) {
      #pizza size
      print("Choose the size of the pizza")
      print("Small: 4 slides, for 2 people")
      print("Medium: 6 slides, for 3-4 people")
      print("Large: 8 slides, for 4+ people")
      size <- readLines("stdin", n=1)
  
      #topping
      print("Alright, what would the topping be?")
      print("Cheese Blizzard")
      print("Shrimp Cocktail")
      print("Onion Forest")
      topping <- readLines("stdin", n=1)
    
      print(paste("You have ordered ", size, " and with ", topping, " topping"))
    } else if (action ==2) {
          #beverage
          print("Choose the beverage of your likings")
          print("Diet Coke")
          print("Sprite")
          print("Lime Tea")
          drink <- readLines("stdin", n=1)
          
          print(paste("You ordered", drink))
    } else {
      print("Error, please try again")
      next
    }
  
  #change the loop behavior
    print("Do you want to order another pizza/drink?")
    print("1. Back to order page, 2. Check out")
      action2 <- readLines("stdin", n=1)
        if (action2 == 2){
          print("Check out")
          break
    }
}

print("How would you like to pay?")
print("1. Credit card or 2. Cash?")
  payment <- readLines("stdin", n=1)
  if (payment == 1){
    print("Credit card")
  } else if (payment == 2) {
    print("cash")}
print(paste("Please input your full name, ", username))
fullname <- readLines("stdin", n=1)
print("Please fill your phone number")
phoneno <- readLines("stdin", n=1)
print(paste("Thank you for your purchase, ", fullname, " Your phone number is ", phoneno))


print("Your order is confirmed and will be processed soon. Thank you for choosing us!")

            
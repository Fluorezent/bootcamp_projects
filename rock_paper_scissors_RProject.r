#Homework 2 -> rock paper scissor
#unlimited of times -> but "Q" to quit
#return the final summary for the game (W? L? Draw?)

print("Welcome to the rock paper scissors game!!")
print("What is your name?!")
username <- readLines("stdin", n=1)

print(paste("Hi, ", username, " are you ready?"))
print("Y: Yes, N: No")
  rdy <- readLines("stdin", n=1)

win <- 0
loss <- 0
tie <- 0

  if (rdy == "Y") {
    print("Let's get started")
    print(" - - - - - - - - - - ")
  }

while (rdy == "Y") {
  print("Choose your move")
  print("1. rock, 2. paper, 3. scissors")
  choose <- readLines("stdin", n=1)
  if (choose == 1) {
    print ("You chose rock")
  } else if (choose == 2) {
    print("You chose paper")
  } else if (choose == 3) {
    print("You chose scissors")
  } else {
    print("Choose again")
    next
  }


syst <- c("rock", "paper", "scissors")
syst1 <- sample(syst, 1)

print(paste("System has chosen ", syst1))

#tie cases
if (syst1 == 'rock' & choose == 1) {
  print("You tied")
  tie <- tie +1
  
} else if (syst1 == 'paper' & choose == 2) {
  print("You tied")
  tie <- tie +1
  
} else if (syst1 == 'scissors' & choose == 3) {
  print("You tied")
  tie <- tie+1

#lose cases
} else if (syst1 == 'rock' & choose == 2) {
  print("You lose")
  loss <- loss +1
  
} else if (syst1 == 'paper' & choose == 3) {
  print("You lose")
  loss <- loss +1
  
} else if (syst1 == 'scissors' & choose == 1) {
  print("You lose")
  loss <- loss +1

#win cases
} else if (syst1 == 'rock' & choose == 3) {
  print("You won")
  win <- win +1
  
} else if (syst1 == 'paper' & choose == 1) {
  print("You won")
  win <- win +1
  
} else if (syst1 == 'scissors' & choose == 2) {
  print("You won")
  win <- win +1
}

print("Would you like to play again?")
print("Y: yes, N: no")
  rdy <- readLines("stdin", n = 1)

  if (rdy == "N") {
    break
  }
  
}

if (rdy == 'N') {
  print("Total score")
  print(paste("You won = ", win, " times"))
  print(paste("You tied = ", tie, " times"))
  print(paste("You lose = ", loss, " times"))
}
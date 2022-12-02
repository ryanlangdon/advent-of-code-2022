rm(list = ls())

## Advent of code - day 2

## Rock paper scissors tournament
## X = rock = 1
## Y = paper = 2
## Z = scissors = 3
## A = rock
## B = paper
## C = scissors

## Win = 6 points
## Draw = 3 points
## Loss = 0 points

## How many points total would you get if everything went according to the strategy guide

library(data.table)
strategy_guide <- fread("../Downloads/strategy_guide.txt", header = F)

## I'm sure there's a better way of doing this than manually calculating permutations, buttttt
## It is what it is, I've had a long day
strategy_guide$outcome <- NA

## Rock
strategy_guide$outcome[which(strategy_guide$V1 == "A" & strategy_guide$V2 == "Y")] <- 6
strategy_guide$outcome[which(strategy_guide$V1 == "A" & strategy_guide$V2 == "X")] <- 3
strategy_guide$outcome[which(strategy_guide$V1 == "A" & strategy_guide$V2 == "Z")] <- 0

## Paper
strategy_guide$outcome[which(strategy_guide$V1 == "B" & strategy_guide$V2 == "Z")] <- 6
strategy_guide$outcome[which(strategy_guide$V1 == "B" & strategy_guide$V2 == "Y")] <- 3
strategy_guide$outcome[which(strategy_guide$V1 == "B" & strategy_guide$V2 == "X")] <- 0

## Scissors
strategy_guide$outcome[which(strategy_guide$V1 == "C" & strategy_guide$V2 == "X")] <- 6
strategy_guide$outcome[which(strategy_guide$V1 == "C" & strategy_guide$V2 == "Z")] <- 3
strategy_guide$outcome[which(strategy_guide$V1 == "C" & strategy_guide$V2 == "Y")] <- 0

## Score for selection
strategy_guide$selection <- strategy_guide$V2
strategy_guide$selection[which(strategy_guide$V2 == "X")] <- 1
strategy_guide$selection[which(strategy_guide$V2 == "Y")] <- 2
strategy_guide$selection[which(strategy_guide$V2 == "Z")] <- 3

## Final score
final_score <- sum(as.numeric(strategy_guide$outcome), as.numeric(strategy_guide$selection))

## A = rock
## B = paper
## C = scissors

## But now:
## X means need to lose
## Y means need to draw
## Z means need to win

strategy_guide$response <- NA

## Rock
strategy_guide$response[which(strategy_guide$V1 == "A" & strategy_guide$V2 == "X")] <- "C" 
strategy_guide$response[which(strategy_guide$V1 == "A" & strategy_guide$V2 == "Y")] <- "A"
strategy_guide$response[which(strategy_guide$V1 == "A" & strategy_guide$V2 == "Z")] <- "B"

## Paper
strategy_guide$response[which(strategy_guide$V1 == "B" & strategy_guide$V2 == "X")] <- "A"
strategy_guide$response[which(strategy_guide$V1 == "B" & strategy_guide$V2 == "Y")] <- "B"
strategy_guide$response[which(strategy_guide$V1 == "B" & strategy_guide$V2 == "Z")] <- "C"

## Scissors
strategy_guide$response[which(strategy_guide$V1 == "C" & strategy_guide$V2 == "X")] <- "B"
strategy_guide$response[which(strategy_guide$V1 == "C" & strategy_guide$V2 == "Z")] <- "A"
strategy_guide$response[which(strategy_guide$V1 == "C" & strategy_guide$V2 == "Y")] <- "C"

## Points
strategy_guide$points <- NA

strategy_guide$points[which(strategy_guide$response == "A" & strategy_guide$V2 == "X")] <- 1 ## Rock loses = 1 point
strategy_guide$points[which(strategy_guide$response == "B" & strategy_guide$V2 == "X")] <- 2 ## Paper loses = 2 points
strategy_guide$points[which(strategy_guide$response == "C" & strategy_guide$V2 == "X")] <- 3 ## Scissors loses = 3 points

strategy_guide$points[which(strategy_guide$response == "A" & strategy_guide$V2 == "Y")] <- 4 ## Rock draws = 4 points
strategy_guide$points[which(strategy_guide$response == "B" & strategy_guide$V2 == "Y")] <- 5 ## Paper draws = 5 points
strategy_guide$points[which(strategy_guide$response == "C" & strategy_guide$V2 == "Y")] <- 6 ## Scissors draws = 6 points

strategy_guide$points[which(strategy_guide$response == "A" & strategy_guide$V2 == "Z")] <- 7 ## Rock wins = 7 points
strategy_guide$points[which(strategy_guide$response == "B" & strategy_guide$V2 == "Z")] <- 8 ## Paper wins = 8 points
strategy_guide$points[which(strategy_guide$response == "C" & strategy_guide$V2 == "Z")] <- 9 ## Scissors wins = 9 points

sum(strategy_guide$points)
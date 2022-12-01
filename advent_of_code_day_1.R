rm(list = ls())

## Advent of code day 1
## Find the elf carrying the most calories of food from a big-ass list

## Elves are denoted by breaks in the list
## Need to handle different lengths between breaks and sum them
## Probably need to keep track of ID/number too

## Had to download my list and save as .txt... Unsure how to use the Advent of Code login through R :shrug:

calorie_list <- readLines("../Downloads/calorie_list.txt") ## Read from "webpage" to a character vector
splitAt <- function(x, pos) unname(split(x, cumsum(seq_along(x) %in% pos))) ## Use function to add uneven vector lengths to a list at cut-points
calorie_list <- splitAt(x = calorie_list, pos = which(calorie_list == "")) ## Specify cut-points as "", which is R's 'blankspace' from readLines

total_calories <- lapply(calorie_list, as.numeric) ## Previously had to be character for the cut-points to work
total_calories <- lapply(total_calories, sum, na.rm=TRUE) ## Add together all the numbers between blank lines
max(unlist(total_calories)) ## Get highest

## Now take top 3...
sum(unlist(total_calories)[order(unlist(total_calories), decreasing = TRUE)[1:3]]) ## Look, it's not elegant but it works so shh
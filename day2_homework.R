# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R

#Read
Mortality <- rbind(read.csv(unzip("Data/Morticd10_part2.zip"), header = TRUE),
                   read.csv(unzip("Data/Morticd10_part1.zip"), header = TRUE),
                   read.csv(unzip("Data/morticd9.zip"), header = TRUE),
                   read.csv(unzip("Data/morticd08.zip"), header = TRUE),
                   read.csv(unzip("Data/morticd07.zip"), header = TRUE))
save (Mortality, file = "Data/Mortality.RData")

Population <- read.csv(unzip("Data/Pop.zip"))
save(Population, file = "Data/Population.RData")

load("Data/Mortality.RData")
load("Data/Population.RData")

#Question 1: I want to add a new variable that identifies the source table of each observation before merging all the data.
  #What is the best way to do that?

#Question 2: Is there a way to see that the program is still running a command?


# 2. Peek at the top few rows
load("Data/Mortality.RData")
head(Mortality)

# 3. Peek at the top few rows for only a few columns
head(Mortality[,1:4], 4)

# 4. How many rows does your data have?
nrow(Mortality)

#Answer: 4,820,616

# 5. Get a summary for every column
summary(Mortality)

# 6. Get a summary for one column
summary(Mortality[,"Deaths1"])
summary(Mortality[,10])

#Each line corresponds to the number of deaths for each cause, for each country, for each year.

# 7. Are any of the columns giving you unexpected values?

#Each line corresponds to the number of deaths for each cause, for each country, for each year. All values are within expected range.

# 8. Select a few key columns, make a vector of the column names

#Using Country, Year, Cause and Deaths1

Mortality[0,]
Mortality[0,c(1,4,6,10)]

# 9. Create a new data.frame with just that subset of columns
MortalityCut <- Mortality[,c(1,4,6,10)]
head(MortalityCut)

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step
MortalityHead <- head(MortalityCut,10)
MortalityHead

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample
?sample
MortalityRandom <- MortalityCut[sample(nrow(MortalityCut),nrow(MortalityCut)/2),]
head(MortalityRandom)

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it


?sort
?t.test
?order
?subset

View(Mortality)
table(Mortality$Sex)

t.test(Mortality$Deaths1 ~ Mortality$Sex==1,2)

#My attempt to run the t.test using the vector
  #I was unable to replicate the findings between both t-tests.
    #I do not know exactly why.

MortalityOrder <- Mortality[order(Mortality$Sex),]
table(MortalityOrder$Sex)
sum(2464941,2338643)
MortalityOrder$Sex[2464940:2464941]
MortalityOrder$Sex[4803584:4803585]

t.test(MortalityOrder$Deaths1[1:2464940], 
       MortalityOrder$Deaths1[2464941:4803584])

#Answer: I do not believe I need a non-default test

# 13. Repeat #12 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise

#The command keeps breaking, so I will take smaller random sample
MortalitySample <- Mortality[sample(nrow(Mortality),200),]

cor(MortalitySample$Deaths1, 
    MortalitySample$IM_Deaths1, 
    method = "pearson")
cor(MortalitySample$Deaths1, 
    MortalitySample$IM_Deaths1, 
    method = "spearman")


# 14. Save all results from #12 and #13 in an .RData file

Result_TTest <- t.test(Mortality$Deaths1 ~ Mortality$Sex==1,2)

Result_CorP <- cor(MortalitySample$Deaths1, 
                   MortalitySample$IM_Deaths1, 
                   method = "pearson")

Result_CorS <- cor(MortalitySample$Deaths1, 
                   MortalitySample$IM_Deaths1, 
                   method = "spearman")


save (Result_TTest, Result_CorP, Result_CorS,file = "day02_results.RData")

rm(Result_TTest, Result_CorP, Result_CorS)

load ("day02_results.RData")

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link

# 1. Run t-tests with the "iris" data set
#    - compare sepal width
#    - all three pairwise comparisons (i.e., between the three species)

head(iris)
View(iris)
summary(iris)

?t.test
?pairwise.t.test

pairwise.t.test(iris$Sepal.Width, iris$Species)

t.test (iris$Sepal.Width [1:100]~ iris$Species[1:100])
t.test (iris$Sepal.Width [51:150]~ iris$Species[51:150])
t.test (iris$Sepal.Width [c(1:50,101:150)]~ iris$Species[c(1:50,101:150)])

# 2. Find the overall correlation between Sepal.Length and Petal.Length
cor(iris$Sepal.Length,iris$Petal.Length)

# 3. Get the correlation between Sepal.Length and Petal.Length for each Species
#    separately
?cor
cor (iris$Sepal.Length [1:50], iris$Petal.Length[1:50])
cor (iris$Sepal.Length [51:100], iris$Petal.Length[51:100])
cor (iris$Sepal.Length [101:150], iris$Petal.Length[101:150])

# 4. Look at the built-in data set ToothGrowth. Use a t-test to compare tooth
#    lengths in the different supplement types.

summary(ToothGrowth)

t.test(ToothGrowth$len ~ ToothGrowth$supp)


# 5. Re-run #4 t-test as a true "Student's" t-test, not a Welch. Re-run it again
#    as a paired t-test.
#    HINT: read the help file carefully!
?t.test

t.test(ToothGrowth$len ~ ToothGrowth$supp, var.equal = TRUE)
t.test(ToothGrowth$len ~ ToothGrowth$supp, paired = TRUE)

# 6. Run a Wilcoxon Signed Rank test for the same comparisons in #1
#    - use help.search to find a function to do this
wilcox.test (iris$Sepal.Width [1:100]~ iris$Species[1:100])
wilcox.test (iris$Sepal.Width [51:150]~ iris$Species[51:150])
wilcox.test (iris$Sepal.Width [c(1:50,101:150)]~ iris$Species[c(1:50,101:150)])


# 7. Save all results (and only those results!) in an
#    .RData object
#    - try to think of (at least) two ways to do this
results <- wilcox.test (iris$Sepal.Width [1:100]~ iris$Species[1:100])

?save

save(results, file = "../Assingments/day2_practice.RData")
results

# 8. Clean, comment, and save this script with your answers

# 9. Look at the format of your Homework data set
#     - find a function to read in your data
#     - needed for tonight's Homework

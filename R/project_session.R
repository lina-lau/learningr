
weight_kilo<-10
# Comment: Use Alt-Minus (-) to make <-
weight_kilo

# Vectors: Character
c("a", "b")
# Numeric
c (1,2)
# Logic
c (TRUE, FALSE)

# Data frame
head(iris)
colnames(iris)
str(iris)
summary(iris)

library(styler)
install.packages("lintr")
library(lintr)

# Exercise ----------------------------------------------------------------
# Object names
DayOne
dayone
T <- FALSE
c <- 9
mean <- function(x) sum(x)

# Spacing
x[, 1]
x[, 1]
x[, 1]
mean(x, na.rm = TRUE)
mean(x, na.rm = TRUE)
function(x) {}
function(x) {}
height <- feet * 12 + inches
mean(x, na.rm = 10)
sqrt(x^2 + y^2)
df$ z
x <- 1:10

# Indenting
if (y < 0 && debug) {
  message("Y is negative")
}


# Functions ---------------------------------------------------------------

sd
lm

add_two <- function(x,y) {
  added <- x+y
  return(added)#"return" is a command
}
add_two(1,2)
add_two(y=2, x=1)

source(here::here("R/package_loading.R"))

# Save data ---------------------------------------------------------------

write_csv(iris, here::here("data/iris.csv"))
imported_iris <- read_csv(here::here("data/iris.csv"))
glimpse(imported_iris)

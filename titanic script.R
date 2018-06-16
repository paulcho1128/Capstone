install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)

# Load the data in RStudio
my.data <- read.csv(file.choose(),header = T)
my.data

# Port of embarkation
my.data <- my.data%>% mutate(embarked = replace(embarked, embarked %in% c(""), "S"))
my.data
data1 <- my.data[150:200, 10:13]
data1

# Age

data.age <- mean(my.data$age, na.rm = TRUE)
data.age


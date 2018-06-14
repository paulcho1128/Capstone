install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)

my.data <- read.csv(file.choose(),header = T)
my.data

# cleaning brand names
my.data <- my.data%>% mutate(company = replace(company, company %in% c("Phillips", "phillips","phillps","fillips","phillipS","phlips"),"philips"))
my.data
my.data <- my.data%>% mutate(company = replace(company, company %in% c("Akzo","ak zo","akz0","AKZO"),"akzo"))
my.data
my.data <- my.data%>% mutate(company = replace(company, company %in% c("Van Houten","van Houten"),"van houten"))
my.data 
my.data <- my.data%>% mutate(company = replace(company, company %in% c("unilver"),"unilever"))
my.data

# seperate product code and number
my.data <- my.data %>% separate('Product.code...number', c("product_code","product_number"),sep="-")
my.data

# adding product categories
product_vec <- c(p = "Smartphone", v = "TV", x = "Laptop", q = "Tablet")
my.data <- my.data %>% mutate(product_category = product_vec[product_code])
my.data

# geocoding
address_vec <- c(address, city, country)

my.data <- my.data %>% unite("full_address", c(address,city,country), sep = ",")
my.data

# dummy variables
my.data <- my.data%>%mutate(company_philips = ifelse(company == "philips", 1, 0))
my.data <- my.data%>%mutate(company_akzo = ifelse(company == "akzo", 1, 0))
my.data <- my.data%>%mutate(company_van_houten = ifelse(company == "van houten", 1, 0))
my.data <- my.data%>%mutate(company_unilever = ifelse(company == "unilever", 1, 0))
my.data <- my.data%>%mutate(product_smartphone = ifelse(product_code == "p", 1, 0))
my.data <- my.data%>%mutate(product_tv = ifelse(product_code == "v", 1, 0))
my.data <- my.data%>%mutate(product_laptop = ifelse(product_code == "x", 1, 0))
my.data <- my.data%>%mutate(product_tablet = ifelse(product_code == "q", 1, 0))
my.data

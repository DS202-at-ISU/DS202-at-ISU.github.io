url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
download.file(url, "ames-liquor.rds", mode="wb")
ames <- readRDS("ames-liquor.rds")


# Your turn

# Check the help for the function parse_number in the readr package and 
# use it on the store location. 
# What result do you get?

small <- ames %>% head(10)
small$`Store Location`  

parse_number(small$`Store Location`) # first number
# Use separate to split the variable for store location into longitude and latitude. (Hint - you might need several steps of separate)

small %>% select(`Store Location`) %>%
  separate(remove = FALSE,
           col=`Store Location`, sep=" ", 
           into=c("toss-it", "Latitude", "Longitude")) 

small %>% select(`Store Location`) %>%
  separate(remove = FALSE,
           col=`Store Location`, sep=" ", 
           into=c("toss-it", "Latitude", "Longitude")) %>%
  select(-`toss-it`)

ames <- ames %>% 
  separate(remove = FALSE,
           col=`Store Location`, sep=" ", 
           into=c("toss-it", "Latitude", "Longitude")) %>%
  select(-`toss-it`)

# Make sure that latitude and longitude are numeric variables.

ames <- ames %>% mutate(
  Latitude = parse_number(Latitude),
  Longitude = parse_number(Longitude)
)

ames %>% head(10000) %>%
  ggplot(aes(x = Latitude, y = Longitude)) +
  geom_point() +
  geom_text(aes(label=`Store Name`))

# Your turn

# What is the single largest sale (in volume/in dollar amount)?
ames %>% arrange(desc(`Sale (Dollars)`)) %>% head()

# What is the total amount spent on Liquor Sales?
ames  %>% summarize(total = sum(`Sale (Dollars)`, na.rm = TRUE))

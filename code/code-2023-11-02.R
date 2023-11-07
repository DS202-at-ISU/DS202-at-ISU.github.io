library(tidyverse)

today <- mdy("11-02-2023")
today
class(today)

today + days(10)
# today * 2

# url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
# download.file(url, "data/ames-liquor.rds", mode="wb")
ames <- readRDS("data/ames-liquor.rds")

ames$Date <- mdy(ames$Date)

result <- ames %>% 
  group_by(Date) %>% 
  summarise(
    total_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  )
mean(result$total_sales)
result

seq(mdy("10-23-2023"), mdy("10-31-2023"), by = 1)

result2 <- ames %>% 
  complete(
    Date = seq(from=ymd("2012-01-01"), 
               to=ymd("2022-09-29"), 
               by = 'day')
  ) %>% 
  group_by(Date) %>% 
  summarise(
    total_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  )
result2
mean(result2$total_sales)

##################
# layers
data("iris")
iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()

ggplot(data=iris,
       aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()

ggplot() +
  geom_point(data = iris,
             aes(x = Sepal.Length, y = Sepal.Width))

# install.packages("GGally")
data(nasa, package="GGally")

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_smooth(method="lm", se=FALSE) +
  geom_text(aes(label = time, x = date+weeks(4)), 
            nasa %>% filter(id=="1-1", temperature > 298))




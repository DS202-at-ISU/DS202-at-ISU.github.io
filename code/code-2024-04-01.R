library(tidyverse)

ames <- readRDS("data/ames-liquor.rds")

ames$Date <- mdy(ames$Date)

result <- ames %>% 
  group_by(Date) %>% 
  summarise(
    total_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  )
mean(result$total_sales)

result

seq(mdy("03/25/2024"), mdy("04/01/2024"),
    by = 1)

seq.Date(mdy("03/25/2024"), mdy("04/01/2024"),
         by = 1)

ames %>% 
  complete(
    Date = seq(from=ymd("2012-01-01"), 
               to=ymd("2022-09-29"), 
               by = 'day')
  ) %>% 
  group_by(Date) %>% 
  summarise(
    total_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  ) %>% 
  pull(total_sales) %>% 
  mean()



# layers

data(nasa, package="GGally")

df <- nasa %>% filter(id=="1-1")

df %>%
  ggplot(aes(x = date, y= temperature)) + 
  geom_point()

ggplot(df, aes(x = date, y = temperature)) +
  geom_point()

ggplot(df, aes(x = date, y = temperature)) +
  geom_point(df, aes(x = date, y = temperature))

ggplot(df, aes(x = date, y = temperature)) +
  geom_point()

ggplot(df, aes(x = date, y = temperature)) +
  geom_point(df, aes(x = date, y = temperature)) +
  geom_line(df, aes(x = date, y = temperature))

ggplot(df, aes(x = date, y = temperature)) +
  geom_point() +
  geom_line() +
  geom_smooth(method="lm", se=TRUE) +
  geom_text(aes(label = time, x = date+weeks(4)))

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = time, y= temperature)) + geom_point() +
  geom_line() +
  geom_text(aes(label=id, colour=id),  
            data=nasa %>% filter(id=="1-1", time==50))

nasa %>% filter(id=="1-1", time < 10) %>% 
  ggplot(aes(x = time, y = temperature)) +
  geom_col() +
  geom_line() +
  geom_text(aes(label = temperature))









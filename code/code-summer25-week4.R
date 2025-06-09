library(classdata)
library(tidyverse)

head(happy)
str(happy)
?happy
summary(happy)

dim(happy)

View(happy)

happy$nhappy <- NA
happy$nhappy[happy$happy == 'not too happy'] <- 1
happy$nhappy[happy$happy == 'pretty happy'] <- 2
happy$nhappy[happy$happy == 'very happy'] <- 3

mean(happy$nhappy, na.rm = TRUE)

happy <- happy |> 
  mutate(
    nhappy2 = case_when(
      happy == 'not too happy' ~ 1,
      happy == 'pretty happy' ~ 2,
      happy == 'very happy' ~ 3,
      TRUE ~ NA
    )
  )
mean(happy$nhappy2, na.rm = TRUE)

# a value to represent the happiness level
# for each year
happy |> 
  group_by(year) |> 
  summarise(
    happy_score = mean(nhappy, na.rm = TRUE)
  ) |> 
  ggplot(aes(x = year, y = happy_score)) +
  geom_line()

happy |> 
  group_by(year, sex) |> 
  summarise(
    happy_score = mean(nhappy, na.rm = TRUE)
  ) |>
  ggplot(aes(x = year, y = happy_score,
             color = sex)) +
  geom_line()

happy |> 
  group_by(age, sex) |> 
  summarise(
    happy_score = mean(nhappy, na.rm = TRUE)
  ) |>
  filter(!is.na(sex)) |> 
  ggplot(aes(x = age, y = happy_score,
             color = sex)) +
  geom_line()

happy |> 
  group_by(partyid) |> 
  summarise(
    happy_score = mean(nhappy, na.rm = TRUE)
  ) |> 
  ggplot(aes(x = partyid, y = happy_score)) +
  geom_col() +
  coord_flip()

happy |> 
  group_by(finrela) |> 
  summarise(
    happy_score = mean(nhappy, na.rm = TRUE)
  ) |> 
  ggplot(aes(x = finrela, y = happy_score)) +
  geom_col() +
  coord_flip()

happy |> 
  filter(!is.na(finrela), 
         !is.na(sex)) |> 
  group_by(finrela, sex) |> 
  summarise(
    happy_score = mean(nhappy, na.rm = TRUE)
  ) |> 
  ggplot(aes(x = finrela, y = happy_score,
             fill = sex)) +
  geom_col(position="dodge") +
  coord_flip()
#


var <- c('a', 'a', 'c', 'b', 'c', 'b',
         'a', 'b', 'b', 'c')
var_fac <- factor(var, 
                  levels = c('a', 'b', 'c'))

label_order <- as.numeric(var_fac)
label_order
levels(var_fac)[label_order]

char_var <- c('address1', 'address2', 'address3')
char_var2 <- c('comment1', 'comment2', 'comment3')

# modify levels
levels(var_fac) <- c("apple", 'banana', 'cherry')
levels(var_fac)
var_fac
table(var_fac)

library(classdata)
str(fbi)
summary(fbi$year)
fbi$year_fac <- factor(fbi$year)
summary(fbi$year_fac)

mode(var)
mode(var_fac)

is.factor(var)
is.factor(var_fac)
is.numeric(var_fac)
is.character(var_fac)

fbi$year_fac
as.numeric(fbi$year_fac)
as.numeric(var_fac)

as.numeric(as.character(fbi$year_fac))
fbi$year_fac |> 
  as.character() |> 
  as.numeric()

levels(fbi$year_fac)
levels(var_fac)

# reorder the labels
# explicitly re-specify the labels
var_fac
var_fac2 <- factor(
  var_fac, 
  levels = c('banana', 'cherry', 'apple'))
var_fac2
var_fac3 <- factor(
  var_fac,
  levels = c('bananan', 'cherry', 'apple')
)
var_fac3

# modify the labels
levels(var_fac2)[1] <- "bananan"
var_fac2

levels(var_fac3)
as.numeric(var_fac3)


as.numeric(var_fac)
as.numeric(var_fac2)

fbi$type <- reorder(fbi$type, fbi$count, FUN = median, na.rm=TRUE)
fbi %>% 
  ggplot(aes(x = type, y = log10(count))) + 
  geom_boxplot()

fbiwide |> 
  ggplot(aes(
    x = factor(year),
    y = motor_vehicle_theft
  )) +
  geom_boxplot() +
  coord_flip()

fbiwide |> 
  mutate(
    mvt_rate = motor_vehicle_theft / population * 100000
  ) |> 
  ggplot(aes(x = reorder(state_abbr,
                         mvt_rate,
                         median), 
             y = mvt_rate)) +
  geom_boxplot() +
  coord_flip()

fbiwide |> 
  mutate(
    homicide_rate = homicide / population * 100000
  ) |> 
  ggplot(aes(x = reorder(state_abbr,
                         homicide_rate,
                         median), 
             y = homicide_rate)) +
  geom_boxplot() +
  coord_flip()


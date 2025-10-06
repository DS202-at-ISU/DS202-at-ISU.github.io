library(classdata)
library(tidyverse)

str(happy)
happy$marital
levels(happy$marital)

summary(fbi$year)
fbi$year <- factor(fbi$year)
summary(fbi$year)

data <- tibble(
  wd = c("Mon", "Mon", 
         "Tue", "Tue",
         "Wed", "Thu",
         "Fri", "Sat",
         "Sun", "Sun"),
  value = 1:10
)

data |> 
  ggplot(aes(x = wd)) +
  geom_bar(aes(weight = value))

data$wd <- factor(data$wd)
levels(data$wd)

data$wd <- factor(
  data$wd,
  levels = c("Sun", "Mon", "Tue",
             "Wed", "Thu", "Fri",
             "Sat"))
levels(data$wd)
data |> 
  ggplot(aes(x = wd)) +
  geom_bar(aes(weight = value))

mode(data$wd)
mode(fbi$year)
is.factor(data$wd)
is.factor(fbi$year)
is.numeric(fbi$year)

as.numeric(data$wd)
as.character(fbi$year) |> 
  as.numeric()

levels(data$wd)[1] <- "Sunday"
levels(data$wd)
data$wd
levels(data$wd) <- c('a', 'b', 'c', 'd',
                     'e', 'f', 'g')
levels(data$wd)
data$wd

fbi$type <- factor(fbi$type)
levels(fbi$type)
fbi$type <- reorder(fbi$type,
                    fbi$count, 
                    min,
                    na.rm = TRUE)
levels(fbi$type)
fbi |> 
  ggplot(aes(x = type, y = log10(count))) +
  geom_boxplot()

fbiwide |> 
  ggplot(aes(x = factor(year),
             y = motor_vehicle_theft)) +
  geom_boxplot() +
  coord_flip()

fbiwide |> 
  mutate(
    mvt_rate = motor_vehicle_theft / population * 1000
  ) |> 
  ggplot(aes(x = reorder(state_abbr,
                         mvt_rate,
                         median),
             y = mvt_rate)) +
  geom_boxplot() +
  coord_flip()

generate_boxplot_crime <- function(crime) {
  result <- fbiwide |> 
    mutate(
      crime_rate = .data[[crime]] / population * 1000
    ) |> 
    ggplot(aes(x = reorder(state_abbr,
                           crime_rate,
                           median),
               y = crime_rate)) +
    geom_boxplot() +
    coord_flip() +
    ggtitle(crime) +
    ylab(paste0("log10 of ", crime)) +
    xlab("state")
  
  return(result)
}

generate_boxplot_crime("robbery")
generate_boxplot_crime("homicide")







library(classdata)
library(tidyverse)

head(happy)
View(happy)
str(happy)
summary(happy)
dim(happy)
nrow(happy); ncol(happy)
#

## base R
happy$nhappy <- NA
happy$nhappy[happy$happy == 'not too happy'] <- 1
happy$nhappy[happy$happy == 'pretty happy'] <- 2
happy$nhappy[happy$happy == 'very happy'] <- 3

# mutate
happy <- happy |> 
  mutate(
    nhappy2 = NA,
    nhappy2 = if_else(happy == 'not too happy', 1, nhappy2),
    nhappy2 = if_else(happy == 'pretty happy', 2, nhappy2),
    nhappy2 = if_else(happy == 'very happy', 3, nhappy2)
  ) 

# mutate second option
happy <- happy |> 
  mutate(
    nhappy3 = case_when(
      happy == 'not too happy' ~ 1,
      happy == 'pretty happy' ~ 2,
      happy == 'very happy' ~ 3,
      TRUE ~ NA
    )
  )

identical(happy$nhappy, happy$nhappy2)
identical(happy$nhappy, happy$nhappy3)

# python dict
happy_map <- list(
  "not too happy" = 1,
  "pretty happy" = 2,
  "very happy" = 3
)

happy_map[["not too happy"]]
happy <- happy |>
  mutate(
    nhappy4 = sapply(
      happy, 
      function(e) happy_map[[e]]),
  )


happy <- happy |>
  mutate(
    nhappy4 = sapply(happy, function(e) {
      if(is.na(e)) {
        NA
      } else {
        happy_map[[e]]
      }
    }),
  )

happy <- happy |>
  mutate(
    nhappy4 = sapply(happy, function(e) {
      if(is.na(e)) NA
      else happy_map[[e]]
    }),
  )
identical(happy$nhappy, unlist(happy$nhappy4))
# apply
# sapply
# lapply
# tapply
# vapply

sapply(1:5, function(i) {
  i * 2
})

times_2 <- function(i) {
  i * 2
}
sapply(1:5, times_2)
lapply(1:5, times_2)
sapply(1:10, times_2)


mean(happy$nhappy, na.rm = TRUE)

happy |> 
  group_by(year, sex) |> 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE),
    median_happy = median(nhappy, na.rm = TRUE)
  ) |> 
  ggplot(aes(x = year, y = mean_happy,
             color = sex)) +
  geom_line()
  
happy |> 
  group_by(age, sex) |> 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE),
    median_happy = median(nhappy, na.rm = TRUE)
  ) |> 
  filter(!is.na(sex)) |> 
  ggplot(aes(x = age, y = mean_happy,
             color = sex)) +
  geom_line()

happy |> 
  group_by(partyid) |> 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE)
  ) |> 
  mutate(
    party = case_when(
      str_detect(partyid, "dem") ~ "dem",
      str_detect(partyid, "rep") ~ "rep",
      TRUE ~ "neutral"
    )
  ) |> 
  ggplot(aes(x = partyid, y = mean_happy,
             fill = party)) +
  geom_col() +
  coord_flip() + 
  scale_fill_manual(values = c("blue", "green", "red"))

happy |> 
  group_by(finrela, sex) |> 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE)
  ) |> 
  ggplot(aes(x = finrela, y = mean_happy,
             fill = sex)) +
  geom_col(position = "dodge") +
  coord_flip()

happy |> 
  group_by(marital, health) |> 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE)
  ) |> 
  ggplot(aes(x = health, y = mean_happy,
             fill = marital)) +
  geom_col(position = "dodge") +
  coord_flip()













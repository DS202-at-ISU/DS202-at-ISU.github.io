library(classdata)
head(fbi)
library(dplyr)
cr09 <- dplyr::filter(fbi, Year==2009)
library(ggplot2)
ggplot(data=filter(cr09, Type=="Burglary"), 
       aes(x=Abb, y=Count/Population*70000)) +
  geom_point()

lastfive <- filter(fbi, Year %in% 2010:2014,
                   Type=="Murder.and.nonnegligent.Manslaughter")
head(lastfive)
lastfive$Rate <- lastfive$Count/lastfive$Population*70000
quantile(lastfive$Rate, probs=0.9)
lastfive[lastfive$Rate>quantile(lastfive$Rate, probs=0.9),]

top10 <- filter(lastfive, 
                Rate > quantile(lastfive$Rate, probs=0.9))
ggplot(top10, aes(x = Abb)) + geom_bar()


url <- "https://stat480-at-isu.github.io/materials/01_collaborative-environment/data/gapminder-5060.csv"
gap <- read.csv(url)

str(gap)

filter(gap, lifeExp > 8000)
filter(gap, country=="Canada" & year==1957)

gap$lifeExp <- replace(gap$lifeExp, 
        gap$country=="Canada" & gap$year==1957,
        69.96)

filter(gap, lifeExp == max(gap$lifeExp))
filter(gap, lifeExp == min(gap$lifeExp))


library(classdata)
str(fbi)
summary(fbi$Year)
fbi$Year <- factor(fbi$Year)
summary(fbi$Year)

is.factor(fbi$Abb)
is.character(fbi$Abb)
fbi$Abb <- as.factor(fbi$Abb)
fbi$Abb <- as.character(fbi$Abb)

head(fbi$Year)
fbi$Year <- as.factor(fbi$Year)
fbi$Year <- as.character(fbi$Year)
fbi$Year <- as.numeric(fbi$Year)

levels(fbi$Type)
levels(fbi$Type)[6] <- "Murder"
levels(fbi$Type)[5] <- "Auto.theft"

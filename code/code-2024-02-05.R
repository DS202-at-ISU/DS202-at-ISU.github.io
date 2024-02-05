library(classdata)

?fbi
head(fbi, 10)

fbi$count
mean(fbi$count)
sd(fbi$count)

mean(fbi$count, na.rm = TRUE)
sd(fbi$count, na.rm = TRUE)

mean(c(1, 2, 3, NA))
mean(c(1, 2, 3, NA), na.rm = TRUE)

# define a function to access a data frame by 
# specifying the rows and cols
inspect <- function(df, row, col) {
  df[row, col]
}

fbi[2:3, 4:6]
inspect(fbi, 2:3, 4:6)

# our implementation of head function
my_head <- function(df, row_num) {
  df[1:row_num, ]
}
head(fbi, 3)
my_head(fbi, 3)

?fbiwide
dim(fbi)
dim(fbiwide)
str(fbiwide)

ggplot(fbiwide,
       aes(x = homicide, y = robbery)) +
  geom_point()

# four elements for ggplot2
ggplot() # 1. empty canvas
fbiwide  # 2. data
aes(x = homicide, y = robbery) # 3. aesthetic mapping
geom_point() # 4. geometric element layer

# specify the aes mapping in ggplot() so that 
# this specification is used for all layers
ggplot(aes(x = homicide, y = robbery),
       data = fbiwide) +
  geom_point()

# specify the aes mapping in geom_point() so that
# it's only used for geom_point
ggplot() +
  geom_point(data = fbiwide,
             aes(x = homicide, y = robbery))

# add some transformation
ggplot(data = fbiwide,
       aes(x = (log(burglary)+ 2)/3, 
           y = log(homicide))) +
  geom_point()

# add state for color mapping
# note: state is categorical
ggplot(aes(x = log(burglary), 
           y = log(motor_vehicle_theft),
           colour=state), 
       data=fbiwide) + 
  geom_point()

# add year for color mapping
# note: year is continuous
ggplot(aes(x = log(burglary), 
           y = log(motor_vehicle_theft),
           colour=year), 
       data=fbiwide) +
  geom_point()

# add year for color mapping, but 
# year is now transformed into categorical by `factor()`
ggplot(aes(x = log(burglary), 
           y = log(motor_vehicle_theft),
           colour=factor(year)), 
       data=fbiwide) +
  geom_point()

# add population for size mapping
ggplot(aes(x = log(burglary), 
           y = log(motor_vehicle_theft),
           size=population), 
       data=fbiwide) + 
  geom_point()

ggplot(aes(x = log(burglary), 
           y = log(motor_vehicle_theft),
           size=population,
           color = factor(year)), 
       data=fbiwide) + 
  geom_point() + 
  theme(legend.position = "none")







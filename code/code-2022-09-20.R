library(classdata)

head(fbiwide)

library(ggplot2)

ggplot(data = fbiwide, aes(x = year, y = population)) + 
  geom_point()

ggplot(data = fbiwide, aes(x = year, y = population)) + 
  geom_point() + facet_wrap(~state_abbr)

ggplot(data = fbiwide, aes(x = year, y = motor_vehicle_theft)) + 
  geom_point() + facet_wrap(~state_abbr)

ggplot(data = fbiwide, aes(x = year, 
                           y = motor_vehicle_theft/population*90000)) + 
  geom_point() + facet_wrap(~state) +
  xlim(c(2010, 2020)) +
  ylim(c(0,1000))

ggplot(data = fbiwide, aes(x = year, 
                           y = larceny/population*90000)) + 
  geom_point() + facet_wrap(~state) 


ggplot(data = fbiwide, aes(x = year, 
                           y = log(motor_vehicle_theft))) + 
  geom_point() + facet_wrap(~state) 

ggplot(data = fbiwide, aes(x = year, 
                           y = log10(motor_vehicle_theft))) + 
  geom_point() + facet_wrap(~state) 

ggplot(data = fbiwide, aes(x = year, 
                           y = motor_vehicle_theft)) + 
  geom_point() + facet_wrap(~state) +
  scale_y_log10()


ggplot(data = fbiwide, aes(x = year, 
                           y = motor_vehicle_theft/population*90000)) + 
  geom_boxplot() 

ggplot(data = fbiwide, aes(x = factor(year), 
                           y = motor_vehicle_theft/population*90000)) + 
  geom_boxplot() 


ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=10000) 

ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=1000) 



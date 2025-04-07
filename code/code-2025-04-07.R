library(tidyverse)
library(lubridate)

now()
class(mdy("04-07-2025"))
class("04-07-2025")

ymd("2025-04-07")
dmy("07-04-2025")
my("04-2025")

ames <- readRDS("data/ames-liquor.rds")
summary(ames$Date)

ames$Date <- mdy(ames$Date)
summary(ames$Date)

month(now())
mday(now())
wday(now(), label = TRUE)
wday(now())
week(now())
hour(now())
minute(now())

end_date <- now()
end_date - years(1)
end_date - days(10)
now() + days(10)



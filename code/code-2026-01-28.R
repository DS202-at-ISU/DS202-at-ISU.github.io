library(classdata)
fbi

# question 1
str(fbi)
dim(fbi)
ncol(fbi)
nrow(fbi)

# question 2
# from the result of head function
# we know that ...
head(fbi, n = 10)

# question 3
fbi$count
mean(fbi$count, na.rm = TRUE)
sd(fbi$count, na.rm = TRUE)
# the mean of count is ..., the sd of count is ...
mean(fbi$count, na.rm = T)
sd(fbi$count, na.rm = F)

# question 6
View(fbi)
# boolean vec
check_homicide <- fbi$type == 'homicide' 

homicide_vec <- fbi$count[check_homicide]

View(fbi[check_homicide, ])
homicide_vec <- fbi[check_homicide, "count"]

# question 7
mean(homicide_vec)
sd(homicide_vec)

# question 8
fbi$ratio <- 1
View(fbi)

fbi$ratio <- fbi$count / fbi$population * 10000
View(fbi)

tmp_list <- list(
  1, 2, 3
)
tmp_list

tmp_list2 <- list(
  c(1,2,3),
  c("apple", "banana", "cherry"),
  c(T, F)
)
tmp_list2

tmp_list3 <- list(
  first_ele = c(1,2,3),
  second_ele = c("apple", "banana", "cherry"),
  third_ele = c(T, F)
)
tmp_list3
tmp_list3$first_ele
# tmp_list2$
tmp_list2[[1]]
tmp_list2[[2]]
tmp_list2[[3]]
tmp_list2[1]
tmp_list2[c(1,2)]

# [[1]] -> c(1,2,3)
# [[2]] -> c('a', 'b', 'c')
# [[3]] -> c(T, F)

num_vec <- c(1, 2, 3)
char_vec <- c('a', 'b', 'c')
bool_vec <- c(T, F, T)

my_data <- data.frame(
  num_vec,
  char_vec,
  bool_vec
)
my_data

my_list <- list(
  num_col = num_vec,
  char_col = char_vec,
  bool_col = bool_vec
)
my_list

foo <- function(x) {
  # return(x)
  x
}
foo(1)
foo(2)
foo(x = y <- 3)
y


compute_mean_sd <- function(input_type, na.rm = TRUE) {
  bool_vec <- fbi$type == input_type 
  input_type_count <- fbi$count[bool_vec]
  
  mean_val <- mean(input_type_count, na.rm = na.rm)
  sd_val <- sd(input_type_count, na.rm = na.rm)
  
  result <- data.frame(
    type = input_type,
    mean = mean_val,
    sd = sd_val
  )
  result
}

compute_mean_sd("homicide", na.rm = TRUE)
compute_mean_sd("rape_revised", na.rm = TRUE)

unique(fbi$type)

result1 <- compute_mean_sd("homicide")
result2 <- compute_mean_sd("rape_legacy")
result9 <- compute_mean_sd("arson")
rbind(result1, result2, result9)

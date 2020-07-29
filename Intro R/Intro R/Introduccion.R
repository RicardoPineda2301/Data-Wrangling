getwd()
# Strings
string <- 'this is a string'

class(string)
length(string)
nchar(string)

# Double
number <- 234

class(number)
typeof(number)
length(number)

# Integer
integer <- 2L

class(integer())

# Logical
logical <- FALSE
class(logical())

logical*1

as.logical(0)
as.logical(1)

# Vectores
num_vector <- c(1,2,3,4)
length(num_vector)

num_vector2 <- c(1,2,3,4,"a")

vec1 <- 1:100
vec2 <- sample(x = 1:10, size = 5, replace = FALSE)
vector("integer", length=10)

class(num_vector)
class(num_vector2)

c(num_vector2, 5,6,7,8)

log_vec <- c(F, F, T)
class(log_vec)

as.numeric(num_vector2)

as.character(num_vector)

# Factor
factor_1 <- c("mon", "tue", "wed", "thu", "fri", "sat", "sun", "mon", "tue", "wed", "thu", "fri", "sat", "sun")
factor_1 <- factor(factor_1)

# Ordered Factors
factor_2 <- c("mon", "tue", "wed", "thu", "fri", "sat", "sun", "mon", "tue", "wed", "thu", "fri", "sat", "sun")
factor_2 <- ordered(factor_2, levels = c("mon", "tue", "wed", "thu", "fri", "sat", "sun"))
                    
# Lists
vector_1 <- c(1,2,3,4,5)
vector_2 <- c(F, F, T)
vector_3 <- letters[1:6]

list_l <- list(vector_1, vector_2, vector_3)

names(list_l) <- c("A", "B", "C")

list_l$C

# Matrix
mat <- matrix(1:10, nrow = 2, ncol = 5)
mat[2,] #indexing

c(1,2,3,4,5)[c(1, 3:5)]

a <- c(1,2,3,4,5,4,5,4,5,4,5)
condicion <- a>4
a[condicion]

# Data Frames
df <- data.frame(
  col1 = c("This", "is", "a", "vector", "of", "strings"),
  col2 = 1:6,
  col3 = letters[1:6],
  stringsAsFactors = FALSE
)

View(df)
str(df)

df$col2
df$col1[1:2]

df[1,]
df[,3]

names(df)
names(df) <- c("column1", "column2", "column3")

head(df, 2)
head(df, 3)

nrow(df)
ncol(df)

#Renombrar solo una columna
names(df)[2] <- "C2"

# Functions of base R (ufunc)
num_vector3 <- as.numeric(num_vector2)
is.na(num_vector3) # Valida TRUE aquellos valores que sean NA


mean(num_vector3, na.rm = TRUE)

mean(num_vector3[!is.na(num_vector3)])

df_copy <- data.frame(
  col1 = c("This", "is", "a", "vector", NA, "strings"),
  col2 = c(1:5, NA),
  col3 = letters[1:6]
)

df_copy[!is.na(df_copy$col2),]











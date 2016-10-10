#generates 5*4 numeric matrix
mymatrix <- matrix(1:20, nrow=5, ncol=4)

#A matrix is the special case of a two-dimensional array.

cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("c1","c2")
mymatrix1 <- matrix(cells, nrow = 2, ncol = 2, byrow = TRUE,
                      dimnames = list(rnames, cnames))
 
mdat <- matrix(c(1,2,3,11,12,13), nrow = 2, ncol = 3, byrow = FALSE,
                dimnames = list(c("row1", "row2"), c("C.1", "C.2", "C.3")))
mdat[,2] # 2nd column of matrix
mymatrix[3,] # 3rd row of matrix 
mymatrix[2:4,1:3] # rows 2,3,4 of columns 1,2,3

#Factors: Tell R that a variable is nominal by making it a factor.
#The factor stores the nominal values as a vector of integers in the range [ 1... k ] 
#(where k is the number of unique values in the nominal variable),
#and an internal vector of character strings (the original values) mapped to these integers.
  # variable gender with 20 "male" entries and 
  # 30 "female" entries
gender <- c(rep("male",20), rep("female",30))
gender <- factor(gender)
# stores gender as 20 1s and 30 2s and associates
# 1=female, 2=male internally (alphabetically)
# R now treats gender as a nominal variable 
summary(gender)

#An ordered factor is used to represent an ordinal variable.
#variable rating coded as "large", "medium", "small'
rating <- ordered(rating)
# recodes rating to 1,2,3 and associates
# 1=large, 2=medium, 3=small internally
# R now treats rating as ordinal


# 
# R will treat factors as nominal variables and ordered factors as ordinal 
# variables in statistical proceedures and graphical analyses. 
# You can use options in the factor( ) and ordered( ) functions to control
# the mapping of integers to strings (overiding the alphabetical ordering).



#Some Usefull Functions

# length(object) # number of elements or components
# str(object)    # structure of an object 
# class(object)  # class or type of an object
# names(object)  # names
# 
# c(object,object,...)       # combine objects into a vector
# cbind(object, object, ...) # combine objects as columns
# rbind(object, object, ...) # combine objects as rows 
# 
# object     # prints the object
# 
# ls()       # list current objects
# rm(object) # delete an object
# 
# newobject <- edit(object) # edit copy and save as newobject 
# fix(object)               # edit in place



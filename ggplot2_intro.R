
library(ggplot2)
 #draw a scatterplot using ggplot2
head(iris) # by default, head displays the first 6 rows
head(iris, n = 10)
head(Titanic)

# the data frame contains 3 types of species: setosa, versicolor, and virginica

## Plot Sepal.Length vs. Petal.Length, using data from the `iris` data frame
#a point called 'geom', is the default when you supply two arguments to qplot().
qplot(Sepal.Length, Petal.Length, data = iris) #is equivalent to..
qplot(Sepal.Length, Petal.Length, data= iris, geom = "point" )
#we can use a=other types of geoms to create more kinds of plots
qplot(Sepal.Length, data= iris, geom = "bar", color = Species)

qplot(Sepal.Length, Petal.Length, data= iris, geom = "line", color=Species) #just a trial but it makes no sense

## `Orange` is another built-in data frame that describes the growth of orange trees
qplot(age, circumference, data = Orange, geom = "line", color = Tree, main = "How does orange tree circumference vary with age?")
qplot(age, circumference, data = Orange, geom = c("point", "line"), color = Tree, main = "How does orange tree circumference vary with age?") #plots a line with a point at each elbow



qplot(Sepal.Length, Petal.Length, data = iris, color=Species)

qplot(Sepal.Length, Petal.Length, data = iris, color=Species, size= Petal.Length)

qplot(Sepal.Length, Petal.Length, data = iris, color=Species, size= Petal.Width) ## We see that Iris setosa flowers have the narrowest petals

qplot(Sepal.Length, Petal.Length, data = iris, color=Species, size= Petal.Width, alpha= I(0.7))
## By setting the alpha of each point to 0.7, we reduce the effects of overplotting

qplot(Sepal.Length, Petal.Length, data = iris, color=Species, xlab = "Sepal Length", ylab = "Petal Length", main = "Sepal vs. Petal Length in Fisher's Iris data")

###################################################################################
movies = data.frame(director = c("spielberg", "spielberg", "spielberg", "jackson", "jackson"),
                    movie = c("jaws", "avatar", "schindler's list", "lotr", "king kong"),
                    minutes = c(124, 163, 195, 600, 187))

#plot number of movies each director has
## By default, the height of each bar is simply a count.
# data = movies is an optional attribute to define a data frame, in this case as your y-axis
qplot(director, data = movies, geom = "bar", ylab = "# of movies")

# Here the height of each bar is the total running time of the director's movies
qplot(director, weight = minutes, data = movies, geom = "bar", ylab = "total length(mins)")
######################################################################333

#create factors with vslue labels
gear.f <- factor(mtcars$gear, levels = c(3,4,5), labels = c("3gears","4gears","5gears"))
am.f <- factor(mtcars$am, levels = c(0,1), labels = c("Automatic", "Manual"))
cy.f <- factor(mtcars$cyl, levels = c(4,6,8),labels = c("4cyls","6cyls","8cyls"))

# Kernel density plots for mpg
# grouped by number of gears (indicated by color)
qplot(mpg, data = mtcars, color = gear, geom = "density", alpha = I(0.5), main ="Distribution of Gas Milage",
      xlab="Miles Per Gallon", ylab="Density")


#####################################################
# Lattice Examples 
library(lattice) 
attach(mtcars)

# create factors with value labels 
gear.f<-factor(gear,levels=c(3,4,5),
               labels=c("3gears","4gears","5gears")) 
cyl.f <-factor(cyl,levels=c(4,6,8),
               labels=c("4cyl","6cyl","8cyl")) 
# ~x|A means display numeric variable x for each level of 
#factor A. y~x | A*B means display the relationship between 
#numeric variables y and x separately for every combination of 
#factor A and B levels. ~x means display numeric variable x alone.



# kernel density plot 
densityplot(~mpg, 
            main="Density Plot", 
            xlab="Miles per Gallon")
# kernel density plots by factor level 
densityplot(~mpg|cyl.f, main="Density Plot by Number of Cylinders",
            xlab="Miles per Gallon")

# kernel density plots by factor level (alternate layout) 
densityplot(~mpg|cyl.f, mtcars,
            main="Density Plot by Numer of Cylinders",
            xlab="Miles per Gallon")





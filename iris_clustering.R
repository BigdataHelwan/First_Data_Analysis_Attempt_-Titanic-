library(datasets)
head(iris)

library(ggplot2)

# this plot of sepal length vs. petal length, colored by species.
ggplot(data = iris, mapping = aes(Petal.Length, Petal.Width, color = Species)) + geom_point() #geom_point() used to draw scatter plots ##this is equivalent to the following
qplot(Petal.Length, Petal.Width, data = iris, color = Species)
#Clustering
# the initial cluster assignments are random, let us set the seed to ensure reproducibility

set.seed(20)
#K-means clustering with 3 clusters of sizes 46, 54, 50
#kmeans(x, centers, iter.max = 10, nstart = 1,
#algorithm = c("Hartigan-Wong", "Lloyd", "Forgy",
#              "MacQueen"), trace=FALSE)
# here we are targeting no rows but only the 3rd and 4th columns, 3 cluster centroids
# nstart: is the number of K [start centroids] random initializaion times
#nstart=20 means try 20 different random starting assignments and then select the one with the lowest within cluster variation.
irisCluster <- kmeans(iris[, 3:4], 3, nstart= 20)

#cluster	
#A vector of integers (from 1:k) indicating the cluster
#to which each point is allocated.
#table(rows,cols)
table(irisCluster$cluster, iris$Species)

irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) + geom_point()

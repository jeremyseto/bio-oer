install.packages("curl")
library(curl)
varanoid <- read.csv(curl("https://raw.githubusercontent.com/jeremyseto/bio-oer/master/data/varanoid.csv")) ##grabs the data from github
row.names(varanoid)<-varanoid$Species ## sets the non-numerical values in the first column
varanoid_truncated <- (varanoid[,2:14]) ## removes the first column of non-numerical values or it will interfere with math, but we saved those values for the columns already
dist_measure<-dist(varanoid_truncated, method="euclidean")  ## stores the euclidean calculations into a variable "dist_measure"
dist_measure ## you can view the matrix of the calculations by calling the variable
varanoid_cluster<-hclust(dist_measure) ## you can cluster the species together by calling the function hclust on your distances and storing them to variable "varanoid_cluster"
pdf(file="/tmp/varanoid_tree.pdf") ## this opens the "graphics device" to store a pdf file in the "/tmp" directory
plot(varanoid_cluster) ## this plots the cluster into the PDF
dev.off() ## closing the graphics device then saves the PDF file


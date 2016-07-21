# class
:exclamation: This is a fork of.the CRAN R package repository.  class — Functions for Classification.
Homepage: http://www.stats.ox.ac.uk/pub/MASS4/  


==============================================================================================================
This repository used to show how to acclerate legacy code by openMP or openACC.
Modified by Peng Zhao

------------------------------------------------------------------------------------------------------------
INTALL:

library(devtools)

install_github("patriczhao/class")

-----------------------------------------------------------------------------------------------------------
TEST:

    number of features and observations
    n.cols <- 500 
    n.rows <- 5000 
    fake data with labels of 10 classes
    train  <- matrix(runif(n.cols * n.rows), nrow=n.rows)
    labels <- sample(10, n.rows, replace=T) 

    test.rows <- 1e6  # large number
    test <- matrix(runif(test.rows * n.cols), nrow=test.rows)

    clustering by knn
    library(class)
    knn(train, test, cl=labels, k=5)


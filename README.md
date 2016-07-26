# class
:exclamation: This is a fork of.the CRAN R package repository.  class — Functions for Classification.
Homepage: http://www.stats.ox.ac.uk/pub/MASS4/  

==============================================================================================================
This repository used to show how to acclerate legacy code by parallel technologies including openMP and openACC.
- This is OpenMP version of KNN (k-nearest neighbors algorithm) in R.
- Modified by: Peng Zhao

------------------------------------------------------------------------------------------------------------
INTALL:

library(devtools)

install_github("patriczhao/class")

-----------------------------------------------------------------------------------------------------------
Functionality:
    
    train <- rbind(iris3[1:25,,1], iris3[1:25,,2], iris3[1:25,,3])
    test <- rbind(iris3[26:50,,1], iris3[26:50,,2], iris3[26:50,,3])
    cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
    install_github("patriczhao/class")
    library(class)
    set.seed(1)
    ompKNN.1 <- knn(train, test, cl, k = 1)
    ompKNN.3 <- knn(train, test, cl, k = 3)
    ompKNN.5 <- knn(train, test, cl, k = 5)

    install_github("cran/class")
    library(class)
    set.seed(1)
    baseKNN.1 <- knn(train, test, cl, k = 1)
    baseKNN.3 <- knn(train, test, cl, k = 3)
    baseKNN.5 <- knn(train, test, cl, k = 5)
    
    all.equal(baseKNN.1, ompKNN.1)
    > [1] TRUE
    all.equal(baseKNN.3, ompKNN.3)
    > [1] TRUE
    all.equal(baseKNN.5, ompKNN.5)
    > [1] TRUE
    
-----------------------------------------------------------------------------------------------------------
Performance TEST:

    n.cols <- 500 
    n.rows <- 5000 
  
    train  <- matrix(runif(n.cols * n.rows), nrow=n.rows)
    labels <- sample(10, n.rows, replace=T) 

    test.rows <- 5000  
    test <- matrix(runif(n.cols * test.rows), nrow=test.rows)

    install_github("patriczhao/class")
    set.seed(1)
    system.time(baseKNN <- knn(train, test, cl=labels, k=5, n.threads=1))
    system.time(ompKNN <- knn(train, test, cl=labels, k=5, n.threads=20))
    
    
-----------------------------------------------------------------------------------------------------------
Result :

     original(1 -core)   : 19.4 sec
     OpenMP  (20-cores)  :  2.3 sec

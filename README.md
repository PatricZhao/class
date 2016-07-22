# class
:exclamation: This is a fork of.the CRAN R package repository.  class — Functions for Classification.
Homepage: http://www.stats.ox.ac.uk/pub/MASS4/  


==============================================================================================================
This repository used to show how to acclerate legacy code by openMP or openACC.
This is OpenMP version of KNN (k-nearest neighbors algorithm).

Modified by Peng Zhao

------------------------------------------------------------------------------------------------------------
INTALL:

library(devtools)

install_github("patriczhao/class")

-----------------------------------------------------------------------------------------------------------
TEST:

    n.cols <- 500 
    n.rows <- 5000 
  
    train  <- matrix(runif(n.cols * n.rows), nrow=n.rows)
    labels <- sample(10, n.rows, replace=T) 

    test.rows <- 5000  
    test <- matrix(runif(n.cols * test.rows), nrow=test.rows)

    library(class)
    system.time(knn(train, test, cl=labels, k=5))
    
    library(devtools)
    install_github("patriczhao/class")
    library(class)
    system.time(knn(train, test, cl=labels, k=5))


-----------------------------------------------------------------------------------------------------------
Result :

     original(1 -core)   : 19.4 sec
     OpenMP  (20-cores)  :  2.3 sec

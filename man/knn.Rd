% file class/man/knn.Rd
% copyright (C) 1994-9 W. N. Venables and B. D. Ripley
%
% OpenMP version by Peng Zhao (2014)

\name{knn}
\alias{knn}
\title{
k-Nearest Neighbour Classification (OpenMP version)
}
\description{
k-nearest neighbour classification for test set from training set. For
each row of the test set, the \code{k} nearest (in Euclidean distance)
training set vectors are found, and the classification is decided by
majority vote, with ties broken at random. If there are ties for the
\code{k}th nearest vector, all candidates are included in the vote.

The parallel version of KNN will use all cores in your computer and 
is really faster than sinlge thread run.
}
\usage{
knn(train, test, cl, k = 1, l = 0, prob = FALSE, use.all = TRUE, n.threads = 1)
}
\arguments{
\item{train}{
matrix or data frame of training set cases.
}
\item{test}{
matrix or data frame of test set cases. A vector will be interpreted
as a row vector for a single case.
}
\item{cl}{
factor of true classifications of training set
}
\item{k}{
number of neighbours considered.
}
\item{l}{
minimum vote for definite decision, otherwise \code{doubt}. (More
precisely, less than \code{k-l} dissenting votes are allowed, even if \code{k}
is increased by ties.)
}
\item{prob}{
If this is true, the proportion of the votes for the winning class
are returned as attribute \code{prob}.
}
\item{use.all}{
controls handling of ties. If true, all distances equal to the \code{k}th
largest are included. If false, a random selection of distances
equal to the \code{k}th is chosen to use exactly \code{k} neighbours.
}
\item{n.threads}{
number of threads.
}}
\value{
Factor of classifications of test set. \code{doubt} will be returned as \code{NA}.
}
\references{
  Ripley, B. D. (1996)
  \emph{Pattern Recognition and Neural Networks.} Cambridge.

  Venables, W. N. and Ripley, B. D. (2002)
  \emph{Modern Applied Statistics with S.} Fourth edition.  Springer.
  
  Peng Zhao (2016)
  \emph{R with OpenMP: CRAN Package Modernization.} ParallelR, http://www.parallel.com/blog
}
\seealso{
\code{\link{knn1}}, \code{\link{knn.cv}}
}
\examples{
train <- rbind(iris3[1:25,,1], iris3[1:25,,2], iris3[1:25,,3])
test <- rbind(iris3[26:50,,1], iris3[26:50,,2], iris3[26:50,,3])
cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
knn(train, test, cl, k = 3, prob=TRUE, n.threads=1)
attributes(.Last.value)
}
\keyword{classif}

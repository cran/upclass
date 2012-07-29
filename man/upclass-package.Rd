\name{upclass-package}
\alias{upclass-package}
\alias{upclass}
\docType{package}
\title{
Updated Classification Methods using Unlabeled Data
}
\description{
This package contains a collection of functions which implement data classification. It creates updated classification rules by making use of unlabeled data when obtaining parameter estimates of models. The functions can be implemented over a number of models with the best model selected and displayed.
}
\details{
\tabular{ll}{
Package: \tab upclass\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2012-09-20\cr
License: \tab GPL-2\cr
LazyLoad: yes\cr
}
The function \code{upclassifymodel} takes an updated approach to typical classification rules on unlabelled data. It obtains initial parameter estimates and membership probabilities using the labeled data only and then iterates through the EM algorithm using the complete data with continuous updating of estimates and probabilities. The example below shows graphically the goodness of fit of such a model using this updated approach and a typical classification method, \code{upclassify}.
The function \code{upclassify} implements \code{upclassifymodel} over a desired list of models fitted to the data. The model that best fits the data is returned.
For a complete list of function, use \code{library(help="upclass")}.
}
\author{
Niamh Russell, Laura Cribbin, Thomas Brendan Murphy

Maintainer: Niamh Russell <niamh.russell.1@ucdconnect.ie>

}
\references{
Cribbin, L. (2008) \pkg{upclass}: R Package for Performing Updated Classification Rules, unpublished thesis (M.Sc.), University College Dublin.
}


\examples{
data(iris)
X<- as.matrix(iris[,-5])
cl<-as.matrix(iris[,5])

indtrain <- sort(sample(1:150, 30))
Xtrain <- X[indtrain,]
cltrain <- cl[indtrain]

indtest <- setdiff(1:150, indtrain)
Xtest <- X[indtest,]
cltest <- cl[indtest]

fitupmodels <- upclassify(Xtrain, cltrain,
     Xtest, cltest)       #testing every model.
plot(fitupmodels$Best)
}


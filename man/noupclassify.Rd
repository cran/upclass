\name{noupclassify}
\alias{noupclassify}

\title{Obtaining the Best Model for Data Classification Using Labeled Data only
}
\description{
This function performs \code{noupclassifymodel} over a range of different models and finds the model that best fits the data. In selecting the best model, the BIC values are compared.
}

\usage{
noupclassify(Xtrain, cltrain, Xtest, cltest = NULL, modelscope = NULL, reportrate = TRUE, ...)}

\arguments{
  \item{Xtrain}{
  A numeric matrix of data where rows correspond to observations and columns correspond to variables. The group membership of each observation is known - labeled data.
}
  \item{cltrain}{
A numeric vector with distinct entries representing a classification of the corresponding observations in \code{Xtrain}
}
  \item{Xtest}{
A numeric matrix of data where rows correspond to observations and columns correspond to variables. The group membership of each observation may not be known - unlabeled data.
}
  \item{cltest}{
A numeric vector with distinct entries representing a classification of the corresponding observations in \code{Xtest}. By default, these are not supplied and the function sets out to obtain them.
}
  \item{modelscope}{
A character string indicating the desired models to be tested. With default \code{NULL}, all available models are tested. The models available for univariate and multivariate data are described in \code{\link{modelvec}}.
}
  \item{reportrate}{
A logical value with default \code{TRUE} indicating default output is desired. This output includes \code{z}, \code{cl}, \code{rate}, \code{Brierscore} and \code{tab} for both the training and test data.
}
  \item{\dots}{
Arguments passed to or from other methods
}
}

\value{
If \code{reportrate = TRUE}, the return value is a list comprising the best model and every model tested, together with their respective components. These are equivalent to those given in \code{noupclassifymodel}
%%  \item{comp1 }{Description of 'comp1'}
 \item{Best }{This model gives to lowest BIC value and is considered the best model fit to the data}
 \item{Model1}{These are the results for the first model in \code{modelscope}}
 \item{Model2}{These are the results for the second model in \code{modelscope}}
 \item{etc.}{}
}
\references{
Bensmail, H. and Celeux, G. (1996). Regularized gaussian discriminant analysis through eigenvalue decomposition. \emph{Journal of the American Statistical Association} 91, 1743-1748.
C. Fraley and A.E. Raftery (2002). Model-based clustering, discriminant analysis, and density estimation. \emph{Journal of the American Statistical Association} 97, 611-631.
C. Fraley and A.E. Raftery (2006) MCLUST Version 3 for R: Normal Mixture Modeling and Model-Based Clustering, Technical Report no. 504, Department of Statistics, University of Washington
}
\author{
Niamh Russell
}

\seealso{
\code{\link{upclassify}}, \code{\link{upclassifymodel}}, \code{\link{noupclassifymodel}}, \code{\link{modelvec}} 
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


fitnoupmodels <- noupclassify(Xtrain, cltrain,
     Xtest, cltest)       #testing every model.
fitnoupmodels$Best$modelName     
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Classification}


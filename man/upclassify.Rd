\name{upclassify}
\alias{upclassify}

\title{
Obtaining the Best Model for Data Classification Using an Updated Classification Method
}
\description{
This function performs \code{\link{upclassifymodel}} over a range of different models and finds the model that best fits the data by comparing the BIC values.
}
\usage{
upclassify(Xtrain, cltrain, Xtest, cltest = NULL, 
modelscope = NULL, tol = 10^-5, iterlim = 1000, 
Aitken = TRUE, ...)
}

\arguments{
  \item{Xtrain}{
A numeric matrix of observations where rows correspond to observations and columns correspond to variables. The group membership of each observation is known - labeled data.
}
  \item{cltrain}{
A numeric vector with distinct entries representing a classification of the corresponding observations in \code{Xtrain}.
}
  \item{Xtest}{
A numeric matrix of observations where rows correspond to observations and columns correspond to variables. The group membership of each observation may not be known - unlabeled data.
}
  \item{cltest}{
A numeric vector with distinct entries representing a classification of the corresponding observations in \code{Xtest}. By default, these are not supplied and the function sets out to obtain these.
}
  \item{modelscope}{
A character string indicating the desired models to be tested. With default NULL, all available models are tested. The models available for univariate and multivariate data are described in \code{\link{modelvec}}.
}
  \item{tol}{
A non-negative number, with default 10^{-5}, which is a measure of how strictly convergence is defined.
}
  \item{iterlim}{
A non-negative integer, with default 1000, which is the desired limit on the maximum number of iterations.
}
  \item{Aitken}{
A logical value with default TRUE which tests for convergence using Aitken acceleration. If value is set to FALSE, convergence is tested by comparing \code{tol} to the change in log-likelihood between two consecutive iterations. For further information on Aitken acceleration, see \code{\link{Aitken}}.
}

  \item{\dots}{
Arguments passed to or from other methods
}
}

\value{
An object of class "upclassfit" providing a list of output components for each model in \code{modelscope}, with the Best model (according to BIC) first.  

The details of the output components are as follows
 \item{call}{How to call the function and the order of its arguments.}
 \item{Ntrain}{The number of observations in the training set.}
 \item{Ntest}{The number of observations in the test set.}
 \item{d}{The dimension of the data.}
 \item{G}{The number of groups in the training set.}
 \item{iter}{The number of iterations taken.}
 \item{converged}{Whether or not the algorithm has converged. If \code{converged} is \code{FALSE}, then \code{iter} will be the maximum no of iterations.}
 \item{modelName}{The model considered in this run of the algorithm.}
 \item{parameters}{A list of the final model parameters estimated by the algorithm.
 \describe{
 \item{\code{pro}}{ The proportion of the data to be found in each group.}
 \item{\code{mean}}{ Mean vectors for each group.}
 \item{\code{variance}}{ The variance and covariences produced by Mclust.}
 }}
 \item{train}{A list of information about the training data. This will not have changed from before the run.
 \describe{
  \item{\code{z}}{ A matrix containing the estimated probabilities that each observation in the training data belongs to each group.}
  \item{\code{cl}}{ A vector containing the labels of the training data.}
  \item{\code{misclass}}{ The number of misclassifications of the training data.}
  \item{\code{rate}}{ The misclassification rate expressed as a percentage.}
  \item{\code{Brier}}{ The Brier score expressed as a percentage.}
   \item{\code{tab}}{ The misclassification table for the training data.}
 }}
  \item{test}{A list of information about the test data.
   \describe{
  \item{\code{z}}{ A matrix containing the estimated probabilities that each observation in the training data belongs to each group.}
  \item{\code{cl}}{ A vector containing the new labels of the training data.}
  \item{\code{misclass}}{ The number of misclassifications of the training data, provided the correct labels have been supplied.}
  \item{\code{rate}}{ The misclassification rate expressed as a percentage, provided the correct labels have been supplied.}
  \item{\code{Brier}}{ The Brier score expressed as a percentage.}
   \item{\code{tab}}{ The misclassification table for the training data, provided the correct labels have been supplied.}
 }}
  \item{ll}{The log-likelihood of the data.}
  \item{bic}{The Bayes information criterion for the specified model.}

}
\references{
C. Fraley and A.E. Raftery (2002). Model based clustering, discriminant analysis, and density estimation. \emph{Journal of the American Statistical Association} 97:611-631.

Fraley, C. and Raftery, A.E. (2006).
MCLUST Version  for R: Normal Mixture Modeling and Model-Based Clustering,
Technical Report no. 504, Department of Statistics,
University of Washington.

Dean, N., Murphy, T.B. and Downey, G (2006). Using unlabelled data to update classification rules with applications in food authenticity studies. \emph{Journal of the Royal Statistical Society: Series C} 55 (1), 1-14.
}
\author{
Niamh Russell
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{upclassifymodel}}, \code{\link{modelvec}}, \code{\link{Aitken}} 
}
\examples{
data(iris)
X <- as.matrix(iris[,-5])
cl <- unclass(iris[,5])

indtrain <- sort(sample(1:150,110))
Xtrain <- X[indtrain,]
cltrain <- cl[indtrain]

indtest <- setdiff(1:150, indtrain)
Xtest <- X[indtest,]
cltest <- cl[indtest]
modelscope <- c("EII", "VII", "VEI","EVI")

fitupmodels <- upclassify(Xtrain, cltrain, Xtest, cltest, modelscope)
fitupmodels$Best$modelName    # What is the best model?
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Classification}


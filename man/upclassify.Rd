\name{upclassify}
\alias{upclassify}

\title{
Obtaining the Best Model for Data Classification Using an Updated Classification Method
}
\description{
This function performs \code{\link{upclassifymodel}} over a range of different models and finds the model that best fits the data by comparing the BIC values.
}
\usage{
upclassify(Xtrain, cltrain, Xtest, cltest = NULL, modelscope = NULL, tol = 10^-5, iterlim = 1000, Aitken = TRUE, reportrate = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
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
A non-negative number, with default $10^{-5}$, which is a measure of how strictly convergence is defined.
}
  \item{iterlim}{
A non-negative integer, with default 1000, which is the desired limit on the maximum number of iterations.
}
  \item{Aitken}{
A logical value with default TRUE which tests for convergence using Aitken acceleration. If value is set to FALSE, convergence is tested by comparing \code{tol} to the change in log-likelihood between two consecutive iterations. For further information on Aitken acceleration, see \code{\link{Aitken}}.
}
  \item{reportrate}{
A logical value with default TRUE indicating detailed output is desired. This output includes \code{z}, \code{cl}, \code{Brierscore} and \code{tab} for both the training and test data.
}
  \item{\dots}{
Arguments passed to or from other methods
}
}

\value{
if \code{reportrate = TRUE}, the return value is a list comprising the best model and every model tested, together with their respective components. These are equivalent to those given in \code{\link{upclassifymodel}}

\item{Best}{This model gives the lowest BIC value and is considered the best model fit to the data.}
\item{Model1}{These are the results for the first model in \code{modelscope}}
\item{Model2}{These are the results for the second model in \code{modelscope}}

}
\references{
C. Fraley and A.E. Raftery (2002). Model based clusetering, discriminant analysis, and density estimation. \emph{Journal of the American Statistical Association} 97:611-631.

Fraley, C. and Raftery, A.E. (2006).
MCLUST Version  for R: Normal Mixture Modeling and Model-Based Clustering,
Technical Report no. 504, Department of Statistics,
University of Washington.

Dean, N., Murphy, T.B. and Downey, G (2006). Using unlabelled data to update classification rules with applications in food authenticity studies. \emph{Journal of the royal Statistical Society: Series C} 55 (1), 1-14.
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
cl <- as.matrix(iris[,5])

indtrain <- sort(sample(1:150,110))
Xtrain <- X[indtrain,]
cltrain <- cl[indtrain]
ltrain <- unmap(cltrain)

indtest <- setdiff(1:150, indtrain)
Xtest <- X[indtest,]
cltest <- cl[indtest]
ltest <- unmap(cltest)

fitupmodels <- upclassify(Xtrain, cltrain, Xtest, cltest, modelscope = c("EII", "VII", "VEI","EVI"))
fitupmodels$Best$modelName    # What is the best model?
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Classification}


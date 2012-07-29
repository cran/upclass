\name{noupclassifymodel}
\alias{noupclassifymodel}

\title{Classification Method using labeled data only}
\description{
\code{noupclassifymodel} implements the EM algorithm to classify unlabeled data using parameter estimates derived from labeled data only, 
}
\usage{
noupclassifymodel(Xtrain, cltrain, Xtest, cltest = NULL, modelName = "EEE", reportrate = TRUE, ...)
}

\arguments{
  \item{Xtrain}{
  A numeric matrix of observations where rows correspond to observations and columns correspond to variables. The group membership of each observation is known - labeled data. }
  \item{cltrain}{
  A numeric vector with distinct entries representing a classification for the corresponding observations in \code{Xtrain}.}
  \item{Xtest}{
  A numeric matrix of observations where rows correspond to observations and columns correspond to variables. The group membership of each observation may not be known - unlabeled data.}
  \item{cltest}{
  A numeric vector with distinct entries representing a classification of the corresponding observations in \code{Xtest}. By default, these are not supplied and the function sets out to determine these.}
  \item{modelName}{
  A character string indicating the model, with default \code{"EEE"}. The models available for univariate and multivariate data are described in \code{\link{modelvec}}.}
  \item{reportrate}{
  A logical value with default \code{TRUE} indicating detailed output is desired. This output includes \code{z}, \code{cl}, \code{rate}, \code{Brierscore} and \code{tab} for both the training and test data.}
  \item{\dots}{
  Arguments passed to or from other methods.}
}

\value{If \code{reportrate = TRUE}, the return value is a list with the following components:
\item{call}{The function call from \code{noupclassifymodel} or \code{upclassifymodel}}
\item{Ntrain}{The number of observations in the training data.}
\item{Ntest}{The number of observations in the test data.}
\item{d}{The dimension of the data.}
\item{G}{The number of groups in the data.}
\item{modelName}{A character string identifying the model (same as the input argument)}
\item{parameters}{
  \describe{
     \item{pro}{A vector whose \emph{k}th component is the mixing proportion for the          \emph{k}th component of the mixture model}
    \item{mean}{The mean for each component. If there is more than one component, this is a matrix whose \emph{k}thbcolumn is the mean of the \emph{k}th component of the mixture model.} 
    \item{variance}{A list of variance parameters for the model. The components of this list depend on the model specification.}
}
}
\item{train/test}{
  \describe{
  \item{z}{A matrix whose \code{[i,k]}th entry is the conditional probability of the    \emph{i}th observation belonging to the \emph{k}th component of the mixture.}
  \item{cl}{A numeric vector with distinct entries representing a classification of the corresponding obervations in \code{Xtrain}/\code{Xtest}.}
  \item{rate}{The number of misclassified observations.}
  \item{Brierscore}{The Brier score measuring the accuracy of the probabilities (\code{z})s obtained}
  \item{tab}{A table of actual and predicted group classifications.}
  }
}
\item{ll}{The log-likelihood for the data in the mixture model.}
\item{bic}{The Bayesian Information Criterion for the data.}
}

\references{
Bensmail, H. and Celeux, G. (1996).
Regularized Gaussian discriminant analysis through eigenvalue decomposition/
\emph{Journal of the American Statistical Association} 91:1743-1748.

Fraley, C. and Raftery, A.E. (2002).
Model-based clustering, discriminant analysis, and density estimation.
\emph{Journal of the American Statistical Association} 97:611-631.

Fraley, C. and Raftery, A.E. (2006).
MCLUST Version  for R: Normal Mixture Modeling and Model-Based Clustering,
Technical Report no. 504, Department of Statistics,
University of Washington.
}


\seealso{\code{\link{modelvec}}, \code{\link{noupclassify}}
}

\examples{
data(wine, package = "gclus")
X <- as.matrix(wine[, -1])
cl <- as.matrix(wine[, 1])
indtrain <- sort(sample(1:178, 120))
indtest <- setdiff(1:178, indtrain)

fitnoup <- noupclassifymodel(Xtrain = X[indtrain,], cltrain = cl[indtrain], Xtest = X[indtest, ], cltest = cl[indtest])
}

\keyword{Classification}


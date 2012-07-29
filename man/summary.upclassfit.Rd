\name{summary.upclassfit}
\alias{summary.upclassfit}
\alias{summary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Summarizing Classification Method
}
\description{
\code{summary} method for class \code{"upclassfit"}
}
\usage{
\method{summary}{upclassfit}(object, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
an object of class \code{"upclassfit"}, the result of a call to \code{upclassifymodel} or \code{noupclassifymodel}.
}
  \item{\dots}{
further arguments passed to or from other methods.
}
}
\details{
\code{summary.upclassfit} gives a fuller output than \code{\link{print.upclassfit}}. Any of the members of the list can be called using the names listed at the bottom of the output.
}
\value{
\item{call}{The function call from \code{upclassifymodel} or \code{noupclassifymodel}}
\item{Ntrain}{The number of observations in the training data.}
\item{Ntest}{The number of observations in the test data. }
\item{d}{The dimension of the data.}
\item{G}{The number of groups in the data.}
\item{modelName}{A character string identifying the model (same as the input argument).}
\item{parameters  pro}{A vector whose \emph{k}th component is the mixing proportion for the \emph{k}th component of the mixture model. If the model includes a Poisson term for noise, there should be one more mixing proportion than the number of Gaussian components.}
\item{mean}{The mean for each component. If there is more than one component, this is a matrix whose \emph{k}th column is the mean of the \emph{k}th component of the mixture model.}
\item{variance}{A list of variance parameters for the model. The components of this list depend on the model specification.}
\item{train/test    z}{A matrix whose \code{[i,k]}th entry is the conditional probability of the \emph{i}th observation belonging to the \emph{k}th component of the mixture}
\item{cl}{A numeric vector with distinct entries representing a classification of the corresponding observations in \code{Xtrain}/\code{Xtest}.}
\item{rate}{The number of misclassified observations}
\item{Brierscore}{The Brier score measuring the accuracy of the probabilities (\code{z}s) obtained.}
\item{tab}{A table of actual and predicted group classifications}
\item{ll}{The log-likelihood for the data in the mixture model.}
\item{bic}{The Bayesian Information Criterion for the data}
\item{Available Components}{A list of all the components of the output list.}
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

\seealso{
 \code{\link{upclassify}}, \code{\link{noupclassify}}
}

\examples{
data(wine, package = "gclus")
X <- as.matrix(wine[, -1])
cl <- as.matrix(wine[, 1])
indtrain <- sort(sample(1:178, 120))
indtest <- setdiff(1:178, indtrain)

fitup <- upclassifymodel(Xtrain = X[indtrain,], cltrain = cl[indtrain], Xtest = X[indtest, ], cltest = cl[indtest])
summary(fitup)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Classification}


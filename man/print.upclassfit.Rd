\name{print.upclassfit}
\alias{print.upclassfit}
\alias{print}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Printing Classification Method
}
\description{
\code{summary} method for class \code{"upclassfit"}. 
}
\usage{
\method{print}{upclassfit}(x, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
an object of class \code{"upclassfit"}, the result of a call to \code{upclassifymodel} or \code{noupclassifymodel}.
}
  \item{\dots}{
further arguments passed to or from other methods.
}
}
\details{
\code{print.upclassfit} gives a more concise output than \code{\link{summary.upclassfit}}. Any of the members of the list can be called using the names listed at the bottom of the output.
}
\value{
\item{call}{The function call from \code{upclassifymodel} or \code{noupclassifymodel}}
\item{Ntrain}{The number of observations in the training data.}
\item{Ntest}{The number of observations in the test data. }
\item{d}{The dimension of the data.}
\item{G}{The number of groups in the data.}
\item{modelName}{A character string identifying the model (same as the input argument).}

\item{rate}{The number of misclassified observations}
\item{Brierscore}{The Brier score measuring the accuracy of the probabilities}
\item{bic}{The Bayesian Information Criterion for the data}
\item{tab}{A table of actual and predicted group classifications}
\item{Available Components}{A list of all the components of the output list.}.
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
\code{\link{summary.upclassfit}}, \code{\link{upclassify}}, \code{\link{noupclassify}}
}
\examples{
data(wine, package = "gclus")
X <- as.matrix(wine[, -1])
cl <- as.matrix(wine[, 1])
indtrain <- sort(sample(1:178, 120))
indtest <- setdiff(1:178, indtrain)

fitup <- upclassifymodel(Xtrain = X[indtrain,], cltrain = cl[indtrain], Xtest = X[indtest, ], cltest = cl[indtest])
print(fitup)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Classification}


\name{plot.upclassfit}
\alias{plot.upclassfit}
\alias{plot}
\title{
Plot for upclassfit
}
\description{
These are methods for objects of class \code{upclassfit}, produced by functions in the \pkg{upclass} such as \code{\link{upclassify}}, \code{\link{upclassifymodel}}, \code{\link{noupclassify}}, and \code{\link{noupclassifymodel}}.
}
\usage{
\method{plot}{upclassfit}(x, \dots)
}

\arguments{
  \item{x}{
  an \code{upclassfit} object.
}
  \item{\dots}{
further \link{graphical parameters}.
}
}
\details{
Produces as a heatmap, a representation of the Goodness of Fit of the selected model, or the best model if generated from \code{upclassify} or \code{noupclassify}
}

\author{
Niamh Russell
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

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
plot(fitup)
}

\keyword{Classification}


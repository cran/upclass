\name{plot.upclassfit}
\alias{plot.upclassfit}
\alias{plot}
\title{
Plot for upclassfit
}
\description{
\code{plot} method for class \code{"upclassfit"}. 
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
It produces the a posteriori probabilities of each observation belonging to each group, for the best model selected by either \code{upclassify} or \code{noupclassify}. Suspect classifications may be easier to identify as they will appear more to the centre between the upper and lower margins of the plot.
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
cl <- unclass(wine[, 1])
indtrain <- sort(sample(1:178, 120))
indtest <- setdiff(1:178, indtrain)

fitup <- upclassify(X[indtrain,], cl[indtrain], X[indtest,], cl[indtest])
plot(fitup)
}

\keyword{Classification}


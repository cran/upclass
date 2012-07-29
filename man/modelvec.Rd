\name{modelvec}
\alias{modelvec}
\title{Univariate and Multivariate Model Names}
\description{Model names to be used in the \pkg{upclass} package for univariate and multivariate data.}
\usage{
modelvec(d = 1)
}

\arguments{
  \item{d}{
The dimension of the data. By default, \code{d=1}, and the data is considered to be univariate.
}
}

\value{
if \code{d=1}, returned is a vector with the first two of the following components only; otherwise, they are omitted and the vector contains the remaining components:  
\item{"E"}{Univariate, equal variance}
\item{"V"}{Univariate, variable variance}
\item{"EII"}{Multivariate, equal volume and spherical}
\item{"VII"}{Multivariate, variable volume and spherical}
\item{"EEI"}{Multivariate, equal volume, equal shape and axis aligned}
\item{"VEI"}{Multivariate, variable volume, equal shape and axis aligned}
\item{"EVI"}{Multivariate, equal volume, variable shape and axis aligned}
\item{"VVI"}{Multivariate, variable volume, variable shape and axis aligned}
\item{"EEE"}{Multivariate, equal volume, equal shape and equal orientation}
\item{"EEV"}{Multivariate, equal volume, equal shape and variable orientation}
\item{"VEV"}{Multivariate, variable volume, equal shape and variable orientation}
\item{"VVV"}{Multivariate, variable volume, variable shape and variable orientation}

}
\references{
Banfield, J.D. and Raftery, A.E. (1993).
Model based Gaussian and non-gaussian clustering.
\emph{Biometrics}, 49 (3): 803-821.

Fraley, C. and Raftery, A.E. (2002).
Model-based clustering, discriminant analysis, and density estimation.
\emph{Journal of the Americal Statistical Association} 97 (458), 611-631.
}

\seealso{\code{\link{upclassify}}, \code{\link{noupclassify}}.}

\examples{
modelvec(1) # Models available for univariate data.

data(iris)
modelvec(ncol(iris[,-5])) # Models available for multivariate data
}
 
\keyword{data}


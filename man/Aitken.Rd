\name{Aitken}
\alias{Aitken}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Aitken Acceleration}
\description{Calculates the Aitken acceleration estimate of the final converged maximized log-likelihood.}
\usage{Aitken(ll)}
\arguments{
  \item{ll}{A vector of three consecutive log-likelihood values}
}
\details{The final converged maximized log-likelihood can be used to determine convergence, i.e., for use in determining convergence of the EM algorithm. It can be used alongside other functions in the 
        \pkg{upclass} package to decide whether or not the log-likelihood has converged.}
\value{The return value os a list with the following components:
    \item{ll}{The most current estimate for the log-likelihood}
    \item{linf}{An estimate of the final converged maximized log-likelihood}
    %% might be a problem with this line of code!!
    \item{a}{The Aitken acceleration value where \code{0 <= a <= 1} }

}
\references{
%% need umlaut for Bohning
B&ouml:hning, D., Dietz, E., Schaub, R., Schlattmann, and Lindsay, B. (1194, June).
The distribution of the likelihood ratio for mixtures of densities from the one-parameter exponential family.
\emph{Annals of the Institute of Statistical Mathematics} 46 (2), 373-388.
}

\seealso{\code{\link{upclassifymodel}}, \code{\link{noupclassifymodel}}.}

\examples{
ll<-c(-261, -257.46,-256.4)
Aitken(ll)
}
 
\keyword{convergence}

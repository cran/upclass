\name{upclassifymodel}
\alias{upclassifymodel}

\title{
Updated Classification Method using Labeled and Unlabeled Data
}
\description{
This function implements the EM algorithm by iterating over the E-step and M-step. The initial values are obtained from the labeled data then both steps are further iterated over the complete data, labeled and unlabeled data combined.
}
\usage{
upclassifymodel(Xtrain, cltrain, Xtest, cltest = NULL, modelName = "EEE", tol = 10^-5, iterlim = 1000, Aitken = TRUE, reportrate = TRUE, ...)
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
A numeric vector with distinct entries representing a classification of the corresponding observations in \code{Xtest}. By default, these are not supplied amd the function sets out to obtain them.
}
  \item{modelName}{
A character string indicating the model, with default "EEE".
The models available for selction are described in \code{\link{modelvec}}
}
  \item{tol}{
A positive number, with default \code{10^{-5}}, which is a measure of how strictly convergence is defined.
}
  \item{iterlim}{
A positive integer, with default 1000, which is the desired limit on the maximum number of iterations.
}
  \item{Aitken}{
A logical value with default \code{TRUE} which tests for convergence using Aitken acceleration. If value is set to \code{FALSE}, convergence is tested by comparing \code{tol} to the change in log-likelihood between two consecutive iterations. For further information on Aitken acceleration, see \code{\link{Aitken}}
}
  \item{reportrate}{
A logical value with default \code{TRUE} indicating detailed output is desired. This output includes \code{z}, \code{cl}, \code{rate}, \code{Brierscore} and \code{tab} for both the training and test data.
}
  \item{\dots}{
Arguments passed to or from other methods.
}
}
\details{
This is an updated approach to typical classification methods. Initially, the M-step is performed on the labeled (training) data to obtain parameter estimates for the model. These are used in an E-step to obtain group memberships for the unlabeled (test) data. The training data labels and new probability estimates for test data labels are combined to form the complete data. From here, the M-step and E-step are iterated over the complete data, with continuous updating until convergence has been reached. This has been shown to result in lower misclassification rates, particularly in cases where only a small proportion of the total data is labeled.
}
\value{
If \code{reportrate = TRUE}, the return value is a list with the following components.

\item{call}{The function call from \code{upclassifymodel}.}
\item{Ntrain}{The number of observations in the training data.}
\item{Ntest}{The number of observations in the test data.}
\item{d}{The dimension of the data.}
\item{G}{The number of groups in the data}
\item{iter}{The number of iterations required to reach convergence. If convergence was not obtained, this is equal to \code{iterlim}.}
\item{converged}{A logical value where \code{TRUE} indicates convergence was reached and \code{FALSE} means \code{iter} reached \code{iterlim} without obtaining convergence.}
\item{modelName}{A character string identifying the model (same as the input argument).}
\item{parameters   pro}{A vector whose \emph{k}th component is the mixing proportion for the \emph{k}th component of the mixture model. If the model includes a Poisson term for noise, there should be one more mixing proportion than the number of Gaussian components.}
\item{mean}{The mean for each component. If there is more than one component, this is a matrix whose \emph{k}th column is the mean of the \emph{k}th component of the mixture model.}
\item{variance}{A list of variance parameters for the model. The components of this list depend on the model specification.}
\item{train/test    z}{A matrix whose \code{[i,k]}th entry is the conditional probability of the \emph{i}th observation belonging to the \emph{k}th  component of the mixture.}
\item{cl}{A numeric vector with distinct entries representing a classification of the corresponding observations in \code{Xtrain}/\code{Xtest}.}
\item{rate}{The number of misclassified observations.}
\item{Brierscore}{The Brier score measuring the accuracy of the probabilities (\code{z}s) obtained.}
\item{tab}{A table of actual abd predicted group classifications.}
\item{ll}{The log-likelihood for the data in the mixture model.}
\item{bic}{The Bayesian Information Criterion for the model.}
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
\code{\link{upclassify}}, \code{\link{Aitken}}, \code{\link{modelvec}}
}
\examples{
data(wine, package = "gclus")
X <- as.matrix(wine[, -1])
cl <- as.matrix(wine[, 1])
indtrain <- sort(sample(1:178, 120))
indtest <- setdiff(1:178, indtrain)

fitup <- upclassifymodel(Xtrain = X[indtrain,], cltrain = cl[indtrain], Xtest = X[indtest, ], cltest = cl[indtest])
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Classification}


\name{subsample}
\alias{subsample}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Sample from a \code{sitar} dataset}
\description{
A function to sample from a \code{sitar} dataset for experimental design purposes. Two different sampling schemes are offered, based on the values of \code{id} and \code{x}.}
\usage{
subsample(x, id, data, prob = 1, xlim = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
vector of age.}
  \item{id}{
factor of subject identifiers.}
  \item{data}{
dataframe containing \code{x} and \code{id}.}
  \item{prob}{
scalar defining sampling probability. See Details.}
  \item{xlim}{
length 2 vector defining range of \code{x} to be selected. See Details.}
}
\details{
With the first sampling scheme \code{xlim} is set to \code{NULL} (default), and rows of \code{data} are sampled with probability \code{prob} without replacement. With the second sampling scheme \code{xlim} is set to a range within \code{range(x)}. Subjects \code{id} are then sampled with probability \code{prob} without replacement, and all their rows where \code{x} is within \code{xlim} are selected. The second scheme is useful for testing the power of the model to predict later growth when data only up to a certain age are available. Setting \code{xlim} to \code{range(x)} allows data to be sampled by subject. The returned value can be used as the \code{subset} argument in \code{sitar} or \code{update.sitar}.}
\value{
Returns a logical the length of \code{x} where \code{TRUE} indicates a sampled value.}
\references{
%% ~put references to the literature/web site here ~
}
\author{Tim Cole \email{tim.cole@ucl.ac.uk}}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{sitar}}, \code{\link{sitar}}}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, id, data, prob = 1, xlim = NULL) 
{
    if (!missing(data)) {
        on.exit(detach(data))
        attach(data)
    }
    nx <- length(x)
    subset <- rep(TRUE, nx)
    if (is.null(xlim)) {
        ss <- sample(nx, prob * nx)
        subset[-ss] <- FALSE
    }
    else {
        nid <- nlevels(factor(id))
        lid <- levels(factor(id))
        sid <- sample(lid, prob * nid)
        subset[id \%in\% sid & (x < min(xlim) | x > max(xlim))] <- FALSE
    }
    subset
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
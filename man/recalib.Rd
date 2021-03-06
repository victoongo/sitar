\name{recalib}
\alias{recalib}
\title{Recalibrate x, y data using SITAR random effects}
\description{
A function to recalibrate x,y data using SITAR random effects}
\usage{
recalib(xc, yc, id = NULL, data, xcnew = NULL, ycnew = NULL, model, from, to)
}
\arguments{
  \item{xc}{character vector defining column name(s) of \code{x} data to be recalibrated.}
  \item{yc}{character vector defining column name(s) of \code{y} data to be recalibrated.}
  \item{id}{factor defining \code{from} and \code{to} rows. If \code{NULL} then recalibrate all rows.}
  \item{data}{dataframe containing \code{xc}, \code{yc} and \code{id}.}
  \item{xcnew}{column names for replacement columns \code{xc}. If default \code{NULL} then use names xcnew1... .}
  \item{ycnew}{column names for replacement columns \code{yc}. If default \code{NULL} then use names ycnew1... .}
  \item{model}{\code{sitar} model defining the random effects to be used for recalibration.}
  \item{from}{level of \code{id} defining existing data (must be a single row in \code{coef{model}}).}
  \item{to}{level of \code{id} defining data to be recalibrated (must be a single row in \code{coef{model}}).}
}
\details{
\code{recalib} recalibrates the values of \code{xc} and \code{yc} based on \code{model}. 
\code{xc} values are changed to \code{(xc - c(coef[from, 'b'])) * exp(coef[from, 'c'] - coef[to, 'c']) + coef[to, 'b']}. 
\code{yc} values are changed to \code{yc - coef[from, 'a'] + coef[to, 'a']}.
}
\value{
Returns the dataframe \code{data} with the \code{from} rows of \code{xc} and \code{yc} recalibrated.}
\author{Tim Cole \email{tim.cole@ucl.ac.uk}}

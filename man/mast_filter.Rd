% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Fluidigm-methods.R, R/filterEval.R
\name{mast_filter}
\alias{mast_filter}
\alias{burdenOfFiltering}
\title{Filter a SingleCellAssay}
\usage{
mast_filter(sc, groups = NULL, filt_control = NULL, apply_filter = TRUE)

burdenOfFiltering(sc, groups, byGroup = FALSE, filt_control = NULL)
}
\arguments{
\item{sc}{The \code{SingleCellAssay} object}

\item{groups}{An optional \code{character} naming the grouping variable}

\item{filt_control}{The \code{list} with configuration parameters for the filter.}

\item{apply_filter}{\code{logical} should the filter be applied, or should a matrix of booleans giving if a well would be subject to a filtering criteria be returned?}

\item{byGroup}{in the case of \code{burdenOfFiltering} should the filter be stratified by groups, or only the plotting.}
}
\value{
A filtered result
}
\description{
Remove, or flag wells that are outliers in discrete or continuous space.
}
\details{
The function filters wells that don't pass filtering criteria described in filt_control.
filt_control is a list with named elements \code{nOutlier}
(minimum nmber of outlier cells for a cell to be filtered [default = 2]
\code{sigmaContinuous} (the z-score outlier threshold for the continuous part of the signal) [default = 7]
and \code{sigmaProportion} (the z-score outlier threshold for the discrete part of the signal) [default = 7].

If \code{groups} is provided, the filtering is calculated within each level of the group, then combined again as output.
}
\section{Functions}{
\itemize{
\item \code{burdenOfFiltering()}: plot the proportions of wells are filtered due to different criteria

}}
\examples{
data(vbetaFA)
## Split by 'ncells', apply to each component, then recombine
vbeta.filtered <- mast_filter(vbetaFA, groups='ncells')
## Returned as boolean matrix
was.filtered <- mast_filter(vbetaFA, apply_filter=FALSE)
## Wells filtered for being discrete outliers
head(subset(was.filtered, pctout))
burdenOfFiltering(vbetaFA, groups='ncells', byGroup=TRUE)
burdenOfFiltering(vbetaFA, groups='ncells')
}
\seealso{
burdenOfFiltering
}
\author{
Andrew McDavid
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/select_sample.R
\name{select_sample}
\alias{select_sample}
\alias{select_sample_str}
\alias{select_sample_prop}
\title{Select simple and stratified random samples from a sampling frame.}
\usage{
select_sample_str(sampling_frame, allocation, sample_size = sample_size,
  stratum = stratum, is_frac = FALSE, seed = NA, replace = FALSE)

select_sample_prop(sampling_frame, stratum = stratum, frac, seed = NA,
  replace = FALSE)
}
\arguments{
\item{sampling_frame}{\code{data.frame} with the sampling frame it must contain a
column with the stratum.}

\item{allocation}{\code{data.frame} with a column defining the strata and a
column with sample size allocations for each stratum (one line per stratum).}

\item{sample_size}{unquoted column with sample sizes in the allocation
data.frame}

\item{stratum}{unquoted column with strata in the allocation and
sampling_frame \code{data.frame}'s (the columns must have the same name in the
two \code{data.frame}'s). If one wants to select a SRS the stratum
parameter is not used.}

\item{is_frac}{logical value indicating whether the allocation data.frame contains
proportions to be sampled within each stratum (TRUE) or sample sizes.}

\item{seed}{integer value used to set the state of the random number generator.}

\item{replace}{logical value indicating whether the sample should be selected
with replacement.}

\item{frac}{when sampling with equal probability across strata, frac is a
numeric value indicating the fraction of the data to select.}
}
\value{
A \code{data.frame} with the selected sample, it will have the same
  columns as the original sampling frame plus a column indicating the sample
  size in the stratum of each selected observation.
}
\description{
Select Simple Randmom Samples and Stratified Random Samples,
\code{select_sample_prop} can be used when sampling with equal probability
  across strata or when selecting a simple random sample.
\code{select_sample_str} selects samples when sample size varies across
  strata.
}
\examples{
# stratified random sampling
library(dplyr)
sampling_frame <- data.frame(id = 1:100,
  str = sample(1:5, 100, replace = TRUE),
  val = rnorm(100))
# allocation given by column n in allo data.frame
allo <- dplyr::sampling_frame \%>\%
    group_by(str) \%>\%
    summarise(n = 0.4 * n())
select_sample_str(sampling_frame, allo, n, str)
# SRS (simple random sample)
select_sample_prop(sampling_frame, frac = 0.2)
}

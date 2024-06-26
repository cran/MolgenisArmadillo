% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subset.R
\name{.format_api_posts}
\alias{.format_api_posts}
\title{Formats API posts based on subset definition}
\usage{
.format_api_posts(posts, subset_def)
}
\arguments{
\item{posts}{A list of API posts}

\item{subset_def}{A tibble containing subset definition}
}
\value{
A tibble consisting of original subset_def with columns 'posts' and 'status' appended.
}
\description{
Formats API posts based on subset definition
}

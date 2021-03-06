% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/project.R
\name{armadillo.create_project}
\alias{armadillo.create_project}
\title{Create a project for a variable collection}
\usage{
armadillo.create_project(project_name)
}
\arguments{
\item{project_name}{The name of the project to create. The project name
\itemize{
  \item{cannot be empty.}
  \item{must be no more than 56 characters.}
  \item{cannot end with a \code{-}.}
  \item{must consist of lowercase letters and numbers.}
  }}
}
\value{
TRUE if successful
}
\description{
Create a project for a variable collection
}
\examples{
\dontrun{
armadillo.create_project("gecko")
}

}

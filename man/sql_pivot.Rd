% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pivot.R
\name{sql_pivot}
\alias{sql_pivot}
\title{Create a Pivot Query}
\usage{
sql_pivot(con, from, select, key, value, levels, ...)
}
\arguments{
\item{con}{a Database connection}

\item{from}{the from clause}

\item{select}{variables to select in addition to levels.}

\item{key}{Variable columns originate from}

\item{value}{The expression to evaluate to create the values}

\item{levels}{the levels of key to turn into columns.}

\item{...}{arguments to pass on or ignore.}
}
\description{
Creates a SQL pivot query.  Similar to the \code{tidyr::spread}
function.
}
\examples{
library(dbplyr)
query <- sql_pivot( dbplyr::simulate_mssql()
                  , from   = ident('##iris')
                  , select = ident()
                  , key    = ident('Species')
                  , value  = rlang::quo(mean(Petal.Length, na.rm=TRUE))
                  , levels = ident(c('versicolor', 'virginica'))
                  )
sql_render(query)
}

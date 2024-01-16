\name{monoCyteSim}
\alias{monoCyteSim}
\alias{bivarSim}
\alias{ccSim}
\docType{data}
\title{
Simulated monocyte counts and psychosis symptoms.
}
\description{
Discretised values of monocyte counts, and ratings of level of
psychosis simulated from a model fitted to a data set consisting of
observations made on a number of patients from the Northland District
Health Board system.  The real data must be kept confidential due
to ethics constraints.
}
\usage{
    bivarSim
    ccSim
}
\format{
    The objects \code{bivarSim} and \code{ccSim} are both data
    frames with 410386 rows and the following columns:

    \describe{
    \item{\code{id}}{a factor with 1258 levels.  These levels are
    of the form \code{s1001}, \dots, \code{s2258}.} Each level is
    considered to correspond to an individual patient.  The number
    of rows of rows of \code{cpprSim} varies from patient to patient.

    \item{\code{sex}}{a factor specifying the sex of the patient
    in question, with levels \code{Female} or \code{Male}.}

    \item{\code{age}}{a numeric vector providing the age in years
    (to 4 decimal places) of the patient in question, at each week.}

    \item{\code{week}}{a numeric vector specifying the number of
    weeks from the start of observation (with the first observation
    being taken in \dQuote{week 1}.  The values form an unbroken
    sequence from 1 to \eqn{n} where \eqn{n} is the number of
    observations corresponding to the given patient, i.e. the
    number of rows of the data frame that have \code{id} equal to
    the identifier of the given patient.}

    \item{\code{day}}{a numeric vector specifying the day (counting
    from the start of observation) on which the corresponding value
    of cell count or of psychosis rating was obtained.}

    \item{\code{categMC}}{a factor specifying the
    \dQuote{categorised} monocyte counts.  The levels of this
    factor are \code{1, 2, \dots, 5}.  The entry of this factor
    is \code{NA} unless the count was observed in the given week.
    See below for the interpretation of these values.}

    \item{\code{psychRating}}{a factor specifying the
    \dQuote{psychosis rating} of the patient, as judged by the
    attending physician.  These levels of this factor are \code{0,
    1, \dots, 4}. A value of 0 corresponds to \dQuote{no symptoms};
    a value of 4 corresponds to \dQuote{severe}.  The entry of this
    factor is \code{NA} unless the psychosis rating was observed
    in the given week.}
  }

    The data frame \code{bivarSim} was simulated from a bivariate
    model that was fitted to the real data.  The data frame
    \code{ccSim} was simulated from a univariate model, with the
    response being \code{categMC}, that was fitted to the real data.

    Most of the entries of \code{categMC} and \code{psychRating} are
    \code{NA}.  The entries are temporally ordered and correspond to
    the number of weeks from the start of observation.  Observations
    in the real data set were made only when the patient in question
    visted a physician and so weeks in which no visit was made
    resulted in an \dQuote{observation} of \code{NA}.  The object
    \code{ccprSim} was simulated in such a way as to imitate this
    characteristic.  The fraction of missing observations in each
    variate (i.e. \code{categMC} and \code{psychosisRating}
    is roughly commensurate with the corresponding fractions in
    the real data.

    The values in \code{categMC} consist of integers from 1 to 5 and
    are to be interpreted as indicators of cell counts in units of
    \eqn{10^9}{1e9} cells per litre, discretised according to the
    following scale:
    \itemize{
    \item \eqn{0.0 \leq c \leq 0.3}{0.0 <= c <= 0.3}
          \eqn{\leftrightarrow}{\code{<-->}} 1
    \item \eqn{0.3 < c \leq 0.5}{0.3 < c <= 0.5}
          \eqn{\leftrightarrow}{\code{<-->}} 2
    \item \eqn{0.5 < c \leq 0.7}{0.5 < c <= 0.7}
          \eqn{\leftrightarrow}{\code{<-->}} 3
    \item \eqn{0.7 < c \leq 1.0}{0.7 < c <= 1.0}
          \eqn{\leftrightarrow}{\code{<-->}} 4
    \item \eqn{1.0 < c \leq 2.0}{1.0 < c <= 2.0}
          \eqn{\leftrightarrow}{\code{<-->}} 5
     }
     where \eqn{c} represents \dQuote{count}.

    The question of essential interest in respect of the real
    data was \dQuote{Is there any association between the cell
    count values and the psychosis ratings?}  More specifically
    it was \dQuote{Can the level of psychosis be \emph{predicted}
    from the cell counts?}  The data comprising \code{ccprSim}
    were simulated from a four state model assuming an association
    between cell count values and psychosis ratings, so statistical
    tests should (?) indicate such an association.
}

\section{Note}{
These data are basically intended for use with the \code{eglhmm}
package, as examples of data to which hidden Markov models with
emissions with a \code{Multinom} distribution, possibly bivariate,
could be fitted.  However their presence in the \code{eglhmm} package
would cause the size of the \code{data} directory in that package
to exceed 4.5 Mb., which is unacceptably large.  Consequently these
data sets have been placed in a separate \dQuote{data only} package
(the package currently under consideration).  In the normal course
of events, users will obtain this package (i.e.  \code{MonoCyteSim})
from \code{github} via the commmand

\preformatted{
    install.packages("MonoCyteSim",repos="https://rolfturner.r-universe.dev")
}
}

\source{
  The real data, on the basis of which these data were simulated, were
  supplied by Dr. Jonathan Williams, Northland District Health Board.
}
\examples{
\dontrun{ # Takes too long, even though itmax is unrealistically small.
    fit.dep <- eglhmm(data=monocyteCounts,response=c("categMC","psychRating"),
                      cells="id",K=4,verb=TRUE,indep=FALSE,itmax=10)
    fit.ind <- eglhmm(data=monocyteCounts,response=c("categMC","psychRating"),
                      cells="id",K=4,verb=TRUE,indep=TRUE,itmax=10)
    anova(fit.dep,fit.ind)
}
}
\keyword{datasets}

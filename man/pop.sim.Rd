\name{pop.sim}
\alias{pop.sim}
\title{Population simulation}
\usage{
pop.sim(mort, fert=NULL, mig=NULL, firstyearpop, N=100, 
    mfratio=1.05, bootstrap=FALSE)
}

\description{Simulate future sample paths of a population using functional models for mortality, fertility and migration.}

\arguments{
\item{mort}{Forecasts of class \code{fmforecast2} for mortality.}
\item{fert}{Forecasts of class \code{fmforecast} for female fertility.}
\item{mig}{Forecasts of class \code{fmforecast2} for net migration.}
\item{firstyearpop}{Population for first year of simulation.}
\item{N}{Number of sample paths to simulate.}
\item{mfratio}{Male-female ratio used in distributing births.}
\item{bootstrap}{If TRUE, simulation uses resampled errors rather than normally distributed errors.}
}

\value{A list of two arrays containing male and female future simulated population values. 
The arrays are of dimension (p,h,N) where p is the number of age groups, h is the forecast horizon 
and N is the number of simulated sample paths.}

\author{Rob J Hyndman.}

\seealso{\code{\link{simulate.fmforecast}}, \code{\link{simulate.fmforecast2}}.}
\examples{
\dontrun{
require(addb)
# Construct data objects
mort.sm <- smooth.demogdata(set.upperage(extract.years(australia,1950:2002),100))
fert.sm <- smooth.demogdata(extract.years(aus.fertility,1950:2002))
aus.mig <- netmigration(set.upperage(australia,100),aus.fertility,mfratio=1.0545)
# Fit models
mort.fit <- coherentfdm(mort.sm)
fert.fit <- fdm(fert.sm)
mig.fit <- coherentfdm(aus.mig)
# Produce forecasts
mort.fcast <- forecast(mort.fit)
fert.fcast <- forecast(fert.fit)
mig.fcast <- forecast(mig.fit)
# Simulate
aus.sim <- pop.sim(mort.fcast,fert.fcast,mig.fcast,australia)}
}

\keyword{models}

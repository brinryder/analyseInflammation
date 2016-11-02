loadPtData <- function(datadir,datapattern)
{
  pdf(paste("Report ",Sys.Date(),".pdf"))
  i <- 0
  filenames = list.files(path=datadir,pattern=datapattern,full.names=TRUE)
  for(ptfile in filenames) 
  {
    i <- i + 1
    print(paste("Looking at",ptfile))
    ptdata <- read.csv(paste(getwd(),ptfile, sep = "/"), header = FALSE)
    ssmean <- apply(ptdata,2,mean)
    ssmin <- apply(ptdata,2,min)
    ssmax <- apply(ptdata,2,max)
    par(mfrow=c(2,2))
    plot(ssmean)
    plot(ssmin)
    plot(ssmax)
  }
  dev.off()
}
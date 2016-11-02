magic <- c("Monkey", "Dog", "Fish", "Zebra", "Cat", "Long horse", "Cantaloupe", "Tiger", "Beetle", "Leopard", "Snail", "Chihuahua", "Yes")
loadPtData <- function(datadir,datapattern, printall, makepdf, domagic)
{
  if(makepdf) pdf(paste("Report ",Sys.Date(),".pdf"))
  i <- 0
  filenames = list.files(path=datadir,pattern=datapattern,full.names=TRUE)
  for(ptfile in filenames) 
  {
    i <- i + 1
    ptid <- as.numeric(regmatches(ptfile, regexpr("[0-9].*[0-9]", ptfile)))
    print(as.numeric(ptid))
    if(domagic) ptid <- magic[ptid]
    print(paste("Looking at",ptfile))
    ptdata <- read.csv(paste(getwd(),ptfile, sep = "/"), header = FALSE)
    if(makepdf) par(mfrow=c(2,3))
    plot(apply(ptdata,2,mean), main=paste("Patient",ptid), ylab="Mean inflammations")
    if(printall)
    {
      plot(apply(ptdata,2,min), main=paste("Patient",ptid), ylab="Minimum inflammations")
      plot(apply(ptdata,2,max), main=paste("Patient",ptid), ylab="Maximum inflammations")
    }
  }
  if(makepdf) dev.off()
}
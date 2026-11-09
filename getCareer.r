#' @title getCareer
#' @description Gets the career’s data of a given player
#' @param playerName name of player
#' @param dob date of birth of player in YYYYMMDD
#' @return data frame to be used for graphing purposes or a meaningful error message if the user provides an invalid name of a player
#' @export
getCareer <- function(playerName,dob){
  url=paste("https://www.tennisabstract.com/jsmatches/",processName(playerName),"Career.js",sep="")
  tryCatch(
    expr={download.file(url,"career.js")},
    error = function(e){stop(paste(playerName,"is not a tennis player."))}
  )
context=v8()
context$source("career.js")
morematchmx=context$get("morematchmx")
  if(class(morematchmx)=="list"){
  return(processCareerList(morematchmx,dob))
  }
}
  
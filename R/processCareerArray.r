#' @title processCareerArray
#' @description Processes the career of a player given an array
#' @param morematchmx the array describing the career of a player
#' @param dob the date of birth of the player in YYYYMMDD
#' @return a clean data frame used for graphing purposes
processCareerArray<-function (morematchmx,dob){
  datesOfMatches=t(morematchmx)[1,]
  wins=as.integer(t(morematchmx)[5,]=="W")
  opponentAges=as.numeric(t(morematchmx)[17,])
  playerAges=as.numeric(ymd(datesOfMatches)-ymd(dob))/365.2425
  differences=(playerAges-opponentAges)
  data.frame(playerAge=playerAges, difference=differences,won=wins)
}
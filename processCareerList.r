#' @title processCareerList
#' @description Processes the career of a player given a list
#' @param morematchmx the list describing the career of a player
#' @param dob the date of birth of the player in YYYYMMDD
#' @return a clean data frame used for graphing purposes
processCareerList<-function (morematchmx,dob){
  datesOfMatches=opponentDateOfBirths=wins=c()
  for (i in 1:length(morematchmx)){
    datesOfMatches=c(datesOfMatches,morematchmx[i][[1]][1])
    wins=c(wins,as.integer(morematchmx[i][[1]][5]=="W"))
    opponentDateOfBirths=c(opponentDateOfBirths,morematchmx[i][[1]][17])
  }
  playerAges=as.numeric(ymd(datesOfMatches)-ymd(dob))/365.2425
  opponentAges=as.numeric(ymd(datesOfMatches)-ymd(opponentDateOfBirths))/365.2425
  differences=(playerAges-opponentAges)
  data.frame(playerAge=playerAges, difference=differences,won=wins)
}
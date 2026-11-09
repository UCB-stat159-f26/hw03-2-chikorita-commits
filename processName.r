#' @title processName
#' @description Processes the name of a player
#' @param playerName name of player 
#' @return Processed name to be used for getting a career
processName <- function(playerName){
  if(str_count(playerName," ")>0){
    return(paste(str_to_title(str_split(playerName," ")[[1]]),collapse=""))
  }else{
    return(playerName) # name does not need extra processing
  }
}
#' @title makePlot
#' @description Makes the scatter plot of a player's career
#' @param career data frame returned by getCareer
#' @return a scatter plot like the New York Times graphic
#' @export
makePlot <- function(career){
  ggplot(career,aes(x=playerAge,y=difference,color=factor(won),alpha=0))+geom_point()+labs(caption="Source: Tennis Abstract")+scale_color_manual(name="Match",values=c("0"="#953a8c","1"="#4acbed"),labels=c("Lost","Won"))+labs(x="Player's Age",y="Older than opponent")
}
  
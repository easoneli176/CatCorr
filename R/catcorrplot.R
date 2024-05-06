#' Create correlation plot
#'
#' Final nested function of this package after
#' crmvtbl_condense
#'
#' This function takes a dataframe and outputs a Cramer's V proxy
#' correlation plot
#' @import ggplot2
#' @import scales
#' @param df dataframe containing categorical vectors
#' @export
#' @examples
#' catcorrplot()

catcorrplot<-function(df){
  test1<-crmvtbl_condense(df)

  ggplot(test1, aes(Var1, Var2)) + # x and y axes => Var1 and Var2
    geom_tile(aes(fill = Cramers_V)) + #background colors mapped according to the value column
    geom_text(aes(fill = test1$Cramers_V, label = round(test1$Cramers_V, 2))) + #write the values
    scale_fill_gradient2(low = muted("darkred")
                         ,mid = "white"
                         ,high = muted("midnightblue")
                         ,midpoint = 0) + #determine the color
    theme(panel.grid.major.x=element_blank() #no gridlines
          ,panel.grid.minor.x=element_blank()
          ,panel.grid.major.y=element_blank()
          ,panel.grid.minor.y=element_blank()
          ,panel.background=element_rect(fill="white") #white background
          ,axis.text.x = element_text(angle=45,hjust=1,vjust=1,size=12,face="bold")
          ,plot.title=element_text(size=20,face="bold")
          ,axis.text.y=element_text(angle=45,size=12,face="bold"))+
    ggtitle("Cramer's V Heat Map")+
    theme(legend.title=element_text(face="bold",size=14))+
    scale_x_discrete(name="")+
    scale_y_discrete(name="")+
    labs(fill="Corr. Coef.")
}

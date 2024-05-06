#' Helper Table Build for CatCorrPlot
#'
#' Fourth nested function after crmvtbl of this package
#'
#' This function takes a dataframe and makes a new table
#' compatible to be fed to CatCorrPlot
#' @param df dataframe containing categorical variables
#' @export
#' @examples
#' crmvtbl_condense()

crmvtbl_condense<-function(df){
  numvars<-dim(df)[2]
  newdf<-data.frame(matrix(ncol=3,nrow=0))
  for (i in 1:numvars){
    for (j in 1:i){
      #keep ordering of varbs consistent so heatmap is nice
      if(colnames(df)[i]<colnames(df)[j]){
        var1<-colnames(df)[i]
        var2<-colnames(df)[j]
      } else{
        var1<-colnames(df)[j]
        var2<-colnames(df)[i]
      }
      rowi<-c(var1,var2,crmv(df[,i],df[,j]))
      newdf<-rbind(newdf,rowi)
    }
  }
  colnames(newdf)<-c("Var1","Var2","Cramers_V")
  newdf$Cramers_V<-as.numeric(newdf$Cramers_V)
  newdf
}

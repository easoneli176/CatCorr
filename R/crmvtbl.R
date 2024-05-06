#' CV Table Build
#'
#' Third nested function after onevarcv of this package
#'
#' This function takes a dataframe and outputs the Cramer's V
#' for all pairs of variables.
#' @param df dataframe containing categorical variables
#' @export
#' @examples
#' crmvtbl()

crmvtbl<-function(df){
  numvars<-dim(df)[2]
  newdf<-data.frame(matrix(ncol = numvars, nrow = numvars))
  colnames(newdf)<-colnames(df)
  for (i in 1:numvars){
    newdf[,i]<-onevarcv(df[,i],df)
  }
  newdf
}

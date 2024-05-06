#' Cramer's v of 1 field with dataframe
#'
#' Second nested function after crmv of this package
#'
#' This function takes one vector and calculates the
#' Cramer's V for each other vector in a dataframe.
#' @param var vector that cramer's v will be calculated with
#' @param df dataframe containing other vectors which will have Cramer's v calculated with var
#' @export
#' @examples
#' onevarcv()

onevarcv<-function(var,df){
  numvars<-dim(df)[2]
  cvec<-c()
  for (i in 1:numvars){
    cvec[i]<-crmv(var,df[,i])
  }
  cvec
}

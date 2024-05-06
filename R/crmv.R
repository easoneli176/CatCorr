#' Cramer's V of fields
#'
#' Used https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
#' to create this package.
#'
#' This function takes two vectors and outputs their Cramer's V,
#' which is a proxy for correlation.
#' @import rcompanion
#' @param varb1 First vector
#' @param varb2 Second vector
#' @export
#' @examples
#' crmv()

crmv<-function(varb1,varb2){
  ct<-table(varb1,varb2)
  cramerV(ct)
}

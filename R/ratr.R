#' ratr: A wrapper for the rat workflow language
#'
#' @docType package
#' @name pied
NULL

#' Get a rat parser
#' 
#' @param path the path to the rat compiler
#' @return A function that parses rat code
#' @export
rat_house <- function(path='rat'){
  rat <- path
  function(s){
    system2(rat, input=s, stdout=TRUE)
  }
}

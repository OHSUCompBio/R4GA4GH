#' checks for required fields in a response
#' TODO make this function only usable within library
#' 
#' @param var the required variable to check
#' @param obj the parent function of checkRequired
#' @export

checkRequired <- function(var, obj){
  if(missing(var)){
    return_str <- paste("Error constructing", toString(obj), "\n", "Missing required field:", deparse(substitute(var)), "\n")
    stop(return_str)
  }
}
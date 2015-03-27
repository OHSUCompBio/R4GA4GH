#' Constructs a GASearchVariantsRequest
#' TODO add params
#' @export

GASearchVariantsRequest <- function(variantSetIds, variantName = NULL, callSetIds = NULL, referenceName, start = NULL, end, pageSize = NULL, pageToken = NULL){
  # TODO: add more sophisticated error checking and type checking
  this_fun <- deparse(sys.call())
  checkRequired(variantSetIds, this_fun)
  checkRequired(referenceName, this_fun)
  checkRequired(end, this_fun)
  
  list(end = end, pageSize = pageSize, pageToken = pageToken, start = start, callSetIds = callSetIds, variantName = variantName, referenceName = referenceName, variantSetIds = variantSetIds)
  
}

#' POST /variants/search
#' 
#' Query to return calls associated with a variantset
#' 
#' @param request A GASearchVariantsRequest for POST
#' @return response A GASearchVariantsResponse
#' 
#' @export 

variant_search <- function(request){

  # GASearchVariantsRequest querying /variants/search endpoint
  # TODO: add error catching, dynamic endpoint
  url <- getOption("url")
  url <- paste0(url, "/variants/search")
  r <- POST(url, 
            encode = "json",
            accept_json(),
            add_headers(`Accept` = 'application/json',
                        `Content-Type` = 'application/json'),
            body = toJSON(request))
  
  response <- content(r, as = "parsed")
  
  all_vars <- response$variants
  while(!is.null(response$nextPageToken)){
    new_req <- request
    new_req$pageToken <- response$nextPageToken
    new_resp <- variant_search(new_req)
    var <- new_resp$variants
    if(length(var) != 0){
      all_vars <- list(all_vars, var)
    }
    response <- new_resp   
  }
  return(all_vars)
}
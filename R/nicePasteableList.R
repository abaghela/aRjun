#' Title
#'
#' @param character_vector
#'
#' @return
#' @export
#'
#' @examples
nicePasteableList <- function(character_vector){

  return(cat(noquote(as.character(character_vector)),sep="\n"))
  #clipr::write_clip(character_vector,breaks="\n")
}

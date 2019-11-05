# mapStuff maps ensembl gene names to the hgnc name
#' Title
#'
#' @param genes
#' @param ID
#'
#' @return
#' @export
#'
#' @examples


mapStuff <- function(genes, ID) {
  #require(biomaRt)
  #require(magrittr)
  #require(tidyverse)
  mart <- biomaRt::useDataset("hsapiens_gene_ensembl", biomaRt::useMart("ensembl"))
  if (ID == "ensembl"){
    geneList <- biomaRt::getBM(filters= "ensembl_gene_id", attributes= c("ensembl_gene_id", "hgnc_symbol","entrezgene_id",  "description"),values= as.character(genes),mart=mart)
    temp <- data.frame(ensembl_gene_id= setdiff(as.character(genes), geneList$ensemble_gene_id))
    genesList <- geneList %>% dplyr::full_join(temp)
    rm(temp)
    geneList <- geneList[match(as.character(genes), geneList$ensembl_gene_id),]
    return(geneList)
  }
  if (ID == "hgnc") {
    geneList <- biomaRt::getBM(filters= "hgnc_symbol", attributes= c("ensembl_gene_id","hgnc_symbol", "entrezgene_id", "description"),values= as.character(genes),mart=mart)
    temp <- data.frame(hgnc_symbol= setdiff(as.character(genes), as.character(geneList$hgnc_symbol)))
    genesList <- geneList %>% dplyr::full_join(temp)
    rm(temp)
    geneList <- geneList[match(as.character(genes), geneList$hgnc_symbol),]
    return(geneList)
  }
  if (ID == "entrez") {
    geneList <- biomaRt::getBM(filters= "entrezgene_id", attributes= c("ensembl_gene_id","hgnc_symbol", "entrezgene_id", "description"),values= as.integer(genes),mart=mart)
    temp <- data.frame(entrezgene= setdiff(as.integer(genes), as.integer(geneList$entrezgene)))
    genesList <- geneList %>% dplyr::full_join(temp)
    rm(temp)
    geneList <- geneList[match(as.integer(genes), geneList$entrezgene),]
    return(geneList)
  }
}

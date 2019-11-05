require(readr)

dir <- "~/my_things/ImportantFiles/Important_Gene_Lists/"
#dir <- "/mnt/analysis1/ImportantFiles/Important_Gene_Lists/"

gene_lists <- list(
  "endotox" = readxl::read_xlsx(paste0(dir,"EndotoxinToleranceSignature_GEx.xlsx"), sheet = "endotox"),
  "inflam" = read_csv(paste0(dir,"InflammatorySignature_GEx.csv")),
  "endotox31" = read_csv(paste0(dir,"Endotox31.csv")),
  "septi" = read_csv(paste0(dir,"septicyteLabSig.csv")),
  "sms" = read_csv(paste0(dir,"11geneSMSsig.txt")),
  "ratio" = read_csv(paste0(dir,"ratioSig.csv")),
  "mars" = read_csv(paste0(dir,"scicluna_mars_genes.csv")),
  #"doubleLPS" = readRDS("../beverlie/double_LPS.RDS"),
  #"de_genes_most_sev" = read_csv("../signature_validation/de_genes_mostsevere_vs_non_sepsis.csv")
  "daven" = read_csv(paste0(dir,"davenport_endotoxinTolerance.csv")),
  "ratio_full" = read_csv(paste0(dir,"ratioSig_full.csv"))
  #"patent_1" = readxl::read_xlsx(paste0(dir,"EndotoxinToleranceSignature_GEx.xlsx", sheet = "patent_1")),
  #"patent_2" = readxl::read_xlsx(paste0(dir,"EndotoxinToleranceSignature_GEx.xlsx", sheet = "patent_2")),
  #"patent_3" =readxl::read_xlsx(paste0(dir,"EndotoxinToleranceSignature_GEx.xlsx", sheet = "patent_3"))

)
gene_lists$all <- unique(na.omit(dplyr::bind_rows(gene_lists)$ensembl_gene_id))

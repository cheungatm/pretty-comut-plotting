#' @title Assess focal CNVs 
#' 
#' @description This helper function is used in the build_comut_frame() function to extract the CNV necessary for the desired genes using the grch37 annotation file
#' 
#' @param focality_file = a tsv file containing CNA information (must have column names `pair_id`, `Hugo_Symbol`, `chr`, `start`, `end`, and
#'         `segment_CN_interpretation` which is based on whatever CNA calling method you use (i.e. Homozygous deletion, etc.))
#'         
#' @param gene_symbol = a Hugo_Symbol that you want to extract from the focality_file input
#'
#'
#'

grch37_protein <- read_tsv('./ref_files/grch37_proteincoding_geneannot.txt')

assess_gene_focality <- function(focality_frame, gene_symbol) {
  gene_stats <- grch37_protein[grch37_protein$symbol %in% gene_symbol,]
  chr <- (gene_stats$chr[1])
  start <- as.numeric(gene_stats$start[1])
  end <- as.numeric(gene_stats$end[1])
  save <- focality_frame[focality_frame$chr %in% chr &
                           focality_frame$start <= start &
                           focality_frame$end >= end, 
                         c("pair_id", "chr", "start", "end", "segment_CN_interpretation")]
  return(save)
}

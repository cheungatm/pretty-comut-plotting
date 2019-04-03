#' @title Plot comut frame
#' 
#' @description This function takes in the previously made comut_frame (from build_comut_frame() function) and creates a tile plot in an
#'              optionally specified order of genes and samples
#' 
#' @param comut_frame = specially formatted frame created by build_comut_frame() function
#' 
#' @param pair_order = optional file of the order in which to plot samples (usually pre-ordered by response and/or genes of interest)
#' 
#' @param gene_order = optional file of the order in which to plot the genes
#' 
#' @return mut = a ggplot tile plot of the genomic (SNV and CNA) variants

plot_comut_frame <- function(comut_frame, pair_order = NULL, gene_order = NULL){
  if (is.null(pair_order)){
    pair_order = unique(comut_frame$pair_id)
  }
  if (is.null(gene_order)){
    gene_order = comut_frame[[3]]
  }
  mut <- ggplot() +
    geom_tile(data = filter(comut_frame[[2]], Variant_Classification2 != 'none'), aes(x=pair_id, y=Hugo_Symbol, height=0.8, width=0.8, fill=Variant_Classification2)) +
    geom_tile(data = filter(comut_frame[[2]], Variant_Classification2 == 'none'), aes(x = pair_id, y=Hugo_Symbol, height = 0.8, width = 0.8), fill = 'grey90') +
    theme_comut +
    scale_x_discrete(limits = unlist(pair_order)) +
    scale_fill_manual(values = c("Homozygous deletion"="dodgerblue3", "Loss of heterozygosity"="skyblue",
                                 "Copy neutral loss of heterozygosity"="skyblue3", "High amplification with loss of heterozygosity"="orchid4",
                                 "Amplification with loss of heterozygosity"="plum1", "Amplification"="indianred1", "High amplification"="firebrick1",
                                 "High amplification and amplification"="firebrick4", "Biallelic amplification"="hotpink2",
                                 "Biallelic high amplification"="firebrick", "Neutral"="grey90", "Unknown"="grey90",
                                 "Splice_Site" = "maroon", "Nonsense_Mutation" = "navyblue",
                                 "Missense_Mutation" = "lightgreen", "Frameshift" = "orange",
                                 "In_Frame_Indel" = "gold1", "none" = "grey90"), na.value = "grey90") +
    guides(fill = guide_legend(ncol = 2)) +
    scale_y_discrete(limits = rev(unlist(gene_order)))
  return(mut)
}

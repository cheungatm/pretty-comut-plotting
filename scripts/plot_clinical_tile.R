#' @title Plot clinical data
#' 
#' @description This function takes in a long-form, melted dataframe and plots the desired feature as a tile plot ordered by sample name in the comut plot
#' 
#' @param melted_clinical = dataframe with three columns including 'pair_id', 'variable', and 'value' (ex. Tumor_Normal_pair_01, Response, Non-responder)
#' 
#' @param pair_order = the pair order used to align the genomic and clinical data in the comut plot
#'
#'

plot_clinical_tile <- function(melted_clinical, pair_order, variables_to_plot){
  clin_plot <- ggplot(melted_clinical[melted_clinical$variable %in% variables_to_plot,]) +
    geom_tile(aes(x = pair_id, y = variable, fill = value), width = 0.8, height = 0.8) +
    scale_fill_manual(values = clinical_fill) + 
    scale_x_discrete(limits = unlist(pair_order)) +
    theme_clinical + theme(axis.text.x = element_blank())
  return(clin_plot)
}

#' @title Plot purity data
#' 
#' @description This function takes in a long-form, melted dataframe and plots the desired feature as a tile plot ordered by sample name in the comut plot
#' 
#' @param melted_data = dataframe with three columns including 'pair_id', 'variable', and 'value' (ex. Tumor_Normal_pair_01, facets_purity, 0.35)
#' 
#' @param pair_order = the pair order used to align the genomic and clinical data in the comut plot
#'
#'
plot_purity_tile <- function(melted_data, pair_order, variables_to_plot) {
  ggplot(melted_data[melted_data$variable %in% variables_to_plot,]) +
    geom_tile(aes(x = pair_id, y = variable, fill = value), width = 0.8, height = 0.8) + 
    scale_x_discrete(limits = unlist(pair_order)) + 
    scale_fill_gradient(low = "gray90", high = "darkblue") + theme_clinical +
    theme(axis.text.x = element_blank())
}

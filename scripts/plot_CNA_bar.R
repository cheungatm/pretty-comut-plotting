#' @title Plot CNA events
#' 
#' @description This function takes in a long-form, melted dataframe and plots the desired feature as a bar plot ordered by sample name in the comut plot
#' 
#' @param melted_data = dataframe with three columns including 'pair_id', 'variable', and 'value' (ex. Tumor_Normal_pair_01, Num_CNA, 45)
#' 
#' @param pair_order = the pair order used to align the genomic and clinical data in the comut plot
#'


plot_CNA_bar <- function(melted_data, pair_order, variables_to_plot){
  ggplot(melted_data[melted_data$variable %in% variables_to_plot,]) +
    geom_bar(aes(x = pair_id, 
                 y = value, fill = variable), stat = "identity") + #, position = "stack") +
    theme_basic +
    scale_x_discrete(limits = unlist(pair_order)) + 
    xlab("") + ylab("# CNA") +
    theme(axis.text.x = element_blank()) #can change element_blank to remove the labels, element_text to add them
}

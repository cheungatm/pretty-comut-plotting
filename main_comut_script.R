#' @title Create co-mut panel figure with additional features 
#' 
#' @description This main script applies the helper functions from scripts in this local directory, loads the relevant files (with the format specified in each
#'               script), creates each subplot, and uses the 'egg' package to align and plot the figures together.
#' 

## Take in arguments from the command line
args <- commandArgs(trailingOnly = TRUE)
maf_with_pair_id_path <- args[1]
snv_gene_list_path <- args[2]
cna_focality_file_path <- args[3]
cna_gene_list_path <- args[4]
melted_clinical_response_df_path <- args[5]
melted_genomics_df_path <- args[6]
pair_order_list_path <- args[7]
gene_order_list_path <- args[8]
output_file_path <- args[9]

if (length(args) < 9){
  stop("error: nine parameters must be supplied to use this function in the command line.", call.=FALSE)
} 



### Load packages needed to run the script ###
library(dplyr); library(tidyr); library(ggplot2); library(readr); library(egg)

### source() functions located in scripts in this working directory ###
source("./scripts/assess_gene_focality.R")
source('./scripts/themes.R')
source('./scripts/fill_palettes.R')
source('./scripts/build_comut_frame.R')
source('./scripts/plot_comut_frame.R')
source('./scripts/plot_clinical_tile.R')
source('./scripts/plot_CNA_bar.R')
source('./scripts/plot_purity_tile.R')
source('./scripts/plot_TMB_bar.R')

### Load files from subdirectory '.test_data/' ###
maf_with_pair_id = read_tsv('./test_data/shuffled_maf_with_pair_id.maf', comment = '#')
snv_gene_list = read_tsv('./test_data/shuffled_snv_gene_list.tsv')
cna_gene_list = read_tsv('./test_data/shuffled_cna_gene_list.tsv')
cna_focality_file = read_tsv('./test_data/shuffled_focality_file.tsv')
melted_clinical_response_df = read_tsv('./test_data/shuffled_melted_clinical_response.tsv')
melted_genomics_df = read_tsv('./test_data/shuffled_melted_genomics.tsv')
pair_order_list = read_tsv('./test_data/shuffled_pair_order.tsv')
gene_order_list = read_tsv('./test_data/shuffled_gene_order.tsv')

### Load files from args input ###
maf_with_pair_id = read_tsv(maf_with_pair_id_path, comment = '#')
snv_gene_list = read_tsv(snv_gene_list_path)
cna_gene_list = read_tsv(cna_gene_list_path)
cna_focality_file = read_tsv(cna_focality_file_path)
melted_clinical_response_df = read_tsv(melted_clinical_response_df_path)
melted_genomics_df = read_tsv(melted_genomics_df_path)
pair_order_list = read_tsv(pair_order_list_path)
gene_order_list = read_tsv(gene_order_list_path)


### Run functions to build each sub-plot ###
# build co-mut frame for plotting
test_comut_frame <- build_comut_frame(maf_file_large = maf_with_pair_id, snv_genes = snv_gene_list, focality_file = cna_focality_file, cna_genes = cna_gene_list)
# create tile plot of SNVs and CNAs in specified order (determined by input file)

test_comut_plot <- plot_comut_frame(comut_frame = test_comut_frame, pair_order = pair_order_list, gene_order = gene_order_list) +
  theme(plot.margin = margin(-5,0,0,0))

# create tile plot of clinical data (Response to Tx in this case)
test_clinical_plot <- plot_clinical_tile(melted_clinical = melted_clinical_response_df, pair_order = pair_order_list, variables_to_plot = c('Response')) +
  theme(plot.margin = margin(-5,0,0,0))

# create bar plot of copy number events
test_CNA_plot <- plot_CNA_bar(melted_data = melted_genomics_df, pair_order = pair_order_list, variables_to_plot = c('num_CNA')) +
  theme(plot.margin = margin(10,0,0,0))

# create bar plot of copy number events
test_TMB_plot <- plot_TMB_bar(melted_data = melted_genomics_df, pair_order = pair_order_list, variables_to_plot = c('mutational_burden_value')) +
  theme(plot.margin = margin(0,0,0,0))

# create tile plot of purity values
test_purity_plot <- plot_purity_tile(melted_data = melted_genomics_df, pair_order = pair_order_list, variables_to_plot = c('facets_purity')) +
  theme(plot.margin = margin(-5,0,-5,0))

### Compile individual plots into one panel figure (order of plots matters!) ###
final_panel_plot <- egg::ggarrange(plots = list(test_TMB_plot, test_comut_plot, test_purity_plot, test_clinical_plot), ncol = 1, heights = c(1,4,1,1))

###
ggsave('output_pretty_comut_plot.pdf', plot = final_panel_plot, device = "pdf", path = output_file_path, width = 26, height = 13, units = "cm", dpi = 600)

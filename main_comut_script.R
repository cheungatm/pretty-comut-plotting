#' @title Create co-mut panel figure with additional features 
#' 
#' @description This main script applies the helper functions from scripts in this local directory, loads the relevant files (with the format specified in each
#'               script), creates each subplot, and uses the 'egg' package to align and plot the figures together.
#' 

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
egg::ggarrange(plots = list(test_TMB_plot, test_comut_plot, test_purity_plot, test_clinical_plot), ncol = 1, heights = c(1,4,1,1))


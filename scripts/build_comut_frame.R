#' @title Build co-mut frame
#' 
#' @description This takes in a maf file (and an optional CNA focality file) to build the frame necessary for creating the co-mut plot
#' 
#' @param maf_file_large = maf file containing SNV variants (must have column names `pair_id`**, `Hugo_Symbol`, `Variant_Classification`, and `Protein_Change`)
#' ** note: you may need to join pair_id by Tumor_Sample_Barcode into your MAF depending on your naming schema
#' 
#' @param snv_genes = a list of genes to include in the SNV part of the co-mut plot (must have column name `Hugo_Symbol`)
#' 
#' @param focality_file = an optional file containing CNA information (must have column names `pair_id`, `Hugo_Symbol`, `chr`, `start`, `end`, and
#'         `segment_CN_interpretation` which is based on whatever CNA calling method you use (i.e. Homozygous deletion, etc.))
#'         
#' @param cna_genes = a list of genes to include in the CNA part of the co-mut plot (must have column name `Hugo_Symbol`)
#' 
#' @return list including: [[1]] frequency count of mutations if >1 per sample, [[2]] the comut_frame, and [[3]] a compiled list of the SNV and CNA genes
#' 

build_comut_frame <- function(maf_file_large, snv_genes, focality_file = NULL, cna_genes = NULL){
  drivers_frame <- data.frame()
  count_drivers <- data.frame()
  
  maf_file <- maf_file_large
  
  for(sample in unique(maf_file$pair_id)){
    # filter for that pair_id, then filter out nonsyn mutations, and keep only some columns
    frame = maf_file[maf_file$pair_id %in% sample & maf_file$Variant_Classification %in% type_nonsyn, 
                     c("pair_id", "Hugo_Symbol", "Variant_Classification",  "Protein_Change")]
    
    # makes a df of the mutation status for all genes in snv_genes and makes row "NA" if no variant in sample
    frame_temp = merge(frame, snv_genes, by = "Hugo_Symbol", all.y = TRUE)
    
    # makes a data.frame with the Frequency of each mutation in that sample
    frame_temp2 = data.frame(table(frame_temp$Hugo_Symbol))
    frame_temp2$sample = sample
    frame_temp$pair_id = sample
    drivers_frame <- rbind(drivers_frame, frame_temp)
    count_drivers <- rbind(count_drivers, frame_temp2)
    #keep rbinding until all samples done so you get a length of n_samples*n_genes
  }
  # save the genes that had multiple hits within a single sample
  count_drivers2 <- count_drivers[count_drivers$Freq > 1,]
  
  # rename Variant Class in new columns
  drivers_frame$Variant_Classification2 <- drivers_frame$Variant_Classification
  drivers_frame$Variant_Classification2 <- gsub("Frame_Shift_Del", "Frameshift", drivers_frame$Variant_Classification2)
  drivers_frame$Variant_Classification2 <- gsub("Frame_Shift_Ins", "Frameshift", drivers_frame$Variant_Classification2)
  drivers_frame$Variant_Classification2 <- gsub("In_Frame_Del", "In_Frame_Indel", drivers_frame$Variant_Classification2)
  drivers_frame$Variant_Classification2 <- gsub("In_Frame_Ins", "In_Frame_Indel", drivers_frame$Variant_Classification2)
  drivers_frame2 <- data.frame()
  drivers_frame[is.na(drivers_frame$Variant_Classification2), "Variant_Classification2"] <- "none"
  
  if (!is.null(focality_file)){
    focality_file2 <- focality_file[focality_file$pair_id %in% maf_file$pair_id,]
    
    for(gene in unique(cna_genes$Hugo_Symbol)){
      save <- assess_gene_focality(focality_file2, gene)
      if(nrow(save) > 0){
        newrow <- data.frame(
          Hugo_Symbol = rep(paste(gene, "cna", sep = "_"), nrow(save)),
          pair_id = save$pair_id,
          Variant_Classification = save$segment_CN_interpretation,
          Protein_Change = NA,
          Variant_Classification2 = save$segment_CN_interpretation)
        newrow2 <- merge(newrow, data.frame(pair_id = unique(drivers_frame$pair_id), 
                                            Hugo_Symbol = rep(paste(gene, "cna", sep = "_"), 
                                                              length(unique(drivers_frame$pair_id))))
                         , all = TRUE)} else {
                           newrow2 <- data.frame(Hugo_Symbol = rep(paste(gene, "cna", sep = "_"), length(unique(drivers_frame$pair_id))),
                                                 pair_id = unique(drivers_frame$pair_id),
                                                 Variant_Classification = NA,
                                                 Protein_Change = NA,
                                                 Variant_Classification2 = NA)
                         }
      drivers_frame2 <- rbind(drivers_frame2, newrow2)
    }
    drivers_frame <- rbind(drivers_frame, drivers_frame2)
    drivers_frame[is.na(drivers_frame$Variant_Classification2), "Variant_Classification2"] <- "none"
  }
  
  gene_list_output <- unique(drivers_frame$Hugo_Symbol)
  
  return(list(count_drivers2, drivers_frame, gene_list_output))
}
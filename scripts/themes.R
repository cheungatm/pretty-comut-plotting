#' @title Pre-set pretty_comut_plotting Themes for ggplot2
#' 
#' 
#' 


# Comut plot theme
theme_comut <- theme(
  legend.key = element_rect(fill='NA'),
  legend.key.size = unit(0.4, 'cm'),
  legend.title = element_blank(),
  legend.position="right",
  legend.text = element_text(size=8, face="bold"),
  axis.ticks.x=element_blank(),
  axis.ticks.y=element_blank(),
  axis.text.x = element_blank(), #element_text(size = 6, angle = 90, hjust = 1),
  axis.text.y=element_text(colour="Black", size = 10, face = 'italic'),
  axis.title.x= element_blank(),# element_text(face="bold"),
  axis.title.y=element_blank(),
  axis.line.x = element_blank(),
  axis.line.y = element_blank(),
  plot.title = element_text(size = 12),
  panel.grid.major.x=element_blank(),
  panel.grid.major.y=element_blank(),
  panel.grid.minor.x=element_blank(),
  panel.grid.minor.y=element_blank(),
  panel.background=element_blank()
)

theme_clinical <- theme(
  legend.key = element_rect(fill='NA'),
  legend.key.size = unit(0.4, 'cm'),
  legend.title = element_blank(),
  legend.position="right",
  legend.text = element_text(size=8),
  axis.ticks.x=element_blank(),
  axis.ticks.y=element_blank(),
  axis.text.x = element_blank(),#element_text(size = 6, angle = 90, hjust = 1),
  axis.text.y=element_text(colour="Black", size = 10),
  axis.title.x= element_blank(),# element_text(face="bold"),
  axis.title.y=element_blank(),
  plot.title = element_text(size = 12),
  axis.line.x = element_blank(),
  axis.line.y = element_blank(),
  panel.grid.major.x=element_blank(),
  panel.grid.major.y=element_blank(),
  panel.grid.minor.x=element_blank(),
  panel.grid.minor.y=element_blank(),
  panel.background=element_blank()
)

theme_basic <- theme_grey() + 
  theme(plot.background = element_rect(fill = "white"), 
        panel.background = element_rect(fill = "white"),
        panel.grid.major.y = element_line(colour = "gray85", linetype = "longdash"),
        panel.grid.minor.x = element_line(colour = "white"),
        panel.grid.minor.y = element_line(colour = "white"),
        axis.line = element_line(colour = "gray85"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 12, colour = "gray25"),
        plot.title = element_text(size = 12),
        axis.text.x = element_text(angle = 45, vjust = 1, hjust=1, size = 10),
        axis.line.x = element_line(color="gray85", size = 1),
        axis.line.y = element_line(color="gray85", size = 1),
        legend.title = element_blank()
  )
# Pallettes

plot_colours <- list(
  central = c("#74c476", "#41ab5d", "#238b45", "#006d2c","#00441b"),
  east    = c("#f16913"),
  north   = c("#c6dbef", "#9ecae1", "#6baed6", "#4292c6", "#2171b5", "#08519c", "#08306b"),
  south   = c("#9e9ac8", "#807dba", "#6a51a3", "#54278f", "#3f007d"),
  west    = c("#cb181d", "#a50f15", "#67000d"),
  regions = c("#006d2c", "#f16913", "#08519c", "#54278f", "#a50f15")
)

# Plotting theme

plot_theme <- function(base_size = 12, base_family = "sans") {
  theme_classic(base_size = base_size, base_family = base_family) %+replace%
    theme(
      plot.title    = element_text(face = "bold", size = rel(1.3), margin = margin(b = 10), hjust = 0.5),
      plot.subtitle = element_text(size = rel(1), color = "grey30", margin = margin(b = 15), hjust = 0.5),
      plot.caption  = element_text(size = rel(0.8), color = "grey50", margin = margin(t = 15)),
      
      axis.title = element_text(face = "bold"),
      axis.text  = element_text(color = "grey20"),
      axis.line  = element_line(color = "black", linewidth = 0.5),
      
      legend.position   = "top",
      legend.title      = element_blank(),
      legend.background = element_blank(),
      legend.key        = element_blank(),
      
      panel.grid.major.y = element_line(color = "grey95", linewidth = 0.3),
      panel.background   = element_blank(),
      
      strip.background = element_rect(fill = "grey95", color = NA),
      strip.text       = element_text(face = "bold", size = rel(1)),
      
      plot.margin = margin(20, 20, 20, 20)
    )
}
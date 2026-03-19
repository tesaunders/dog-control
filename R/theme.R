# Palettes

region_colours <- c(
  central = "#006d2c", 
  east = "#f16913", 
  north = "#08519c", 
  south = "#54278f", 
  west = "#a50f15"
)

board_colours <- c(
  "Waitematā Local Board Area" = "#74c476", 
  "Albert-Eden Local Board Area" = "#41ab5d", 
  "Puketāpapa Local Board Area"= "#238b45", 
  "Ōrākei Local Board Area" = "#006d2c", 
  "Maungakiekie-Tāmaki Local Board Area" = "#00441b", 
  "Howick Local Board Area" = "#f16913",
  "Rodney Local Board Area" = "#c6dbef", 
  "Hibiscus and Bays Local Board Area" = "#9ecae1", 
  "Upper Harbour Local Board Area" = "#6baed6",
  "Kaipātiki Local Board Area" = "#4292c6",
  "Devonport-Takapuna Local Board Area" = "#2171b5",
  "Aotea/Great Barrier Local Board Area" = "#08519c",
  "Waiheke Local Board Area" = "#08306b",
  "Māngere-Ōtāhuhu Local Board Area" = "#9e9ac8",
  "Ōtara-Papatoetoe Local Board Area" = "#807dba",
  "Manurewa Local Board Area" = "#6a51a3",
  "Papakura Local Board Area" = "#54278f",
  "Franklin Local Board Area" = "#3f007d",
  "Henderson-Massey Local Board Area" = "#cb181d",
  "Waitākere Ranges Local Board Area" = "#a50f15",
  "Whau Local Board Area" = "#67000d",
  "Whangarei District" = "#EEEEEE",
  "Kaipara District" = "#EEEEEE",
  "Thames-Coromandel District" = "#EEEEEE",
  "Hauraki District" = "#EEEEEE",
  "Waikato District" = "#EEEEEE"
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
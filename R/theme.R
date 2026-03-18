# Pallettes


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

# Scales

fmt_pct <- function(x) scales::label_percent(accuracy = 0.1)(x)
fmt_num <- function(x) scales::label_number(big.mark = ",")(x)
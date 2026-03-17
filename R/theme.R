# Pallettes


# Plotting theme

theme_plots <- function(base_size = 11) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title = element_text(face = "bold", hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5),
      
      panel.grid.minor = element_blank(),
      
      strip.text = element_text(face = "bold", size = 12),
      
      legend.position = "bottom",
      plot.margin = margin(t = 20, r = 10, b = 10, l = 10)
    )
}

# ggplot(impound_result, aes(x = year, y = count, fill = category)) +
#   geom_bar(position = "fill", stat = "identity") +
#   scale_fill_manual(values = AKL_COLORS) + # Use your central colors
#   scale_y_continuous(labels = scales::label_percent()) +
#   theme_akl_report() + # Apply your custom theme in one line
#   labs(title = "Impound Outcomes Over Time")

# Scales

fmt_pct <- function(x) scales::label_percent(accuracy = 0.1)(x)

fmt_num <- function(x) scales::label_number(big.mark = ",")(x)
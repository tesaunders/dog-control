# Standardise breed strings by swapping "Last, First" to "First Last"
clean_breed_names <- function(data, columns) {
  data |> 
    mutate(across(all_of(columns), 
                  ~ stringr::str_replace(.x, "^([^,]+),\\s*(.*)$", "\\2 \\1")))
}

# Group by a variable, count, and add a proportion column
calc_proportions <- function(data, group_var, count_name = "n") {
  data |> 
    group_by(across(all_of(group_var))) |> 
    count(name = count_name) |> 
    ungroup() |> 
    mutate(prop = !!sym(count_name) / sum(!!sym(count_name))) |> 
    arrange(desc(prop))
}

# Group raw impound statuses into broader categories for cleaner visualisation
collapse_impound_status <- function(status_vec) {
  case_match(
    status_vec,
    "For Euthanasia" ~ "Euthanised",
    c("Adoption Pending", "Fostered", "Hold - Adoption") ~ "Adopted",
    c("Trfd to Breed Rescue", "Trfd to Other TA", "Trfd to Rescue Group", "Trfd to SPCA") ~ "Rescued",
    c("Dead on Arrival", "Died in Shelter", "Escaped", "Hold - General", 
      "Hold - Legal Reason", "Hold - Temp Test", "Processing", "Stolen") ~ "Other",
    .default = status_vec
  )
}

# Perform a Chi-squared test and return over-represented categories
perform_chisq <- function(data, group_var, cat_var, count_var,
                          res_limit = 2, min_obs = 50) {
  
  # Contingency table 
  matrix_data <- data |> 
    filter(!is.na(.data[[group_var]]), !is.na(.data[[cat_var]])) |> 
    select(all_of(c(group_var, cat_var, count_var))) |> 
    pivot_wider(names_from = .data[[group_var]], 
                values_from = .data[[count_var]], 
                values_fill = 0) |> 
    column_to_rownames(cat_var) |> 
    as.matrix()
  
  # Perform Chi-Squared Test 
  chi_test <- chisq.test(matrix_data, simulate.p.value = TRUE)
  
  # Extract and combine results 
  observed <- as.data.frame(chi_test$observed) |> 
    rownames_to_column("category") |> 
    pivot_longer(-category, names_to = "group", values_to = "observed")
  
  expected <- as.data.frame(chi_test$expected) |> 
    rownames_to_column("category") |> 
    pivot_longer(-category, names_to = "group", values_to = "expected")
  
  residuals <- as.data.frame(chi_test$residuals) |> 
    rownames_to_column("category") |> 
    pivot_longer(-category, names_to = "group", values_to = "residual")
  
  # Join and calculate differences 
  results <- observed |> 
    left_join(expected, by = c("category", "group")) |> 
    left_join(residuals, by = c("category", "group")) |> 
    mutate(
      percent_diff = ((observed - expected) / expected) * 100
    ) |> 
    filter(residual > res_limit, observed >= min_obs) |>
    arrange(group, desc(percent_diff))
  
  return(results)
}

# Plot local board data onto maps
plot_local_board <- function(base_df, 
                             map_df, 
                             fill_var, 
                             title = waiver(),
                             subtitle = waiver(),
                             legend_title = waiver(), 
                             labels = waiver()) {
  ggplot() +
    geom_sf(data = base_df, colour = NA) +
    geom_sf(data = map_df, aes(fill = {{ fill_var }}), colour = "#EEEEEE") + 
    scale_fill_gradient(low = "green", high = "red", name = legend_title, labels = labels) +
    coord_sf(
      xlim = c(1700000, 1830000),
      ylim = c(5869755, 6010000),
      expand = FALSE
    ) +
    theme_void() +
    labs(title = title,
         subtitle = subtitle) +
    theme(plot.title = element_text(face = "bold",
                                    size = 15,
                                    hjust = 0.5,
                                    margin = margin(10, 0, 00, 0)),
          plot.subtitle = element_text(hjust = 0.5,
                                       margin = margin(10, 0, 10, 0)))
}

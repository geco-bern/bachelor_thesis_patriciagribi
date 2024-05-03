#fill data


fill_data <- function(data, variable){

  data <- data|>
    mutate(month = format(date, "%Y-%m"))


  # monthly values
  monthly_values <- data |>
    group_by(month = format(date, "%Y-%m")) |>
    summarize(monthly_variable = mean(variable, na.rm = TRUE))

  # Fill NA values with monthly averages
  filled_df <- data |>
    left_join(monthly_values, by = c("month")) |>
    mutate(variable = ifelse(is.na(variable),
                                       monthly_variable,
                                       variable)) |>
    select(-month, -monthly_variable)

}

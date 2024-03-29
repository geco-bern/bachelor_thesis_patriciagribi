exclude_time_range <- function(data, start_date, end_date){

  adj_data <- data[!(data$date >= start_date & data$date <= end_date), ]

  return (adj_data)

}

# function gridpoint extraction

gridpoint_extraction <- function(data, variable) {

  # indices of the grid point
  start_lon <- 20  # longitude index
  start_lat <- 30 # latitude index

  # get days
  var_dates <- as.Date(data$dim$time$vals, origin = '1850-01-01')

  # get values at location lon lat
  var_output <- ncvar_get(data, varid = variable,
                          start= c(which.min(abs(data$dim$lon$vals - start_lon)), # closest long taken
                                   which.min(abs(data$dim$lat$vals - start_lat)),  # closest lat taken
                                   1),
                          count = c(1,1,-1)) #count '-1' means 'all values along that dimension

  # create dataframe
  var <- data.frame(dates= var_dates, variable = var_output)

  return(var)
}

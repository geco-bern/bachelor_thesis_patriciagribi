# function gridpoint extraction

gridpoint_extraction <- function(data, variable, longitude=7.4351598698922405, latitude=46.95286466584806) {

  # indices of the grid point
  start_lon <- longitude
  start_lat <- latitude


  # get days
  var_dates <- as.Date(data$dim$time$vals, origin = '1850-01-01')

  # get values at location lon lat
  var_output <- ncvar_get(data, varid = variable,
                          start= c(which.min(abs(data$dim$lon$vals - start_lon)), # closest lon taken
                                   which.min(abs(data$dim$lat$vals - start_lat)),  # closest lat taken
                                   1),
                          # specifies number of elements to be retrieved along each dimension.
                          count = c(1,1,-1))  # 1: one element retrieved along lat and lon dim (single grid cell), -1: all available time steps retrieved.

  # create dataframe
  var <- data.frame(dates= var_dates, variable = var_output)

  return(var)
}

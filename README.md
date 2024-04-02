# Trends in Seasonal Water Deficits


## Summary

This bachelor thesis aims to explore trends in seasonal water deficits using data from the Climate Model Intercomparison Project Phase 6 (CMIP6). The data is derived from the CESM2 model and the selected simulation is the ssp585. This corresponds to the future scenarios SSP-RCP8.5 that assume the highest CO2 emissions and predict the strongest warming. The research will focus on deriving evapotranspiration, precipitation and potential evapotranspiration time series across the globe. With the CWD-algorithm implemented by the geco-group time series of the cumulative water deficit (CWD) will be calculated and their long-term trends investigated. The thesis seeks to contribute valuable insights into the understanding of drought impacts in a changing climate and address existing uncertainties in future drought projections.


## Background and Motivation

With further climate change droughts are projected to become more frequent and more intense in many regions of our planet (Calvin et al., 2023). Droughts impose major impacts on fluxes between land and the atmosphere, agricultural production, and the carbon cycle. For example they show a decrease in photosynthesis and tree mortaility (Doughty et al., 2015). Droughts are prolonged dry periods in the natural climate cycle (Drought, 2024) and they occur with the absence of water (Definition of Drought | Did You Know? | National Centers for Environmental Information (NCEI), 2024). 

The quantification of water storage capacity in the root zone of plants is of central importance for an effective assessment of hydrological and ecological forecasts, especially with regard to drought periods. Ecosystems are able to store water in their root zones, which is mainly influenced by the interaction of atmospheric moisture supply and the water demand of the tree canopy. (Gao et al., 2014) The cumulative water deficit (CWD) during dry intervals, using a mass balance approach, serves as a proxy for describing the effective water storage capacity within the root zone (Stocker et al., 2023).

## Objective

The objective of this thesis lies in targeting seasonal water deficits as an impact-relevant quantity measuring the severity of droughts. Using outputs from the Climate Model Intercomparison Project Phase 6 (CMIP6), simulated cumulative water deficit (CWD) time series across the globe for the CESM2 model will be derived and their long-term trends investigated.

The aim especially will be to answer following question: 

- What are the long-term trends in cumulative water deficits and potential cumulative water deficits globally? What is the difference between them? Are there regions experiencing more pronounced or accelerated changes in water deficits?


## Implementation

### Methods

A large part of this work consists of calculating globally the cumulative water deficits using the CWD-algorithm implemented by the R package cwd (Stocker, 2021). The time series obtained provide the basis for the following trend analyses. Certain variables are required for this purpose. These are provided by the CMIP6-ng data set (Brunner et al., 2020).

In order to create representative time series, the data should be available at daily resolution. If daily data was not available, a monthly resolution was chosen. The desired units are mm day-1.

The CWD is determined in this work from the cumulative difference of actual ET and the liquid-water infiltration to the soil. The CWD-algorithm expects a variable representing the daily soil water balance (evapotranspiration - liquid-water infiltration to the soil as precipitation and/or snowmelt) and then is summed up daily as long as the rain has not reduced the running sum to zero. The same calculation is applied to the 2nd approach taken but based on potential evapotranspiration.  (Stocker et al., 2023)

### Variable Selection

Variables needed:

- **Evapotranspiration (ET)** or, if ET is not available, **latent heat flux** (in energy units W m-2). To convert ET into mass units the following variables are required according to the CWD-algorithm: temperature, latent heat flux and atmospheric pressure (Pa).
- **Potential Evapotranspiration (PET)**. If not available, **daily surface net radiation** and **temperature** (daily mean)
- **Precipitation** (for rain and snowfall)

Following variables have been downloaded:

- **evspsbl**: **Evapotranspiration**, monthly available, on the native grid, with units kg m-2 s-1
- **hfls**: **Surface Upward Latent Heat Flux**, available monthly, on the native grid, units W m-2
- **rlds**: **Surface Downwelling Longwave Radiation**, monthly available, on the native grid with units W m-2
- **rlus**: **Surface Upwelling Longwave Radiation**, monthly available, on the native grid with units W m-2
- **rsds**: **Surface Downwelling Shortwave Radiation**, available per month, on the native grid with units W m-2
- **rsus**: **Surface Upwelling Shortwave Radiation**, monthly available, on the native grid with units W m-2
- **tas**: **Near-Surface Air Temperature**, daily available, as well on the native grid, in K
- **pr**: **Precipitation**, is available per day, on the native grid with units kg m-2 s-1


*Native grid: according to CMIP6-ng data set (Brunner et al., 2020) the native grid corresponds to either data reported on a model's native grid, regridded data reported on the data provider's preferred target grid, regridded data reported on a grid other than the native grid and other than the preferred target grid or global mean data. The priorities follow a descending order.*

As evapotranspiration the surface upward latent heat flux variable will be utilised. The units will be converted to mass units with the provided function in the CWD-algorithm. For the conversion, atmospheric pressure (Pa) is a necessary parameter. To be able to perform the calculations, a default value for atmospheric pressure will be assumed.

Regarding the variables, there is no potential evapotranspiration available. To obtain it, instead daily surface net radiation and temperature will be used. Oudin et al. showed that very simple models relying only on extraterrestrial radiation and mean daily temperature are as efficient as more complex models such as the Penman model and its variants. (Oudin et al., 2005) The potential ET in this work will be calculated as following: 
This is comprised of the variables surface down- and upwelling long- and shortwave radiation, as well as temperature.

Moreover, there is only precipitation contained as a variable with no distinction of snow. Consequently the snow will be modeled, again with a provided function by the CWD-algorithm. The reason for the distinction between snow and precipitation is due to the effect of snowpack as a temporary water storage that supplies the infiltration to the soil during spring and early summer (Stocker et al., 2023).

### Data Structure and Visualizations

https://github.com/geco-bern/bachelor_thesis_patriciagribi/blob/main/vignettes/implementation_project_proposal.Rmd


## Timeline

https://github.com/geco-bern/bachelor_thesis_patriciagribi/blob/main/Coordination/Timeline.xlsx 


## Risks and Contingency

This Bachelor's thesis presents several challenges in dealing with large amounts of data and the use of complex analysis methods. 

A significant risk lies in the difficulty of accessing the needed data due to the enormous volumes of it. Downloading the data is time-consuming due to its size and requires resources that exceed the capacity of a conventional laptop. The solution is to use a server to speed up the download process and enable efficient data management.

The enormous amount of data requires a precise selection of the variables, the model and the spatial extent. The challenge is to identify and select the required data points in order to enable an efficient calculation of cumulative water deficits (CWD). The focus is initially placed on individual grid points. An iterative process is carried out to gradually increase the amount of data to finally obtain global time series.

Another difficulty is not only the quantity but also the complexity of the data structures. The challenge lies in finding the way through the extensive data and ensuring that the selected data represents the required information.

The data must meet the specific requirements of the CWD algorithm to ensure that the analysis runs smoothly. The challenge lies in ensuring that the selected data is available in a format suitable for the algorithm.

Finally, it'll be difficult to determine how deeply to analyze the data to make meaningful conclusions and share interesting findings. To target this issue, it'll be important to maintain a constant dialogue with the supervisor.

## Impact

This research project aims to contribute to our understanding of trends in cumulative water deficits across the globe. This CWD-algorithm has never been applied to the CMIP6 data, nor to models with future projections. In general, the daily resolution and the units considered (mm) help to establish a concrete link to the storage capacity of the soil and the soil depth. Finally, the results will allow direct and concrete conclusions to be drawn.

## Literature

- Brunner, L., Hauser, M., Lorenz, R., and Beyerle, U.: The ETH Zurich CMIP6 next generation archive: technical documentation, https://doi.org/10.5281/zenodo.3734128, 2020.
- Calvin, K., Dasgupta, D., Krinner, G., Mukherji, A., Thorne, P. W., Trisos, C., Romero, J., Aldunce, P., Barrett, K., Blanco, G., Cheung, W. W. L., Connors, S., Denton, F., Diongue-Niang, A., Dodman, D., Garschagen, M., Geden, O., Hayward, B., Jones, C., Jotzo, F., Krug, T., Lasco, R., Lee, Y.-Y., Masson-Delmotte, V., Meinshausen, M., Mintenbeck, K., Mokssit, A., Otto, F. E. L., Pathak, M., Pirani, A., Poloczanska, E., Pörtner, H.-O., Revi, A., Roberts, D. C., Roy, J., Ruane, A. C., Skea, J., Shukla, P. R., Slade, R., Slangen, A., Sokona, Y., Sörensson, A. A., Tignor, M., Van Vuuren, D., Wei, Y.-M., Winkler, H., Zhai, P., Zommers, Z., Hourcade, J.-C., Johnson, F. X., Pachauri, S., Simpson, N. P., Singh, C., Thomas, A., Totin, E., Arias, P., Bustamante, M., Elgizouli, I., Flato, G., Howden, M., Méndez-Vallejo, C., Pereira, J. J., Pichs-Madruga, R., Rose, S. K., Saheb, Y., Sánchez Rodríguez, R., Ürge-Vorsatz, D., Xiao, C., Yassaa, N., Alegría, A., Armour, K., Bednar-Friedl, B., Blok, K., Cissé, G., Dentener, F., Eriksen, S., Fischer, E., Garner, G., Guivarch, C., Haasnoot, M., Hansen, G., Hauser, M., Hawkins, E., Hermans, T., Kopp, R., Leprince-Ringuet, N., Lewis, J., Ley, D., Ludden, C., Niamir, L., Nicholls, Z., Some, S., Szopa, S., Trewin, B., Van Der Wijst, K.-I., Winter, G., Witting, M., Birt, A., Ha, M., et al.: IPCC, 2023: Climate Change 2023: Synthesis Report. Contribution of Working Groups I, II and III to the Sixth Assessment Report of the Intergovernmental Panel on Climate Change [Core Writing Team, H. Lee and J. Romero (eds.)]. IPCC, Geneva, Switzerland., Intergovernmental Panel on Climate Change (IPCC), https://doi.org/10.59327/IPCC/AR6-9789291691647, 2023.
- Definition of Drought | Did You Know? | National Centers for Environmental Information (NCEI): https://www.ncei.noaa.gov/access/monitoring/dyk/drought-definition, last access: 14 March 2024.
- Doughty, C. E., Metcalfe, D. B., Girardin, C. a. J., Amézquita, F. F., Cabrera, D. G., Huasco, W. H., Silva-Espejo, J. E., Araujo-Murakami, A., da Costa, M. C., Rocha, W., Feldpausch, T. R., Mendoza, A. L. M., da Costa, A. C. L., Meir, P., Phillips, O. L., and Malhi, Y.: Drought impact on forest carbon dynamics and fluxes in Amazonia, Nature, 519, 78–82, https://doi.org/10.1038/nature14213, 2015.
- Drought: https://www.who.int/health-topics/drought, last access: 14 March 2024.
- Gao, H., Hrachowitz, M., Schymanski, S. J., Fenicia, F., Sriwongsitanon, N., and Savenije, H. H. G.: Climate controls how ecosystems size the root zone storage capacity at catchment scale, Geophysical Research Letters, 41, 7916–7923, https://doi.org/10.1002/2014GL061668, 2014.
- Oudin, L., Hervieu, F., Michel, C., Perrin, C., Andréassian, V., Anctil, F., and Loumagne, C.: Which potential evapotranspiration input for a lumped rainfall–runoff model?: Part 2—Towards a simple and efficient potential evapotranspiration model for rainfall–runoff modelling, Journal of Hydrology, 303, 290–306, https://doi.org/10.1016/j.jhydrol.2004.08.026, 2005.
- Stocker, B.: cwd v1.0: R package for cumulative water deficit calculation, , https://doi.org/10.5281/zenodo.5359053, 2021.
- Stocker, B. D., Tumber-Dávila, S. J., Konings, A. G., Anderson, M. C., Hain, C., and Jackson, R. B.: Global patterns of water storage in the rooting zones of vegetation, Nat. Geosci., 16, 250–256, https://doi.org/10.1038/s41561-023-01125-2, 2023.










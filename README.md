# Trends in Seasonal Water Deficits

## Summary

This bachelor thesis aims to explore trends in seasonal water deficits using data from the Climate Model Intercomparison Project Phase 6 (CMIP6). The research will focus on deriving evapotranspiration, precipitation and potential evapotranspiration time series across the globe from first one, then multiple models. With the cwd-algorithm implemented by the geco-group time series of the cumulative water deficit (CWD) will be calculated and their long-term trends investigated. The thesis seeks to contribute valuable insights into the understanding of drought impacts in a changing climate and address existing uncertainties in future drought projections.

## Background and Motivation

Droughts have major impacts on fluxes between land and the atmosphere, agricultural production, and the carbon cycle. Future projections of drought magnitude and frequencies are surprisingly divergent and interpretations of trends from Earth System Model outputs have drawn conflicting pictures of drought impact trends in a heating climate. Trends in precipitation, evapotranspiration, soil moisture, and runoff often point in different directions and are relevant for different aspects of what may be referred to as a “droughts”. 

## Objective

The objective of this thesis lies in targeting seasonal water deficits as an impact-relevant quantity measuring the severity of droughts. Using outputs from the Climate Model Intercomparison Project Phase 6 (CMIP6), simulated cumulative water deficit (CWD) time series across the globe for first one, then multiple models, will be derived and their long-term trends investigated.

The aim especially will be to answer following question: 

- What are the long-term trends in cumulative water deficits globally, and how do these trends correlate with climate model outputs (single variables for instance temperature, precipitation...)? Are there regions experiencing more pronounced or accelerated changes in water deficits?

## Implementation

https://github.com/geco-bern/bachelor_thesis_patriciagribi/blob/main/vignettes/implementation_project_proposal.Rmd

## Timeline

https://github.com/geco-bern/bachelor_thesis_patriciagribi/blob/main/Coordination/Timeline.xlsx 

## Risks and Contingency

This Bachelor's thesis presents several challenges in dealing with large amounts of data and the use of complex analysis methods. 

A significant risk lies in the difficulty of accessing the needed data due to the enormous volumes of it. Downloading the data is time-consuming due to its size and requires resources that exceed the capacity of a conventional laptop. The solution is to use a server to speed up the download process and enable efficient data management.

The enormous amount of data requires a precise selection of the variables, the model and the spatial extent. The challenge is to identify and select the required data points in order to enable an efficient calculation of cumulative water deficits (CWD). The focus is initially placed on individual grid points. An iterative process is carried out to gradually increase the amount of data to finally obtain global time series.

Another difficulty is not only the quantity but also the complexity of the data structures. The challenge lies in finding your way through the extensive data and ensuring that the selected data represents the required information.

The data must meet the specific requirements of the CWD algorithm to ensure that the analysis runs smoothly. The challenge lies in ensuring that the selected data is available in a format suitable for the algorithm.

Finally, it'll be difficult to determine how deeply to analyze the data to make meaningful conclusions and share interesting findings. To target this issue, it'll be important to maintain a constant dialogue with the supervisor.

## Impact

This research project aims to contribute to our understanding of trends in cumulative water deficits across the globe.

relationship cwd and droughts

## Literature

Brunner, L., Hauser, M., Lorenz, R., and Beyerle, U.: The ETH Zurich CMIP6 next generation archive: technical documentation, https://doi.org/10.5281/zenodo.3734128, 2020.





# Trends in Seasonal Water Deficits

## Summary

This bachelor thesis aims to explore trends in seasonal water deficits using data from the Climate Model Intercomparison Project Phase 6 (CMIP6). The research will focus on deriving evapotranspiration, precipitation and potential evapotranspiration time series across the globe from first one, then multiple models. With the cwd-algorithm implemented by the geco-group time series of the cumulative water deficit (CWD) will be calculated and their long-term trends investigated. The thesis seeks to contribute valuable insights into the understanding of drought impacts in a changing climate and address existing uncertainties in future drought projections.

## Background and Motivation
Why is your project important? What is known and unknown?

Droughts have major impacts on fluxes between land and the atmosphere, agricultural production, and the carbon cycle. Future projections of drought magnitude and frequencies are surprisingly divergent and interpretations of trends from Earth System Model outputs have drawn conflicting pictures of drought impact trends in a heating climate. Trends in precipitation, evapotranspiration, soil moisture, and runoff often point in different directions and are relevant for different aspects of what may be referred to as a “droughts”. 

## Objective
Describe the goal of your project. What will be the result, answering what question?

The objective of this thesis lies in targeting seasonal water deficits as an impact-relevant quantity measuring the severity of droughts. Using outputs from the Climate Model Intercomparison Project Phase 6 (CMIP6), simulated cumulative water deficit (CWD) time series across the globe for multiple models will be derived and their long-term trends investigated.

Possible research questions: 

- What are the long-term trends in cumulative water deficits globally, and how do these trends correlate with climate model outputs? Are there regions experiencing more pronounced or accelerated changes in water deficits?
- How sensitive are the results to variations in CMIP6 models, and what level of uncertainty is associated with the derived time series of evapotranspiration, precipitation, potential evapotranspiration, and cumulative water deficits?


## Implementation

What approach will you take to achieve the goal in terms of data and methods?

Um die kumulativen Wasserdefizite zu berechnen werden folgende Variablen benötigt: 

•	Evapotranspiration (ET) oder, falls ET nicht vorhanden, latent heat flux
•	Precipitation, falls möglich separat für Regen und Schneefall
•	Potential Evapotranspiration (PET). Falls nicht vorhanden, werden daily surface net radiation und Temperatur (daily mean) benutzt werden.

Diese Daten werden im CMIP6-ng Datensatz zur Verfügung gestellt (Zitieren). Die Daten werden aus täglicher Auflösung entnommen.
Das original (native) grid wird verwendet und die gewünschten Einheiten betragen mm day-1.

Die benötigten Daten werden heruntergeladen und dann durch den CWD-Algorithmus (Zitieren) gespiesen, um die kumulativen Wasserdefizite zu berechnen.

Mit dem Output, den Zeitreihen der kumulativen Wasserdefizite, werden schliesslich globale Trends analysiert. 

Die Trendanalyse beinhaltet eine Regression.

Einfügen: 1. Download der Daten und Vorgehen dazu

## Timeline

https://github.com/geco-bern/bachelor_thesis_patriciagribi/blob/main/Coordination/Timeline.xlsx 

## Risks and Contingency

This Bachelor's thesis presents several challenges in dealing with large amounts of data and the use of complex analysis methods. 

A significant risk lies in the difficulty of accessing data due to the enormous volumes of data. Downloading the data is time-consuming due to its size and requires resources that exceed the capacity of a conventional laptop. The solution is to use a server to speed up the download process and enable efficient data management.

The enormous amount of data requires a precise selection of the variables, the model and the spatial extent. The challenge is to identify and select the required data points in order to enable an efficient calculation of cumulative water deficits (CWD). The focus is initially placed on individual grid points. An iterative process is carried out to gradually increase the amount of data to finally obtain global time series.

Another difficulty is not only the quantity but also the complexity of the data structures. The challenge lies in finding your way through the extensive data and ensuring that the selected data represents the required information.

The data must meet the specific requirements of the CWD algorithm to ensure that the analysis runs smoothly. The challenge lies in ensuring that the selected data is available in a format suitable for the algorithm.

Finally, it'll be difficult to determine how deeply to analyze the data to make meaningful conclusions and share interesting findings. To target this issue, it'll be important to maintain a constant dialogue with the supervisor.


## Impact



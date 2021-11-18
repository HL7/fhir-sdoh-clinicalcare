###  Draft Specifications for Exchange of Race and Ethnicity Data

This Implementation Guide (IG) has defined draft specifications for the exchange of race and ethnicity data to meet reporting requirements promulgated by a number of states.  Specific organizations require that the source and method of collection of race and ethnicity data must also be reported.

The current extension for race and ethnicity for the US Core Patient profile do not allow for multiple occurrence of either extension or the definition of source and method of collection.

Since the characteristics of race and ethnicity data are more consistent with an observation than demographic data, we have elected to model the specification as profiles on the base Observation resource.

There are two Observation profiles included in this IG:

1. Race: 
2. Ethnicity: 

Please test these two profiles and provide feedback on any changes that are necessary to support the exchange of race and ethnicity data.  Please pay specific attention to the method of specifying source of the data (via a reference) and method of collection (codable concept)
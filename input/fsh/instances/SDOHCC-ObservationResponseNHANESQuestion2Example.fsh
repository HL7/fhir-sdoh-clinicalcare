Instance: SDOHCC-ObservationResponseNHANESQuestion2Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Question 2 Example"
Description: "An example of a screening response Observation that represents the second question from the NHANES assessment instrument represented in LOINC."
Usage: #example
* insert NHANESCommon
* category[screening-assessment][sdoh] = USCoreCategory#sdoh "SDOH"
* code = $loinc#76508-1 "In a typical week, how many times do you talk on the telephone with family, friends, or neighbors [NHANES III]"
* valueQuantity = 7 '/wk' "per week"

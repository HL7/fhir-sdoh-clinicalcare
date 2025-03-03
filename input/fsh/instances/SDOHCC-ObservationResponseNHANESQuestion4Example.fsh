Instance: SDOHCC-ObservationResponseNHANESQuestion4Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Question 4 Example"
Description: "An example of a screening response Observation that represents the fourth question from the NHANES assessment instrument represented in LOINC."
Usage: #example
* insert NHANESCommon
* category[screening-assessment][sdoh] = USCoreCategory#sdoh "SDOH"
* code = $loinc#76510-7	"How often do you attend church or religious services [NHANES]"
* valueQuantity = 7 '/wk' "per week"

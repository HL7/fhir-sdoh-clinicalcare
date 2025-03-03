Instance: SDOHCC-ObservationResponseNHANESQuestion1Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Question 1 Example"
Description: "An example of a screening response Observation that represents the first question from the NHANES assessment instrument represented in LOINC."
Usage: #example
* insert NHANESCommon
* category[screening-assessment][sdoh] = USCoreCategory#sdoh "SDOH"
* code = $loinc#63503-7	"Marital status [NHANES]"
* valueCodeableConcept = $loinc#LA48-4 "Married"

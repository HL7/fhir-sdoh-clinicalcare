Instance: SDOHCC-ObservationResponseNHANESQuestion6Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Question 6 Example"
Description: "An example of a screening response Observation that represents the score from the NHANES assessment instrument represented in LOINC.  This result is derived from the
results of the 5 questions."
Usage: #example
* insert NHANESCommon
* category[screening-assessment][sdoh] = USCoreCategory#sdoh "SDOH"
* code = $loinc#76512-3	"Social isolation score [NHANES]"
* valueQuantity.value = 4
* valueQuantity.unit = "{Number}"
* derivedFrom[0].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion1Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion2Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion3Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion4Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion5Example"

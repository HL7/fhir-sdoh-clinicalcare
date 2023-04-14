Instance: SDOHCC-ObservationResponseNHANESQuestion6Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Question 6 Example"
Description: "An example of a screening response Observation that represents the score from the NHANES screening questionnaire represented in LOINC."
Usage: #example
* insert NHANESCommon
* code = $loinc#76512-3	"Social isolation score [NHANES]"
* valueInteger = 7
* derivedFrom[0].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion1Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion2Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion3Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion4Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion5Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion6Example"

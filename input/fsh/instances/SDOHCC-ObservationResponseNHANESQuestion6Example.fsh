Instance: SDOHCC-ObservationResponseNHANESQuestion6Example
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC Observation Response NHANES Question 6 Example"
Description: "An example of an Observation grouping that uses hasMember to group 6 Observations from the LOINC Social connection and isolation panel (LOINC code 76506-5)
because QuestionnaireResponse is not referenced by the 6 individual Observations created from the panel. In the absence of the references to QuestionnaireResponse,
this example illustrates how the 6 Observations from the panel can be linked in an Observation grouping.An example of an Observation grouping that uses hasMember to group
6 Observations from the LOINC Social connection and isolation panel (LOINC code 76506-5) because QuestionnaireResponse is not referenced by the 6 individual Observations created from the panel.
In the absence of the references to QuestionnaireResponse, this example illustrates how the 6 Observations from the panel can be linked in an Observation grouping."
Usage: #example
* insert NHANESCommon
* code = $loinc#76512-3	"Social isolation score [NHANES]"
* valueInteger = 7
* derivedFrom[0].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion1Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion2Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion3Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion4Example"
* derivedFrom[+].reference = "Observation/SDOHCC-ObservationResponseNHANESQuestion5Example"

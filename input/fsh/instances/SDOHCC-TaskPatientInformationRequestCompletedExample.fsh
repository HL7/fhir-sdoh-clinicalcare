Instance: SDOHCC-TaskPatientInformationRequestCompletedExample
InstanceOf: SDOHCCTaskForPatient
Title: "SDOHCC Task Patient Information Request Completed Example"
Description: "An example of a completed Task For Patient where the task was a request for information."
Usage: #example
* intent = #order
* status = #completed
* priority = #routine
* code = $SDOHCC-CodeSystemTemporaryCodes#general-information "General Information"
* description = "Do you prefer a food voucher for Safeway or Walmart?"
* for.reference = "Patient/pat-53234"
* for.display = "COLIN ABBAS"
* authoredOn = "2020-09-12T21:56:54.671Z"
* requester.reference = "Organization/SDOHCC-OrganizationClinicExample"
* owner.reference = "Patient/pat-53234"
* owner.display = "COLIN ABBAS"
* output.valueString = "Safeway, please"
* output.type = $SDOHCC-CodeSystemTemporaryCodes#general-information-response "General Information Response"
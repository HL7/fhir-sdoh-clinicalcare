Instance: SDOHCC-TaskPatientMakeAppointmentCompletedExample
InstanceOf: SDOHCCTaskForPatient
Title: "SDOHCC Task Patient Make Appointment Completed Example"
Description: "An example of a completed Task For Patient where the task was to make an appointment."
Usage: #example
* meta.versionId = "4"
* meta.lastUpdated = "2022-04-13T17:35:32.937+00:00"
* meta.source = "#AgFfi8RxNItzkrVa"
* intent = #order
* status = #completed
* priority = #routine
* code = $SDOHCC-CodeSystemTemporaryCodes#make-contact "Make Contact"
* description = "Please contact the clinic to schedule your appointment"
* for.reference = "Patient/pat-53234"
* for.display = "COLIN ABBAS"
* authoredOn = "2020-09-12T21:56:54.671Z"
* requester.reference = "Organization/SDOHCC-OrganizationClinicExample"
* owner.reference = "Patient/pat-53234"
* owner.display = "COLIN ABBAS"
* input.type = $SDOHCC-CodeSystemTemporaryCodes#contact-entity "Contact Entity"
* input.valueReference.reference = "HealthcareService/SDOHCC-HealthcareServiceTelecomAppointmentExample"
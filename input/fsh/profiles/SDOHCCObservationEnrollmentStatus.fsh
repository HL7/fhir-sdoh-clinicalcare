Profile: SDOHCCObservationEnrollmentStatus
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-simple-observation|7.0.0
Id: SDOHCC-ObservationEnrollmentStatus
Title: "SDOHCC Observation Enrollment Status"
Description: "For observations about an individual's enrollment status in a social care program. This profile is intended for draft use only."
* ^status = #active
* ^abstract = false
* . ^definition = "For observations about an individual's enrollment status in a social care program."
* . ^comment = "For observations about an individual's enrollment status in a social care program."
* code = $SDOHCC-CodeSystemTemporaryCodes#enrollment-status
* value[x] 1..
* value[x] from SDOHCC-ValueSetEnrollmentStatus (preferred)
* value[x] ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations."
* value[x] ^binding.description = "Codes for enrollment status"
* focus 1..
* focus only Reference(SDOHCCHealthcareService) 
// * dataAbsentReason ..0
// * method 1.. MS
// * method from SDOHCCValueSetObservationMethod (extensible)
// * method ^binding.description = "Methods for personal characteristic observations."
Profile: SDOHCCObservationEnrollmentStatus
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-simple-observation|7.0.0
Id: SDOHCC-ObservationEnrollmentStatus
Title: "SDOHCC Observation Enrollment Status"
Description: "For observations about an individual's enrollment status in a social care program. This profile is intended for draft use only."
* ^status = #active
* ^abstract = false
* . ^definition = "For observations about an individual's enrollment status in a social care program."
* . ^comment = "For observations about an individual's enrollment status in a social care program."

* category contains
    SDOHCC 0..* MS
* category[us-core] 1..*
* category[us-core] ^short = "Requires at least a category code 'sdoh'"
* category[us-core] ^condition = "SDOH-Obs-4"
* category[SDOHCC] = $SDOHCC-CodeSystemTemporaryCodes#enrollment-status
// * category[SDOHCC] from SDOHCCValueSetSDOHCategory (required)
* category[SDOHCC] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOHCC] ^definition = "An SDOH category assigned to the observation."
* category[SDOHCC] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to an observation. It is recommended that SDOH category codes be used to facilitate searching for SDOH observations."
* category[SDOHCC] ^binding.description = "Codes for high-level SDOH categories."


* code from http://hl7.org/fhir/ValueSet/program (preferred)
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
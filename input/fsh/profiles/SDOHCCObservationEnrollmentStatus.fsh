Profile: SDOHCCObservationProgramEnrollmentStatus
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-simple-observation|7.0.0
Id: SDOHCC-ObservationProgramEnrollmentStatus
Title: "SDOHCC Observation Program Enrollment Status"
Description: "For observations about an individual's enrollment status in a social care program. See [Enrollment Status](enrollment.html) for more additional guidance."
* ^status = #active
* ^abstract = false
* . ^definition = "For observations about an individual's enrollment status in a social care program."
* . ^comment = "For observations about an individual's enrollment status in a social care program."
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = 1

* category contains
    enrollment 0..1 and
    SDOHCC 0..* MS
* category[us-core] 1..*
* category[us-core] ^short = "Requires at least a category code 'sdoh'"
* category[us-core] ^condition = "SDOH-Obs-4"
* category[enrollment] = $SDOHCC-CodeSystemTemporaryCodes#program-enrollment
* category[SDOHCC] from SDOHCCValueSetSDOHCategory (required)
* category[SDOHCC] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOHCC] ^definition = "An SDOH category assigned to the observation."
* category[SDOHCC] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to an observation. It is recommended that SDOH category codes be used to facilitate searching for SDOH observations."
* category[SDOHCC] ^binding.description = "Codes for high-level SDOH categories."

* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.312 (preferred)
* value[x] 1..
* value[x] from SDOHCC-ValueSetEnrollmentStatus (preferred)
* value[x] ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations."
* value[x] ^binding.description = "Codes for enrollment status"
* focus only Reference(SDOHCCHealthcareService) 
* effective[x] ^definition = "For program enrollment status, a single effective date indicates the date of program  enrollment and a period indicates the duration of the program enrollment."
// * dataAbsentReason ..0
// * method 1.. MS
// * method from SDOHCCValueSetObservationMethod (extensible)
// * method ^binding.description = "Methods for personal characteristic observations."
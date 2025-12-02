Profile: SDOHCCObservationRaceOMB
Parent: SDOHCCObservationPersonalCharacteristic
Id: SDOHCC-ObservationRaceOMB
Title: "SDOHCC Observation Race OMB"
Description: "Profile for race observations that use Office of Management and Budget (OMB) race category codes and CDC race codes. For further details on this profile see [Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)."

* ^status = #active
* ^abstract = false
* obeys SDOH-Race-1
* . ^short = "Race observation"
* . ^definition = "For race observations that use Office of Management and Budget (OMB) race category codes and CDC race codes."
* . ^comment = "For observations about the race of an individual."
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = 1

* code = $loinc#72826-1
* value[x] ..0
* dataAbsentReason MS
* dataAbsentReason from SDOHCCValueSetObservationDataAbsentReason (required)
* dataAbsentReason ^condition = "SDOH-Race-1"
* method 1.. MS
* method from SDOHCCValueSetObservationMethod (extensible)
* method ^binding.description = "Methods for personal characteristic observations."
* component ^slicing.discriminator[0].type = #value
* component ^slicing.discriminator[=].path = "code"
* component ^slicing.discriminator[+].type = #type
* component ^slicing.discriminator[=].path = "value"
* component ^slicing.discriminator[+].type = #value
* component ^slicing.discriminator[=].path = "value"
* component ^slicing.rules = #open
* component ^definition = "Some observations have multiple component observations.  These component observations are expressed as separate code value pairs that share the same attributes."
* component ^comment = "For a discussion on the ways Observations can be assembled in groups together see [Notes](observation.html#notes) below. NOTE: The same LOINC code is used for all three components of this draft profile. If the profile is adopted as part of the US Core standard, new LOINC codes (possibly a panel) will be needed to represent the components (e.g., a new LOINC code for detailed race and for text description of race)."
* component ^requirements = "Component observations share the same attributes in the Observation resource as the primary observation and are always treated a part of a single observation (they are not separable)."
* component ^condition = "SDOH-Race-1"
* component contains
    RaceDescription 0..1 MS and
    Race 0..5 MS and
    DetailedRace 0..*
* component[RaceDescription].code = $loinc#72826-1
* component[RaceDescription].code MS
* component[RaceDescription].value[x] 1.. MS
* component[RaceDescription].value[x] only string
* component[RaceDescription].dataAbsentReason ..0
* component[RaceDescription].interpretation ..0
* component[RaceDescription].referenceRange ..0
* component[Race].code = $loinc#72826-1
* component[Race].code MS
* component[Race].value[x] 1.. MS
* component[Race].value[x] only CodeableConcept
* component[Race].value[x] from $2.16.840.1.113883.3.2074.1.1.3 (required)
* component[Race].value[x] ^short = "Race category codes"
* component[Race].value[x] ^definition = "Office of Management and Budget (OMB) codes for race categories."
* component[Race].value[x] ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations. Note: The binding to [Race Category Excluding Nulls](https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113883.3.2074.1.1.3) is used in lieu of [US Core OMB Race Categories](http://hl7.org/fhir/us/core/ValueSet/omb-race-category) because the US Core value set includes null flavors."
* component[Race].value[x] ^binding.description = "Codes for the five OMB race categories"
* component[Race].dataAbsentReason ..0
* component[Race].interpretation ..0
* component[Race].referenceRange ..0
* component[DetailedRace].code = $loinc#72826-1
* component[DetailedRace].code MS
* component[DetailedRace].value[x] 1.. MS
* component[DetailedRace].value[x] only CodeableConcept
* component[DetailedRace].value[x] from DetailedRace|7.0.0 (required)
* component[DetailedRace].value[x] ^short = "Detailed race codes"
* component[DetailedRace].value[x] ^binding.description = "CDC race codes that further specify the 5 OMB race category codes"
* component[DetailedRace].dataAbsentReason ..0
* component[DetailedRace].interpretation ..0
* component[DetailedRace].referenceRange ..0
Profile: SDOHCCObservationRaceOMB
Parent: SDOHCCObservationPersonalCharacteristic
Id: SDOHCC-ObservationRaceOMB
Title: "SDOHCC Observation Race OMB"
Description: "Profile for race observations that use Office of Management and Budget (OMB) race category codes and CDC race codes. This profile is intended for draft use only. The Cross-Group Projects work group granted a variance to US Core on 06/23/2022 - Jira ticket FHIR-37582. For further details on this profile see [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)."
* ^meta.versionId = "16"
* ^meta.lastUpdated = "2022-07-22T17:48:33.877+00:00"
* ^meta.source = "#GREZoFoSWb9xb20X"
* ^status = #draft
* ^abstract = false
* obeys SDOH-Race-1
* . ^short = "Race observation"
  * ^definition = "For race observations that use Office of Management and Budget (OMB) race category codes and CDC race codes."
  * ^comment = "For observations about the race of an individual."
* code = $loinc#72826-1
* value[x] ..0
* dataAbsentReason MS
* dataAbsentReason from SDOHCCValueSetObservationDataAbsentReason (required)
  * ^condition = "SDOH-Race-1"
* method 1.. MS
* method from SDOHCCValueSetObservationMethod (extensible)
  * ^binding.description = "Methods for personal characteristic observations."
* component ^slicing.discriminator[0].type = #pattern
  * ^slicing.discriminator[=].path = "code"
  * ^slicing.discriminator[+].type = #type
  * ^slicing.discriminator[=].path = "value"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "value"
  * ^slicing.rules = #open
  * ^definition = "Some observations have multiple component observations.  These component observations are expressed as separate code value pairs that share the same attributes."
  * ^comment = "For a discussion on the ways Observations can be assembled in groups together see [Notes](observation.html#notes) below. NOTE: The same LOINC code is used for all three components of this draft profile. If the profile is adopted as part of the US Core standard, new LOINC codes (possibly a panel) will be needed to represent the components (e.g., a new LOINC code for detailed race and for text description of race)."
  * ^requirements = "Component observations share the same attributes in the Observation resource as the primary observation and are always treated a part of a single observation (they are not separable)."
  * ^condition = "SDOH-Race-1"
* component contains
    RaceDescription 0..1 MS and
    Race 0..5 MS and
    DetailedRace 0..*
* component[RaceDescription] ^definition = "Some observations have multiple component observations.  These component observations are expressed as separate code value pairs that share the same attributes."
  * ^requirements = "Component observations share the same attributes in the Observation resource as the primary observation and are always treated a part of a single observation (they are not separable)."
  * code = $loinc#72826-1
  * code MS
  * value[x] 1.. MS
  * value[x] only string
  * dataAbsentReason ..0
  * interpretation ..0
  * referenceRange ..0
* component[Race] ^definition = "Some observations have multiple component observations.  These component observations are expressed as separate code value pairs that share the same attributes."
  * ^requirements = "Component observations share the same attributes in the Observation resource as the primary observation and are always treated a part of a single observation (they are not separable)."
  * code = $loinc#72826-1
  * code MS
  * value[x] 1.. MS
  * value[x] only CodeableConcept
  * value[x] from $2.16.840.1.113883.3.2074.1.1.3 (required)
    * ^short = "Race category codes"
    * ^definition = "Office of Management and Budget (OMB) codes for race categories."
    * ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations. Note: The binding to [Race Category Excluding Nulls](https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113883.3.2074.1.1.3) is used in lieu of [US Core OMB Race Categories](http://hl7.org/fhir/us/core/ValueSet/omb-race-category) because the US Core value set includes null flavors."
    * ^binding.description = "Codes for the five OMB race categories"
  * dataAbsentReason ..0
  * interpretation ..0
  * referenceRange ..0
* component[DetailedRace] ^definition = "Some observations have multiple component observations.  These component observations are expressed as separate code value pairs that share the same attributes."
  * ^requirements = "Component observations share the same attributes in the Observation resource as the primary observation and are always treated a part of a single observation (they are not separable)."
  * code = $loinc#72826-1
  * code MS
  * value[x] 1.. MS
  * value[x] only CodeableConcept
  * value[x] from DetailedRace (required)
    * ^short = "Detailed race codes"
    * ^binding.description = "CDC race codes that further specify the 5 OMB race category codes"
  * dataAbsentReason ..0
  * interpretation ..0
  * referenceRange ..0
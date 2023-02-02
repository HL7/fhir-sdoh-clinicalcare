Profile: SDOHCCObservationEthnicityOMB
Parent: SDOHCCObservationPersonalCharacteristic
Id: SDOHCC-ObservationEthnicityOMB
Title: "SDOHCC Observation Ethnicity OMB"
Description: "Profile for ethnicity observations that use Office of Management and Budget (OMB) ethnicity category codes and CDC ethnicity codes. This profile is intended for draft use only. The Cross-Group Projects work group granted a variance to US Core on 06/23/2022 - Jira ticket FHIR-37582. For further details on this profile see [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)."
* ^meta.versionId = "17"
* ^meta.lastUpdated = "2022-07-28T21:31:04.675+00:00"
* ^meta.source = "#xqoFz4mWDo9dbh0d"
* ^status = #draft
* ^abstract = false
* obeys SDOH-Ethnicity-1
* . ^short = "Ethnicity observation"
  * ^definition = "For ethnicity observations that use Office of Management and Budget (OMB) ethnicity category codes and CDC ethnicity codes."
  * ^comment = "Used for observations about the ethnicity of an individual."
* code = $loinc#69490-1
* value[x] ..0
* dataAbsentReason from SDOHCCValueSetObservationDataAbsentReason (required)
  * ^condition = "SDOH-Ethnicity-1"
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
  * ^comment = "For a discussion on the ways Observations can be assembled in groups together see [Notes](observation.html#notes) below. NOTE: The same LOINC code is used for all three components of this draft profile. If the profile is adopted as part of the US Core standard, new LOINC codes (possibly a panel) will be needed to represent the components (e.g., a new LOINC code for detailed ethnicity and for text description of ethnicity)."
  * ^requirements = "Component observations share the same attributes in the Observation resource as the primary observation and are always treated a part of a single observation (they are not separable)."
  * ^condition = "SDOH-Ethnicity-1"
* component contains
    EthnicityDescription 0..1 MS and
    Ethnicity 0..1 MS and
    DetailedEthnicity 0..*
* component[EthnicityDescription] ^definition = "Some observations have multiple component observations.  These component observations are expressed as separate code value pairs that share the same attributes."
  * ^requirements = "Component observations share the same attributes in the Observation resource as the primary observation and are always treated a part of a single observation (they are not separable)."
  * code = $loinc#69490-1
  * code MS
  * value[x] 1.. MS
  * value[x] only string
  * dataAbsentReason ..0
  * interpretation ..0
  * referenceRange ..0
* component[Ethnicity] ^definition = "Some observations have multiple component observations.  These component observations are expressed as separate code value pairs that share the same attributes."
  * ^requirements = "Component observations share the same attributes in the Observation resource as the primary observation and are always treated a part of a single observation (they are not separable)."
  * code = $loinc#69490-1
  * code MS
  * value[x] 1.. MS
  * value[x] only CodeableConcept
  * value[x] from SDOHCCValueSetOMBEthnicityCategories (required)
    * ^short = "Hispanic or Latino | Non Hispanic or Latino"
    * ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations. Note: The binding to [SDOHCC-ValueSetOMBEthnicityCategories](ValueSet-SDOHCC-ValueSetOMBEthnicityCategories.html) is used in lieu of [US Core OMB Ethnicity Categories](http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category) because, in versions of US Core beyond 3.1.1, the US Core value set include nulls flavors while the SDOH CC value set does not."
    * ^binding.description = "Codes for the two OMB ethnicity categories"
  * dataAbsentReason ..0
  * interpretation ..0
  * referenceRange ..0
* component[DetailedEthnicity] ^definition = "Some observations have multiple component observations.  These component observations are expressed as separate code value pairs that share the same attributes."
  * ^requirements = "Component observations share the same attributes in the Observation resource as the primary observation and are always treated a part of a single observation (they are not separable)."
  * code = $loinc#69490-1
  * code MS
  * value[x] 1.. MS
  * value[x] only CodeableConcept
  * value[x] from DetailedEthnicity (required)
    * ^binding.description = "CDC ethnicity codes that further specify the 2 OMB ethnicity category codes"
  * dataAbsentReason ..0
  * interpretation ..0
  * referenceRange ..0
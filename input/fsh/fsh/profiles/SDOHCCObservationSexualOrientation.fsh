Profile: SDOHCCObservationSexualOrientation
Parent: SDOHCCObservationPersonalCharacteristic
Id: SDOHCC-ObservationSexualOrientation
Title: "SDOHCC Observation Sexual Orientation"
Description: "Profile for observations about the sexual orientation of an individual. This profile is intended for draft use only. The Cross-Group Projects work group granted a variance to US Core on 06/23/2022 - Jira ticket FHIR-37583. For further details on this profile see [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)."
* ^meta.versionId = "9"
* ^meta.lastUpdated = "2022-06-28T15:21:43.612+00:00"
* ^meta.source = "#7xWIK4XucYCMlssy"
* ^status = #draft
* ^abstract = false
* . ^short = "Observation about an individual's sexual orientation"
  * ^comment = "For observations about the sexual orientation of an individual."
* code = $loinc#76690-7
* value[x] 1..
* value[x] from $LL3323-4 (preferred)
  * ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations. NOTE: This is a value set is for testing purposes only and will ultimately need to be aligned with vetted value sets where terms like “asexual” and “pansexual” may be included."
  * ^binding.description = "Codes for sexual orientation"
  * extension ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.rules = #open
    * ^min = 0
  * extension contains $data-absent-reason named DataAbsentReasonMasked 0..1
  * extension[DataAbsentReasonMasked] ^requirements = "“Masked” is never used for data capture, but \"masked\" is used to suppress information when data is exchanged. For this reason, other flavors of null are included in the value set for Observation.value, but “masked” can be captured here."
    * value[x] = #masked (exactly)
    * value[x] MS
      * ^definition = "The information is not available due to security, privacy or related reasons."
  * coding MS
* dataAbsentReason ..0
* method 1.. MS
* method from SDOHCCValueSetObservationMethod (extensible)
  * ^binding.description = "Methods for personal characteristic observations."
Profile: SDOHCCObservationSexualOrientation
Parent: SDOHCCObservationPersonalCharacteristic
Id: SDOHCC-ObservationSexualOrientation
Title: "SDOHCC Observation Sexual Orientation"
Description: "Profile for observations about the sexual orientation of an individual. This profile is intended for draft use only. For further details on this profile see [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)."

* ^status = #draft
* ^abstract = false
* . ^short = "Observation about an individual's sexual orientation"
* . ^comment = "For observations about the sexual orientation of an individual."
* code = $loinc#76690-7
* value[x] 1..
* value[x] from $LL3323-4 (preferred)
* value[x] ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations. NOTE: This is a value set is for testing purposes only and will ultimately need to be aligned with vetted value sets where terms like “asexual” and “pansexual” may be included."
* value[x] ^binding.description = "Codes for sexual orientation"
* value[x].extension contains $data-absent-reason named DataAbsentReasonMasked 0..1
* value[x].extension[DataAbsentReasonMasked] ^requirements = "“Masked” is never used for data capture, but \"masked\" is used to suppress information when data is exchanged. For this reason, other flavors of null are included in the value set for Observation.value, but “masked” can be captured here."
* value[x].extension[DataAbsentReasonMasked].value[x] = #masked (exactly)
* value[x].extension[DataAbsentReasonMasked].value[x] MS
* value[x].extension[DataAbsentReasonMasked].value[x] ^definition = "The information is not available due to security, privacy or related reasons."
* value[x].coding MS
* dataAbsentReason ..0
* method 1.. MS
* method from SDOHCCValueSetObservationMethod (extensible)
* method ^binding.description = "Methods for personal characteristic observations."
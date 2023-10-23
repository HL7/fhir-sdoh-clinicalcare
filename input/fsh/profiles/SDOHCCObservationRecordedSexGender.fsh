Profile: SDOHCCObservationRecordedSexGender
Parent: SDOHCCObservationPersonalCharacteristic
Id: SDOHCC-ObservationRecordedSexGender
Title: "SDOHCC Observation Recorded Sex Gender"
Description: "Profile for observations about \"recorded sex and gender\" which, in the past, were often used interchangeably. In this context, sex is a biological construct and pertains to a person’s genetics, hormones, and anatomy. This profile is intended for draft use only.  For further details on this profile see [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)."

* ^status = #draft
* ^abstract = false
* . ^short = "Observation about an individual's recorded sex or gender"
* . ^definition = "For observations about \"recorded sex and gender\" which, in the past, have often been used interchangeably. In this context, sex is a biological construct and pertains to a person’s genetics, hormones, and anatomy."
* . ^comment = "For observations about the recorded sex and gender of an individual."
* insert OwningCommitteeExtension
* code = $loinc#99502-7
* value[x] 1..
* value[x] from $LL6134-2 (preferred)
* value[x] ^binding.description = "Codes for recorded sex and gender"
* value[x].extension contains $data-absent-reason named DataAbsentReasonMasked 0..1
* value[x].extension[DataAbsentReasonMasked] ^requirements = "“Masked” is never used for data capture, but \"masked\" is used to suppress information when data is exchanged. For this reason, other flavors of null are included in the value set for Observation.value, but “masked” can be captured here."
* value[x].extension[DataAbsentReasonMasked].value[x] = #masked (exactly)
* value[x].extension[DataAbsentReasonMasked].value[x] MS
* value[x].extension[DataAbsentReasonMasked].value[x] ^definition = "The information is not available due to security, privacy or related reasons."
* value[x].coding MS
* dataAbsentReason ..0
* method 1.. MS
* method from SDOHCCValueSetObservationMethod (example)
* method ^binding.description = "Methods for personal characteristic observations."
* derivedFrom 1..1
* derivedFrom ^requirements = "DocumentReference can be used to indicate the type of recorded sex or gender. For example, a birth certificate could indicate that this is \"birth sex\"."
* derivedFrom ^condition = "SDOH-Obs-4"
* derivedFrom.identifier MS
* derivedFrom.identifier.type MS
* derivedFrom.identifier.type from SDOHCCValueSetObservationDerivedFromIdType (extensible)
* derivedFrom.identifier.type ^binding.description = "Codes for the type of record from which recorded sex or gender information is derived."
* derivedFrom.identifier.type.coding MS
* derivedFrom.identifier.type.text MS
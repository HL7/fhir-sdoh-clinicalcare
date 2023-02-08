Profile: SDOHCCObservationRecordedSexGender
Parent: SDOHCCObservationPersonalCharacteristic
Id: SDOHCC-ObservationRecordedSexGender
Title: "SDOHCC Observation Recorded Sex Gender"
Description: "Profile for observations about \"recorded sex and gender\" which, in the past, were often used interchangeably. In this context, sex is a biological construct and pertains to a person’s genetics, hormones, and anatomy. This profile is intended for draft use only. The Cross-Group Projects work group granted a variance to US Core on 06/23/2022 - Jira ticket FHIR-37582. For further details on this profile see [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)."
* ^meta.versionId = "12"
* ^meta.lastUpdated = "2022-06-28T15:21:43.616+00:00"
* ^meta.source = "#ANNGcryjsgfYiN1a"
* ^status = #draft
* ^abstract = false
* . ^short = "Observation about an individual's recorded sex or gender"
  * ^definition = "For observations about \"recorded sex and gender\" which, in the past, have often been used interchangeably. In this context, sex is a biological construct and pertains to a person’s genetics, hormones, and anatomy."
  * ^comment = "For observations about the recorded sex and gender of an individual."
* code = $loinc#99502-7
* value[x] 1..
* value[x] from $LL6134-2 (preferred)
  * ^binding.description = "Codes for recorded sex and gender"
  * extension ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.rules = #open
    * ^min = 0
  * extension contains $data-absent-reason named DataAbsentReasonMasked 0..1
  * extension[DataAbsentReasonMasked] ^requirements = "“Masked” is never used for data capture, but \"masked\" is used to suppress information when data is exchanged. For this reason, other flavors of null are included in the value set for Observation.value, but “masked” can be captured here."
    * ^isModifier = false
    * value[x] = #masked (exactly)
    * value[x] MS
      * ^definition = "The information is not available due to security, privacy or related reasons."
  * coding MS
* dataAbsentReason ..0
* method 1.. MS
* method from SDOHCCValueSetObservationMethod (example)
  * ^binding.description = "Methods for personal characteristic observations."
* derivedFrom 1..1
  * ^requirements = "DocumentReference can be used to indicate the type of recorded sex or gender. For example, a birth certificate could indicate that this is \"birth sex\"."
  * ^condition = "SDOH-Obs-4"
  * identifier MS
    * type MS
    * type from SDOHCCValueSetObservationDerivedFromIdType (extensible)
      * ^binding.description = "Codes for the type of record from which recorded sex or gender information is derived."
      * coding MS
      * text MS
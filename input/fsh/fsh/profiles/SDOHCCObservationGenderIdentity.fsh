Profile: SDOHCCObservationGenderIdentity
Parent: SDOHCCObservationPersonalCharacteristic
Id: SDOHCC-ObservationGenderIdentity
Title: "SDOHCC Observation Gender Identity"
Description: "Profile for gender identity observations which are based on a person’s inner sense of being a girl/woman/female/feminine, boy/man/male/masculine, nonbinary, something else, or having no gender. This profile is intended for draft use only. The Cross-Group Projects work group granted a variance to US Core on 06/23/2022 - Jira ticket FHIR-37582. For further details on this profile see [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)."
* ^meta.versionId = "8"
* ^meta.lastUpdated = "2022-06-28T15:21:43.615+00:00"
* ^meta.source = "#Uce7yaM1bCpfaBiL"
* ^status = #draft
* ^abstract = false
* . ^short = "Profile for observations about gender identity."
  * ^definition = "For gender identity observations which are based on a person’s inner sense of being a girl/woman/female/feminine, boy/man/male/masculine, nonbinary, something else, or having no gender."
  * ^comment = "For observations about the gender identity of an individual."
* code = $loinc#76691-5
* value[x] 1..
* value[x] from $2.16.840.1.113762.1.4.1021.32 (preferred)
  * ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations. This is a value set is for testing purposes only and will ultimately need to be aligned with vetted value sets being developed by the Gender Harmony Project where terms like “male-to-female transsexual” and “female-to-male transsexual” will not be included. See https://build.fhir.org/ig/HL7/fhir-gender-harmony/branches/main/terminology.html#appendix-1--proposed-value-sets"
  * ^binding.description = "Codes for self-identified gender, plus unknown and other"
  * extension ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.rules = #open
    * ^min = 0
  * extension contains $data-absent-reason named DataAbsentReasonMasked 0..1
  * extension[DataAbsentReasonMasked] ^requirements = "“Masked” is never used for data capture, but \"masked\" is used to suppress information when data is exchanged. For this reason, other flavors of null are included in the value set for Observation.value, but “masked” can be captured here."
    * ^mustSupport = false
    * value[x] = #masked (exactly)
    * value[x] MS
      * ^definition = "The information is not available due to security, privacy or related reasons."
  * coding MS
* dataAbsentReason ..0
* method 1.. MS
* method from SDOHCCValueSetObservationMethod (extensible)
  * ^binding.description = "Methods for personal characteristic observations."
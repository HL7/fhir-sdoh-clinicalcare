Profile: SDOHCCObservationPersonalCharacteristic
Parent: Observation
Id: SDOHCC-ObservationPersonalCharacteristic
Title: "SDOHCC Observation Personal Characteristic"
Description: "Defines constraints that represent the minimum requirement for personal characteristic observations which are observations that are usually self-attested but may be attested to on behalf of the subject and are generally only verifiable by the source of attestation (e.g., race, ethnicity, sexual orientation, gender identity and personal pronouns), but may sometimes be verifiable by someone other than the source of attestation (e.g., recorded sex). This profile is intended for draft use only. The Cross-Group Projects work group granted a variance to US Core on 06/23/2022 - Jira ticket FHIR-37582. For further details on this profile see [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)."
* ^meta.versionId = "12"
* ^meta.lastUpdated = "2022-07-18T18:33:38.098+00:00"
* ^meta.source = "#jmPoTGA7edGgsews"
* ^status = #draft
* ^abstract = true
* obeys SDOH-Obs-1 and SDOH-Obs-2 and SDOH-Obs-3
* . ^short = "Personal characteristic observation"
  * ^definition = "Defines constraints that represent the minimum requirement for personal characteristic observations which are observations that are usually self-attested but may be attested to on behalf of the subject (e.g., for a minor or incapable subject) and are generally only verifiable by the source of attestation (e.g., race, ethnicity, sexual orientation, gender identity and personal pronouns), but may sometimes be verifiable by someone other than the source of attestation (e.g., recorded sex)."
  * ^mustSupport = false
* extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
  * ^min = 0
* extension contains $extension-Observation.subject named OtherSubject 0..1 MS
* extension[OtherSubject] ^requirements = "This extension is adding only US Core Practitioner as an option for Observation.subject. When the subject is Practitioner, personal characteristics should be based on the attestation and consent of the practitioner."
  * ^condition[0] = "SDOH-Obs-1"
  * value[x] 1..
  * value[x] only Reference(USCorePractitionerProfile)
* status MS
* status from SDOHCCValueSetObservationStatus (required)
  * ^short = "final | corrected | entered-in-error | unknown"
  * ^definition = "The status of the observation value."
  * ^requirements = "Further constrained to values that are relevant for personal characteristic observations."
* category ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains PersonalCharacteristic 1..1 MS
* category[PersonalCharacteristic] = $SDOHCC-CodeSystemTemporaryCodes#personal-characteristic
  * ^requirements = "Used for filtering personal characteristic observations."
* code MS
  * ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation. NOTE: In LOINC, System Patient is used in the modeling of codes referenced by the Personal Characteristics profiles (e.g., 72826-1 Race OMB.1997, 69490-1 Ethnicity OMB.1997, 76691-5 Gender identity, 76690-7 Sexual orientation, 90778-2 Personal pronouns – Reported, and 99502-7 Recorded sex or gender). If the draft profiles are adopted, new LOINC codes without System Patient would be needed since these profiles can also be used to capture characteristics of a provider (using an extension) or a related person (using focus)."
  * ^binding.strength = #preferred
* subject only Reference(USCorePatientProfile)
* subject MS
  * ^condition[0] = "SDOH-Obs-1"
  * ^condition[+] = "SDOH-Obs-2"
* focus ..1
* focus only Reference(RelatedPerson)
  * ^condition[0] = "SDOH-Obs-2"
* effective[x] only dateTime or Period
  * ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](datatypes.html#timing) datatype which allow the measurement to be tied to regular life events.\r\nNOTE: dateTime is Must Support, but currently tooling does not support this."
* performer MS
  * ^condition[0] = "SDOH-Obs-3"
* value[x] only CodeableConcept
* value[x] MS
* interpretation ..0
* bodySite ..0
* specimen ..0
* referenceRange ..0
* derivedFrom only Reference(DocumentReference or QuestionnaireResponse or Observation)
* derivedFrom MS
  * ^condition[0] = "SDOH-Obs-3"
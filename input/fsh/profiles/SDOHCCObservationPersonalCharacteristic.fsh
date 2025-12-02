Profile: SDOHCCObservationPersonalCharacteristic
Parent: USCoreSimpleObservationProfile|7.0.0
Id: SDOHCC-ObservationPersonalCharacteristic
Title: "SDOHCC Observation Personal Characteristic"
Description: "Defines constraints that represent the minimum requirement for personal characteristic observations which are observations that are usually self-attested but may be attested to on behalf of the subject and are generally only verifiable by the source of attestation (e.g., race, ethnicity, sexual orientation, gender identity and personal pronouns), but may sometimes be verifiable by someone other than the source of attestation (e.g., recorded sex). For further details on this profile see [Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)."
* ^status = #active
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-simple-observation|7.0.0"
* ^abstract = true
* obeys SDOH-Obs-1 and SDOH-Obs-2 and SDOH-Obs-3
* . ^short = "Personal characteristic observation"
* . ^definition = "Defines constraints that represent the minimum requirement for personal characteristic observations which are observations that are usually self-attested but may be attested to on behalf of the subject (e.g., for a minor or incapable subject) and are generally only verifiable by the source of attestation (e.g., race, ethnicity, sexual orientation, gender identity and personal pronouns), but may sometimes be verifiable by someone other than the source of attestation (e.g., recorded sex)."
* . ^mustSupport = false
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = 1

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $extension-Observation.subject named OtherSubject 0..1 MS
* extension[OtherSubject] ^requirements = "This extension is adding only US Core Practitioner as an option for Observation.subject. When the subject is Practitioner, personal characteristics should be based on the attestation and consent of the practitioner."
* extension[OtherSubject] ^condition[0] = "SDOH-Obs-1"
* extension[OtherSubject].value[x] 1..
* extension[OtherSubject].value[x] only Reference(USCorePractitionerProfile|7.0.0)
* status MS
* status from SDOHCCValueSetObservationStatus (required)
* status ^short = "final | corrected | entered-in-error | unknown"
* status ^definition = "The status of the observation value."
* status ^requirements = "Further constrained to values that are relevant for personal characteristic observations."
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains PersonalCharacteristic 1..1 MS
* category[PersonalCharacteristic] = $SDOHCC-CodeSystemTemporaryCodes#personal-characteristic
* category[PersonalCharacteristic] ^requirements = "Used for filtering personal characteristic observations."
* code MS
* code from LOINCCodes (preferred)
* code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation. NOTE: In LOINC, System Patient is used in the modeling of codes referenced by the Personal Characteristics profiles (e.g., 72826-1 Race OMB.1997, 69490-1 Ethnicity OMB.1997, 76691-5 Gender identity, 76690-7 Sexual orientation, 90778-2 Personal pronouns – Reported, and 99502-7 Recorded sex or gender). If the draft profiles are adopted, new LOINC codes without System Patient would be needed since these profiles can also be used to capture characteristics of a provider (using an extension) or a related person (using focus)."
* code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code ^binding.extension.valueString = "ObservationCode"
* code ^binding.description = "Codes identifying names of simple observations."
* subject only Reference(USCorePatientProfile|7.0.0)
* subject MS
* subject ^condition[0] = "SDOH-Obs-1"
* subject ^condition[+] = "SDOH-Obs-2"
* focus ..1
* focus only Reference(RelatedPerson)
* focus ^condition[0] = "SDOH-Obs-2"
* effective[x] only dateTime or Period
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](datatypes.html#timing) datatype which allow the measurement to be tied to regular life events.\r\nNOTE: dateTime is Must Support, but currently tooling does not support this."
* performer MS
* performer ^condition[0] = "SDOH-Obs-3"
* value[x] only CodeableConcept
* value[x] MS
* interpretation ..0
* bodySite ..0
* specimen ..0
* referenceRange ..0
* derivedFrom only Reference(USCoreDocumentReferenceProfile|7.0.0 or USCoreQuestionnaireResponseProfile|7.0.0 or Observation)
* derivedFrom MS
* derivedFrom ^condition[0] = "SDOH-Obs-3"
Profile: SDOHCCConsent
Parent: Consent
Id: SDOHCC-Consent
Title: "SDOHCC Consent"
Description: "Profile for consent related to the release of Social Determinants of Health (SDOH) information to non-HIPAA covered organizations."
* ^status = #active
* . ^definition = "A record of a healthcare consumer’s choices related to the release of SDOH information to non-HIPAA covered organizations."
* . ^comment = "Providers should consider including standard language to inform the patient that disclosure of their information to entities which are not HIPAA covered entities are no longer protected under the HIPAA Privacy Rule but may be protected by FTC Consumer Protection rules."
* insert OwningCommitteeExtension
* status MS
* status ^comment = "This element is labeled as a modifier because the status contains the codes rejected and entered-in-error that mark the Consent as not currently valid. \r\n\r\nIn general, when being exchanged with a community-based organization, Consent.status should reference the value “active”."
* scope MS
* scope ^comment = "The primary use for this element in the context of this implementation guide will be \"patient-privacy\" (Privacy Consent)."
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains IDSCL 1..1 MS
* category[IDSCL] = $v3-ActCode#IDSCL
* category[IDSCL] ^requirements = "The base resource requires category. For consent related to SDOH, ISCDL was the best choice of the required options."
* patient 1.. MS
* patient only Reference(USCorePatientProfile)
* dateTime 1.. MS
* dateTime ^requirements = "This is Must Support to allow a recipient to determine the \"order\" of multiple consents."
* performer only Reference(Organization or RelatedPerson or Practitioner or PractitionerRole or Patient)
* performer ^requirements = "This element is not mandatory . There is not a use case that Performer be computable since it will normally be present in the consent \"form\"."
* organization 1..1 MS
* organization only Reference(USCoreOrganizationProfile)
* source[x] 1.. MS
* source[x] only Attachment or Reference(Consent or Contract or USCoreDocumentReferenceProfile or QuestionnaireResponse)
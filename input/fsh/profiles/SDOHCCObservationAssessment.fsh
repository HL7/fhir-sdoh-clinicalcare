Profile: SDOHCCObservationAssessment
Parent: Observation
Id: SDOHCC-ObservationAssessment
Title: "SDOHCC Observation Assessment"
Description: "Profile for Social Determinants of Health (SDOH) observations that involve assessment (e.g., by a provider, payer, etc.) as opposed to being derived only from screening surveys (as is the case for the SDOHCC Screening Response Observation)."
* ^status = #draft
* ^abstract = false
* . ^short = "SDOH assessment observation"
* . ^definition = "For SDOH observations derived from assessment of the individual."
* . ^comment = "For representation of SDOH observations that involve assessment (e.g., by a provider or payer) as opposed to being derived only from screening surveys (as is the case for the SDOHCC Observation Screening Response).\r\n\r\nMany of the SDOHCC profiles reference one another. One flow supported by this IG is that QuestionnaireResponses result in Observations that can be used as evidence for Conditions that can lead to Goals, ServiceRequests and Procedures. However, alternatives paths are also possible."
* status MS
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains
    SocialHistory 1..1 MS and
    SDOH 0..* MS
* category[SocialHistory] = $observation-category#social-history
* category[SocialHistory] ^requirements = "Used for filtering that this is a social history observation."
* category[SDOH] from SDOHCCValueSetSDOHCategory (required)
* category[SDOH] ^short = "e.g., food-insecurity | transportation-insecurity"
* category[SDOH] ^definition = "An SDOH category assigned to the observation."
* category[SDOH] ^requirements = "Codes from this value set can be used to assign one or more SDOH categories (e.g., food-insecurity, transportation-insecurity, etc.) to an observation. It is recommended that SDOH category codes be used to facilitate searching for SDOH observations."
* category[SDOH] ^binding.description = "Codes for high-level SDOH categories."
* code MS
* code from SDOHCCValueSetLOINCSNOMEDCT (preferred)
* code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\nAs the Gravity Project continues to refine content for the SDOH categories (e.g., food, housing, transportation, etc.), this value set binding strength may change and may be refined to codes (including LOINC and SNOMED) that pertain to SDOH categories."
* subject 1.. MS
* subject only Reference(Group or USCorePatientProfile)
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing] datatype which allow the measurement to be tied to regular life events. NOTE: dateTime is Must Support, but currently tooling does not support this."
* performer only Reference(RelatedPerson or USCorePatientProfile or USCorePractitionerProfile or USCorePractitionerRoleProfile or USCoreOrganizationProfile or USCoreCareTeam)
* performer MS
* performer ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository. NOTE: US Core Practitioner is Must Support, but currently tooling does not support this."
* value[x] MS
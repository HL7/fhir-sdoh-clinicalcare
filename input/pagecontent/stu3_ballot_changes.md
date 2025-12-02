The Gravity Project team has drafted a new STU3 version of the IG for balloters to review and submit feedback. Below are the requirements that we have worked through for this ballot and the associated updates to the IG:

- Capacity Status

  - **NEW**: [Capacity Status](capacity.html) Narrative Guidance
  - **NEW**: [SDOHCC HealthcareService Capacity Status Extension](StructureDefinition-SDOHCC-ExtensionHealthcareServiceCapacityStatus.html)
  - **NEW**: [SDOHCC Healthcare Service for Referral Management](StructureDefinition-SDOHCC-HealthcareServiceForReferralManagement.html)
  - **Updated**: [SDOHCC HealthcareService](StructureDefinition-SDOHCC-HealthcareService.html) (Value Set Updates to HealthcareService.category, HealthcareService.type, and HealthcareService.program)

- Enrollment Status

  - **NEW**: [Enrollment Status](enrollment.html) Narrative Guidance
  - **NEW**: [SDOHCC Program Enrollment Status Observation](StructureDefinition-SDOHCC-ObservationProgramEnrollmentStatus.html)
  - **Updated**: [SDOHCC Task for Referral Management] (includes Enrollment Status Observation as a possible reference in Task.output)

- Self-Referral

  - **NEW**: [Self-Referral](self_referral.html) Narrative Guidance

- Referral for Further Assessment

  - **NEW**: [Referral for Further Assessment](rffa.html) Narrative Guidance
  - **Updated**: [SDOHCC Task for Referral Management] (added slice to Task.output to include resources associated with outcomes from the completion of the task(s))

- Content-Rich Referral

  - **Updated**: [Referral Workflow](referral_workflow.html#referral-use-case-overview) additional guidance on pushing additional content in a closed-loop referral
  - **Updated**: [SDOHCC Task for Referral Management] (added slice to Task.input to include resources relevant in the provision of services to a referral recipient)

- Protective Factors

  - **Updated** [SDOHCC Condition] to include Protective Factors as a possible category code. Additional guidance is present in the profile as well on how to use Protective Factors

### Jira Tickets – all applied -- see changes below

* [FHIR-53456](https://jira.hl7.org/browse/FHIR-53455) - New narrative pages to address new use cases
* [FHIR-53455](https://jira.hl7.org/browse/FHIR-53455) - Promote Personal Characteristics Narrative out of draft status
* [FHIR-53454](https://jira.hl7.org/browse/FHIR-53454) - Update to Referral Workflow Narrative to address communication of additional info for a referral 
* [FHIR-53453](https://jira.hl7.org/browse/FHIR-53453) - Updates to SDOHCC Task for Referral Management .input and .output 
* [FHIR-53451](https://jira.hl7.org/browse/FHIR-53451) - Adding Protective Factors as an SDOHCC Category code
* [FHIR-53450](https://jira.hl7.org/browse/FHIR-53450) - New Extension - SDOHCC Extension HealthcareService Capacity Status
* [FHIR-53449](https://jira.hl7.org/browse/FHIR-53449) - Update VS in SDOHCC Observation Recorded Sex Gender
* [FHIR-53448](https://jira.hl7.org/browse/FHIR-53448) - Update dependency of SDOHCC Observation Sexual Orientation to US Core 7 profile 
* [FHIR-53447](https://jira.hl7.org/browse/FHIR-53447) - Promote Personal Characteristics profiles out of draft status
* [FHIR-53446](https://jira.hl7.org/browse/FHIR-53446) - New Profile - SDOHCC Observation Enrollment Status 
* [FHIR-53445](https://jira.hl7.org/browse/FHIR-53445) - New Profile - SDOHCC HealthcareService For Referral Management


{% include markdown-link-references.md %} 

&nbsp;
&nbsp;

The **Social Determinants of Health (SDOH) Change History** page provides a list of detailed changes made in each version of the Implementation Guide (IG). These changes include updates, enhancements, clarifications, and corrections that reflect community feedback, ballot processes, and alignment with evolving standards. Where applicable, a link to the Jira ticket that corresponds to the changes made is provided in the table along with a description of the change and the Jira ticket resolution.


&nbsp;
&nbsp;

### STU 3 Publication

<!-- ============================== -->
<!-- ############################################################################################################################################################ -->
---------------------

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-54584](https://jira.hl7.org/browse/FHIR-54584) | Updated the outline format on the Enrollment Status, Capacity Status, rffa, and Self-Referral pages| Persuasive with Modification |
|[FHIR-54917](https://jira.hl7.org/browse/FHIR-54917) | Moved the Patient Coordination Workflow information from the Referral Workflow page to it's own page and updated the corresponding links the IG. | Persuasive |
|[FHIR-54912](https://jira.hl7.org/browse/FHIR-54912) | Copied the technical requirements and description for the SDOHCC Observation Program Enrollment Status text from the Enrollment page and added it to the StructureDefinition-SDOHCC-ObservationProgramEnrollmentStatus-intro page. | Persuasive |
|[FHIR-53798](https://jira.hl7.org/browse/FHIR-53798) and [FHIR-53799](https://jira.hl7.org/browse/FHIR-53799) | Added text and 4th bullet point text to the sdoh_challenges_gravity page. | Persuasive |
|[FHIR-53804](https://jira.hl7.org/browse/FHIR-53804) | Updated and added link to the overview on the RFFA page. | Persuasive |
|[FHIR-51138](https://jira.hl7.org/browse/FHIR-51138) | Updated the Device Resource Conformance in the Capability Statement from SHALL to SHOULD and fixed the "unspecified" issue for the other resources. | Persuasive |


&nbsp;
### STU 3 Ballot

<!-- ============================== -->
<!-- ############################################################################################################################################################ -->
---------------------

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


| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-53456](https://jira.hl7.org/browse/FHIR-53455) | New narrative pages to address new use cases | Persuasive |
|[FHIR-53455](https://jira.hl7.org/browse/FHIR-53455) | Promote Personal Characteristics Narrative out of draft status   | Persuasive |
|[FHIR-53454](https://jira.hl7.org/browse/FHIR-53454) | Update to Referral Workflow Narrative to address communication of additional info for a referral | Persuasive |
|[FHIR-53453](https://jira.hl7.org/browse/FHIR-53453) | Updates to SDOHCC Task for Referral Management .input and .output | Persuasive with Modification |
|[FHIR-53451](https://jira.hl7.org/browse/FHIR-53451) | Adding Protective Factors as an SDOHCC Category code  | Persuasive |
|[FHIR-53450](https://jira.hl7.org/browse/FHIR-53450) | New Extension - SDOHCC Extension HealthcareService Capacity Status | Persuasive |
|[FHIR-53449](https://jira.hl7.org/browse/FHIR-53449) | Update VS in SDOHCC Observation Recorded Sex Gender | Persuasive |
|[FHIR-53448](https://jira.hl7.org/browse/FHIR-53448) | Update dependency of SDOHCC Observation Sexual Orientation to US Core 7 profile | Persuasive |
|[FHIR-53447](https://jira.hl7.org/browse/FHIR-53447) |  Promote Personal Characteristics profiles out of draft status | Persuasive with Modification |
|[FHIR-53446](https://jira.hl7.org/browse/FHIR-53446) | New Profile - SDOHCC Observation Enrollment Status | Persuasive with Modification |
|[FHIR-53445](https://jira.hl7.org/browse/FHIR-53445) | New Profile - SDOHCC HealthcareService For Referral Management  | Persuasive with Modification |


&nbsp;
### STU 2.3 Publication Update

<!-- ============================== -->
<!-- ############################################################################################################################################################ -->
---------------------

The impetus for creating an STU2.3 version of the SDOH Clinical Care IG was for the FHIR artifacts to be able to support US Core 3.1.1, US Core 6.1.0, and US Core 7.0.0. Updates made to the IG were related to this and do not alter the scope of the guide. 

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-48802](https://jira.hl7.org/browse/FHIR-48802) | When updating Goal to US Core 6.1+, use US Goal Codes ValueSet for Goal profile | Persuasive with Modification |
|[FHIR-48886](https://jira.hl7.org/browse/FHIR-48886) | When updating Goal to US Core 6.1+, use US Goal Codes ValueSet for Goal profile | Persuasive |
|[FHIR-49385](https://jira.hl7.org/browse/FHIR-49385) | When updating to US Core 6.1, add invariant for Condition to match US Core requirements | Persuasive with Modification |
|[FHIR-49386](https://jira.hl7.org/browse/FHIR-49386) | Create a PractitionerRole Profile to support US Core 3.1.1 and 6.1  | Persuasive with Modification |
|[FHIR-49387](https://jira.hl7.org/browse/FHIR-49387) | Correct the wording of Goal.description requirements in the Goal Usage notes   | Persuasive |
|[FHIR-49388](https://jira.hl7.org/browse/FHIR-49388) | Update all Profile intro notes where relationship to US Core needs to be noted | Persuasive with Modification |
|[FHIR-49644](https://jira.hl7.org/browse/FHIR-49644) | Observation Assessment Profile Derived from US Core Simple Observation 7.0.0 | Persuasive |
|[FHIR-49645](https://jira.hl7.org/browse/FHIR-49645) | Observation Screening Response Profile Derived from US Core Observation Screening Assessment 7.0.0 | Persuasive |
|[FHIR-50149](https://jira.hl7.org/browse/FHIR-50149) | Set FMM to Maturity Level 2 | Persuasive |
|[FHIR-50168](https://jira.hl7.org/browse/FHIR-50168) | Include HRex as a Dependency | Persuasive |
|[FHIR-50169](https://jira.hl7.org/browse/FHIR-50169) | Update Dependency Table  | Persuasive |
|[FHIR-50170](https://jira.hl7.org/browse/FHIR-50170) | Remove Terminology Parameters from Artifacts | Persuasive |


&nbsp;
### STU 2.2 Publication Update

<!-- ============================== -->
<!-- ############################################################################################################################################################ -->
---------------------

| Jira Ticket Number | Description   | Resolution   |
|--------------------------|-------------|-------------|
|[FHIR-44753](https://jira.hl7.org/browse/FHIR-44753) | Add new codes to SDOHCC ValueSet SDOH Category and update value set tables for ObservationScreeningResponse, Condition, Procedure, ServiceRequest and Goal profile | Persuasive with Modification |
|[FHIR-46247](https://jira.hl7.org/browse/FHIR-46247) | Update "Assessment Instrument Support" Page | Persuasive |
|[FHIR-46248](https://jira.hl7.org/browse/FHIR-46248) | Update "Gravity Value Sets" Page | Persuasive |
|[FHIR-46249](https://jira.hl7.org/browse/FHIR-46249) | Add Additional Bindings Tables for Condition, Goal, OSR, ServiceRequest and Task Profiles | Persuasive |
|[FHIR-46250](https://jira.hl7.org/browse/FHIR-46250) | Update Descriptions for Condition, Goal, OSR, ServiceRequest and Task Profiles | Persuasive |
|[FHIR-46251](https://jira.hl7.org/browse/FHIR-46251) | Hyperlink QA  | Persuasive |
|[FHIR-46422](https://jira.hl7.org/browse/FHIR-46422) | Update Subscription Backport dependency version (from 0.1.0 to 1.1.0) | Persuasive |


&nbsp;
### STU 2.1 Publication Update

<!-- ============================== -->
<!-- ############################################################################################################################################################ -->
---------------------

| Jira Ticket Number | Description   | Resolution   |
|-------------------------------|---------------|---------------|
|[FHIR-40447](https://jira.hl7.org/browse/FHIR-40447) | Document the use of Gravity VS in the multi-domain profiles | Persuasive |
|[FHIR-40449](https://jira.hl7.org/browse/FHIR-40449) | Improve rendering of Capability Statements | Persuasive with Modification |
|[FHIR-40450](https://jira.hl7.org/browse/FHIR-40450) | Glossary | Persuasive |
|[FHIR-40460](https://jira.hl7.org/browse/FHIR-40460) | SDOHCC Observation Assessment is not abstract | Persuasive |
|[FHIR-40586](https://jira.hl7.org/browse/FHIR-40586) | Referral Task outputs bound appropriately | Persuasive |
|[FHIR-40611](https://jira.hl7.org/browse/FHIR-40611) | Added slice to to ObservationScreeningResponse.member to reference all observations that are members of the group | Persuasive |
|[FHIR-40771](https://jira.hl7.org/browse/FHIR-40771) | Constrained TaskForReferralManagement.status to exclude requested value | Persuasive |
|[FHIR-41278](https://jira.hl7.org/browse/FHIR-41278) | Fixed cardinality of extension to HealthcareService.telecom so that there would be one boolean flag per telecom | Persuasive |
|[FHIR-41310](https://jira.hl7.org/browse/FHIR-FHIR-41310) | ObservationScreeningResponse.hasMember[SupportedHasMember] can only reference an ObservationScreeningResponse. Previously it could also reference a QuestionnaireResponse. | Persuasive |


This update was focused on improving the readability of the IG narrative content.

#### StructureDefinitions

* Included value set references in narrative for the multi-domain profiles (Condition, Goal, ServiceRequest, Procedure, and Observation)
* Improved narrative in all Profiles
* Abstract flag in [SDOHCCObservationAssessment](StructureDefinition-SDOHCC-ObservationAssessment.html) is now false - [FHIR-40460 ](https://jira.hl7.org/browse/FHIR-40460)
* Corrected bindings for output procedures in [SDOHCCTaskForReferralManagement](StructureDefinition-SDOHCC-TaskForReferralManagement.html)   - [FHIR-40586](https://jira.hl7.org/browse/FHIR-40586)
* Added slice to to ObservationScreeningResponse.member to reference all observations that are members of the group [FHIR-40611](https://jira.hl7.org/browse/FHIR-40611)
* Updated valuesets and state transition diagrams for  [SDOHCCTaskForReferralManagement].status and [SDOHCCTaskForPatient].status [FHIR-41199](https://jira.hl7.org/browse/FHIR-41199)
* Remove abstract from [SDOHCCGroup](StructureDefinition-SDOHCC-Group.html) Profile. [FHIR-41198](https://jira.hl7.org/browse/FHIR-41198)


#### CapabilityStatements

* Improved Rendering of all Capability Statements using [tools](https://github.com/caspears/CapStatement) and additional [scripts](https://github.com/HL7/fhir-sdoh-clinicalcare/tree/master/capstmt). [FHIR-40449](https://jira.hl7.org/browse/FHIR-40449)

#### Narrative
* The narrative has been restructured and edited and all of the figures redrawn to improve overall readability
* [Glossary](glossary.html) – Added glossary [FHIR-40450](https://jira.hl7.org/browse/FHIR-40450)

#### FHIR Shorthand
* The IG is now being maintained in [FHIR Shorthand syntax](http://hl7.org/fhir/uv/shorthand/)


&nbsp;
### STU 2 Publication

<!-- ============================== -->
<!-- ############################################################################################################################################################ -->
---------------------

#### Index

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-35753](https://jira.hl7.org/browse/FHIR-35753)|	Home page should have compelling sale of problem and solution spec solves/offers - Provided link to gravity project on the home page | Persuasive with Modification |

#### General Changes

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-38772](https://jira.hl7.org/browse/FHIR-38772)|	Document change from US Core 4.0.0 to US Core 3.1.1 - Changed base reference to US Core to 3.1.1 and adjusted any structure definitions required| Persuasive |
|[FHIR-34857](https://jira.hl7.org/browse/FHIR-34857)|	Update reference to US Core MS and Missing Data - [Updated references to US Core MS and Missing Data](mustsupport_and_missing_data.html)| Persuasive |

#### Mapping

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-38082](https://jira.hl7.org/browse/FHIR-38082)|	Beef up the mapping instructions page | Persuasive |
|[FHIR-38081](https://jira.hl7.org/browse/FHIR-38081)|	Mapping page should not have the mapping language content - updated mapping instructions| Persuasive |

#### Task Instructions

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-37480](https://jira.hl7.org/browse/FHIR-37480)|	Add `Task.output` slice to allow patient to indicate their "chosen-contact"| Persuasive |
|[FHIR-35750](https://jira.hl7.org/browse/FHIR-35750)|	Suggest more robust requirements around using Task for patient Communications| Persuasive with Modification |
|[FHIR-35634](https://jira.hl7.org/browse/FHIR-35634)|	Clarify SDOH Task distinction| Persuasive |
|[FHIR-35746](https://jira.hl7.org/browse/FHIR-35746)|	Be clear on what the patient can change in Task| Persuasive |
|[FHIR-35740](https://jira.hl7.org/browse/FHIR-35740)|	Tighter specification around the updating of Task fields by Patient.| Persuasive with Modification |
|[FHIR-35751](https://jira.hl7.org/browse/FHIR-35751)|	Link to this in the relevant context| Persuasive with Modification |
|[FHIR-35739](https://jira.hl7.org/browse/FHIR-35739)|	Examples should show historical progression with statuses - Added the above changes to the [checking task status](checking_task_status.html) page| Persuasive with Modification |

#### Personal Characteristics

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-34876](https://jira.hl7.org/browse/FHIR-34876)|	Need specificity in requirements, e.g., state statutes. | Persuasive |
|[FHIR-34863](https://jira.hl7.org/browse/FHIR-34863)|	References from Race Profile to Spec Requirements| Persuasive |
|[FHIR-34862](https://jira.hl7.org/browse/FHIR-34862)|	References from Ethnicity Profile to Spec Requirements| Persuasive |
|[FHIR-34860](https://jira.hl7.org/browse/FHIR-34860)|	State Requirements Unclear| Persuasive |
|[FHIR-34858](https://jira.hl7.org/browse/FHIR-34858)|	Race and Ethnicity Text| Persuasive with Modification |
|[FHIR-35679](https://jira.hl7.org/browse/FHIR-35679)|	Illustrate that laws vary around sharing of race and ethnicity data| Persuasive with Modification |
|[FHIR-35685](https://jira.hl7.org/browse/FHIR-35685)|	Observation Subject Extension - use in Observation Profiles for Race and Ethnicity | Persuasive with Modification |
|[FHIR-35338](https://jira.hl7.org/browse/FHIR-35338)|	Concern over race and ethnicity data of "related person" and "practitioner"| Persuasive with Modification |
|[FHIR-35329](https://jira.hl7.org/browse/FHIR-35329)|	Concern over patient race and ethnicity data being shared for non-treatment purposes| Persuasive with Modification |
|[FHIR-35022](https://jira.hl7.org/browse/FHIR-35022)|	Use a single Observation Resource to include both Race and Ethnicity Observations| Not Persuasive with Modification |
|[FHIR-34999](https://jira.hl7.org/browse/FHIR-34999)|	Adding R/E Observations to the Structured Definitions without indicating they are draft will cause implementation confusion| Persuasive with Modification |
|[FHIR-35691](https://jira.hl7.org/browse/FHIR-35691)|	"Unknown" is not appropriate as an observation method| Not Persuasive with Modification |
|[FHIR-34878](https://jira.hl7.org/browse/FHIR-34878)|	Need to consider Provenance when R/E Extensions and Observation Resource is used for R/E| Persuasive with Modification |
|[FHIR-35327](https://jira.hl7.org/browse/FHIR-35327)|	For `Observation.method` value set, add guidance related to use of "observed"| Persuasive with Modification |
|[FHIR-35325](https://jira.hl7.org/browse/FHIR-35325)|	For `Observation.method` value set, clarify the definition of "reported-by-related-person" and add guidance related to use of "self-reported" and "reported-by-related-person"| Not Persuasive with Modification |
|[FHIR-35206](https://jira.hl7.org/browse/FHIR-35206)|	Patient Application Client CapabilityStatement does not include Observation therefore patients will not be able to Read nor search for R/E Observation Profiles| Persuasive with Modification |
|[FHIR-35715](https://jira.hl7.org/browse/FHIR-35715)|	Unclear what adhoc and adhocresponse are - please clarify| Persuasive with Modification |
|[FHIR-35370](https://jira.hl7.org/browse/FHIR-35370)|	For `Observation.method` value set, add guidance related to use of "observed".| Persuasive with Modification |
|[FHIR-35375](https://jira.hl7.org/browse/FHIR-35375)|	Add a challenge related to the sensitivity of SDOH data - Updated the [Draft Specifications for Personal Characteristics](specifications_for_personal_characteristics.html) page and referenced artifacts| Persuasive |

#### Value set changes

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-36591](https://jira.hl7.org/browse/FHIR-36591)|	Add on-hold to the value set for .status to support patient inability to perform task for a period of time - Added on-hold to the [Task Status Valueset](ValueSet-SDOHCC-ValueSetTaskStatus.html)| Persuasive |


#### Functional Use Cases

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-35718](https://jira.hl7.org/browse/FHIR-35718)|	Restructure and add diagrams to make functional requirements of spec clear| Persuasive with Modification |
|[FHIR-35639](https://jira.hl7.org/browse/FHIR-35639)|	The patient should be given an opportunity to weigh in on whether the referral was successful and goals have been accomplished (or progress made)| Persuasive with Modification |
|[FHIR-35633](https://jira.hl7.org/browse/FHIR-35633)|	Clarifications related to Closing the Loop| Persuasive with Modification |
|[FHIR-35623](https://jira.hl7.org/browse/FHIR-35623)|	Clarify: what happens when the CP shares that info with the CBO or other agency assisting with the Food Insecurity?| Persuasive with Modification |
|[FHIR-35621](https://jira.hl7.org/browse/FHIR-35621)|	What is the CP doing on behalf of the provider organization that renders it a business associate?| Persuasive with Modification |
|[FHIR-35377](https://jira.hl7.org/browse/FHIR-35377)|	Additional info about what a CP is might be helpful here| Persuasive with Modification |
|[FHIR-34881](https://jira.hl7.org/browse/FHIR-34881)|	Referral workflow steps need to be aligned - Applied the above ticket dispositions to the Functional Use Cases page| Persuasive with Modification |

#### Structure Definitions

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-34891](https://jira.hl7.org/browse/FHIR-34891)|	Please relax `Goal.achievement` cardinality to 0..1 to align with goals that are proposed or planned - changed `goal.achievement` cardinality to 0..1| Persuasive |
|[FHIR-35369](https://jira.hl7.org/browse/FHIR-35369)|	Streamline representation of SDOH screening instruments - based on US Core decision, change grouping observation to have individual observations for multiple selection questions| Persuasive |

#### Exchange Workflow

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-35733](https://jira.hl7.org/browse/FHIR-35733)|	Patient interaction diagrams need more clarity| Persuasive with Modification |
|[FHIR-35721](https://jira.hl7.org/browse/FHIR-35721)|	Recommend better definition and consistence with diagram and rest of 9| Persuasive with Modification |
|[FHIR-35717](https://jira.hl7.org/browse/FHIR-35717)|	Move this section up so that it is easier to find| Persuasive |
|[FHIR-35637](https://jira.hl7.org/browse/FHIR-35637)|	Workflow and Managing Consent diagram should be expanded to include API Resources - Applied the above ticket dispositions to the Exchange Workflow page| Persuasive with Modification |

#### Capability Statements

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-36045](https://jira.hl7.org/browse/FHIR-36045)|	Procedure _id search parameter Definition & Chaining makes reference to PractitionerRole records| Persuasive |
|[FHIR-35960](https://jira.hl7.org/browse/FHIR-35960)|	Subscription in the capability statements has SDOHCC-Procedure as the supported Profile| Persuasive |
|[FHIR-35076](https://jira.hl7.org/browse/FHIR-35076)|	Capability Statements - Please provide specific conformance assertions with respect to the various supported profiles - updated [capability statements](artifacts.html#behavior-capability-statements)| Persuasive with Modification |

#### Privacy and Security

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-35676](https://jira.hl7.org/browse/FHIR-35676)|	Add language to clarify that not all legal requests are up to org policy - HIPAA has specific procedures that must be followed regarding these types of disclosures  * added clarification to the [Privacy and Security](privacy_and_security.html) page| Persuasive |

&nbsp;
### STU 2 Ballot

<!-- ============================== -->
<!-- ############################################################################################################################################################ -->
---------------------

| Jira Ticket Number | Description   | Resolution   |
|-----------------------|---------------|---------------|
|[FHIR-34237](https://jira.hl7.org/browse/FHIR-34237) | Replace Task with a Task for Referrals and one for the Patient, and add documentation. Patient task should support surveys, documentation, and contact information | Persuasive |
|[FHIR-34238](https://jira.hl7.org/browse/FHIR-34238) | Add Draft observations for race and ethnicity that support the identification of “source” and “method” of collection and add documentation – need US core exceptions from CPWG for observations – submitted variance request to CPG and was approved (see profiles) | Persuasive |
|[FHIR-34242](https://jira.hl7.org/browse/FHIR-34241) | Change ServiceRequest and Procedure profiles to use US core value set for .code  | Persuasive |
|[FHIR-34243](https://jira.hl7.org/browse/FHIR-34243) | Change Condition profile to use US Core .code value set and provide guidance on the use of both SNOMED-CT and ICD-10 (as codings)   | Persuasive |
|[FHIR-34244](https://jira.hl7.org/browse/FHIR-34244) | Add profile for HealthcareService and Location to use in the Patient Task to indicate contact information   | Persuasive |
|[FHIR-34246](https://jira.hl7.org/browse/FHIR-34246) | Add Service order detail in the ServiceRequest to indicate that the service organization is not to call the patient/client  | Persuasive |
|[FHIR-34255](https://jira.hl7.org/browse/FHIR-34255) | Define workflow with patient involvement | Persuasive |
|[FHIR-34256](https://jira.hl7.org/browse/FHIR-34256) | Define workflow with multiple services organization | Persuasive |
|[FHIR-34257](https://jira.hl7.org/browse/FHIR-34257) | Add additional examples for each of the new / changed profiles /requirements   | Persuasive |
|[FHIR-34236](https://jira.hl7.org/browse/FHIR-34236) | Update profiles must support and element definitions based on feedback from implementers   | Persuasive |
|[FHIR-34233](https://jira.hl7.org/browse/FHIR-34233) | Add support for external terminologies as part of ServiceRequest and Procedure.  | Persuasive |
|[FHIR-34339](https://jira.hl7.org/browse/FHIR-34239) | Add Guidance on relationship between new Race and Ethnicity Observation with US Core | Persuasive |

This ballot was focused on a number of additions and corrections based on feedback from  addresses several additions, modifications, technical corrections, errata, clarifications listed below.



#### CodeSystems

Added values and notes [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237), [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238), [FHIR-34246](https://jira.hl7.org/browse/FHIR-34246)

* [SDOHCC CodeSystem Temporary Codes](CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html)



#### Value Sets

Adopted US Core Value Sets [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

*  [FHIR-34243](https://jira.hl7.org/browse/FHIR-34243)

*  Condition: from [Condition/Problem/Diagnosis Codes]({{site.data.fhir.path}}valueset-condition-code.html) to [US Core Condition Code](http://{{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)
*  ServiceRequest: from [Procedure Codes (SNOMED CT)]({{site.data.fhir.path}}valueset-procedure-code.html) to [US Core Procedure Codes](http://{{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)
*  Procedure: from SDOHCC ValueSet SNOMEDCT CPT LOINC HCPCSII to [US Core Procedure Codes](http://{{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)



Removed Values Sets (no longer required) [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

* [SDOHCC ValueSet HCPCSII](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/ValueSet-SDOHCC-ValueSetHCPCSII.html)
* [SDOHCC ValueSet ICD10CM](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/ValueSet-SDOHCC-ValueSetICD10CM.html)
* [SDOHCC ValueSet SNOMEDCT CPT LOINC HCPCSII](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/ValueSet-SDOHCC-ValueSetSNOMEDCTCPTLOINCHCPCSII.html)



Added Value Sets for Race/Ethnicity Observation Profile [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238)

* [SDOHCC ValueSet Observation DataAbsentReason](ValueSet-SDOHCC-ValueSetObservationDataAbsentReason.html)
* [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238) [SDOHCC ValueSet Observation Method](ValueSet-SDOHCC-ValueSetObservationMethod.html)



Added Value Sets for Patient Task [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)


* [SDOHCC ValueSet SDOH Questionnaire Category](ValueSet-SDOHCC-ValueSetSDOHQuestionnaireCategory.html)
* [SDOHCC ValueSet Task Code](ValueSet-SDOHCC-ValueSetTaskCode.html)
* [SDOHCC ValueSet Task Priority](ValueSet-SDOHCC-ValueSetTaskPriority.html)
* [SDOHCC ValueSet Task Status](ValueSet-SDOHCC-ValueSetTaskStatus.html)



Added values and notes [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

* [SDOHCC ValueSet Observation Status](ValueSet-SDOHCC-ValueSetObservationStatus.html)
* [SDOHCC ValueSet SDOH Category](ValueSet-SDOHCC-ValueSetSDOHCategory.html)



#### StructureDefinitions

US Core [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

* Updated from 3.1.1 to 4.0.0



Updated Profiles [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

* [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html) [FHIR-34243](https://jira.hl7.org/browse/FHIR-34243)

- - Changed `Condition.code` value set to use [US Core Condition Code](http://{{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html) value set.

- - Added guidance on use of SDOH value sets



* [SDOHCC Goal](StructureDefinition-SDOHCC-Goal.html) [FHIR 34233](https://jira.hl7.org/browse/FHIR-34233)

* * Added guidance on use of SDOH value sets in VSAC

- - Make `Goal.value` due date MS




* [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html) [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233), [FHIR-34242](https://jira.hl7.org/browse/FHIR-34242)

- - `Procedure.code` -- added reference to [US Core Condition Code](http://{{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html) value set [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233)

- - `Procedure.code.coding` -- added slice for example of social services taxonomy (e.g. 211 LA) as Must Support



* [SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html) [FHIR-34246](https://jira.hl7.org/browse/FHIR-34246), [FHIR-34233](https://jira.hl7.org/browse/FHIR-34233), [FHIR-34242](https://jira.hl7.org/browse/FHIR-34242)

* * `ServiceRequest.status` –- updated guidance

* * `ServiceRequest.code` -- removed slices and added reference to US Core Procedure value set

* * `ServiceRequest.code.coding` -- added slice for example of social services taxonomy (e.g. 211 LA) as Must Support

* * `ServiceRequest.reasonReference` – added guidance
* * `ServiceRequest.orderDetail` -- added order detail to indicate that the service organization is not to call the patient/client


Added new profiles


* [SDOHCC Healthcare Service](StructureDefinition-SDOHCC-HealthcareService.html) [FHIR-34244](https://jira.hl7.org/browse/FHIR-34244), [FHIR-34237](https://jira.hl7.org/browse/FHIR-3437)
* * Extension: [SDOHCC Extension HealthcareService Telecom Appointment](StructureDefinition-SDOHCC-ExtensionHealthcareServiceTelecomAppointment.html) [FHIR-34244](https://jira.hl7.org/browse/FHIR-34244), [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)


* [SDOHCC Location](StructureDefinition-SDOHCC-Location.html) [FHIR-34244](https://jira.hl7.org/browse/FHIR-34244), [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)
* [SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html)  [FHIR-34244](https://jira.hl7.org/browse/FHIR-34244), [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)
* [SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html) [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)

New Draft Observation Profiles for Race and Ethnicity

* [SDOHCC Observation Ethnicity OMB](StructureDefinition-SDOHCC-ObservationEthnicityOMB.html) [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238), [FHIR-34339](https://jira.hl7.org/browse/FHIR-34239)
* [SDOHCC Observation Race OMB](StructureDefinition-SDOHCC-ObservationRaceOMB.html) [FHIR-34238](https://jira.hl7.org/browse/FHIR-34238), [FHIR-34339](https://jira.hl7.org/browse/FHIR-34239)

Removed

* [SDOHCC Task](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/StructureDefinition-SDOHCC-Task.html) [FHIR-34237](https://jira.hl7.org/browse/FHIR-34237)

#### CapabilityStatements

Changed name and updated content

* From [SDOH Clinical Care Coordination Platform](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareCoordinationPlatform.html) to [SDOHCC Coordination Platform Capability Statement](CapabilityStatement-SDOHCC-CoordinationPlatform.html)
* From [SDOH Clinical Care Referral Recipient - Light](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareReferralRecipientLight.html) to [SDOHCC Referral Recipient - Light](CapabilityStatement-SDOHCC-ReferralRecipientLight.html)
* From [SDOH Clinical Care Referral Recipient](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareReferralRecipient.html) to [SDOHCC Referral Recipient](CapabilityStatement-SDOHCC-ReferralRecipient.html)
* From [SDOH Clinical Care Referral Source](https://hl7.org/fhir/us/sdoh-clinicalcare/STU1/CapabilityStatement-SDOH-ClinicalCareReferralSource.html) to  [SDOHCC Referral Source](CapabilityStatement-SDOHCC-ReferralSource.html)

Added CapabilityStatement

* [SDOHCC Patient Application](CapabilityStatement-SDOHCC-PatientApp.html) [FHIR-34255](https://jira.hl7.org/browse/FHIR-34255)

#### Documentation

* [Home Page](index.html) – added reference to new content
* [STU2 Ballot Changes](stu2_ballot_changes.html) – this page
* Functional Use Cases – added Patient/Client use case [FHIR-34255](https://jira.hl7.org/browse/FHIR-34255)
* Support for Multiple Domains – added support for VSAC group value sets [FHIR-34236](https://jira.hl7.org/browse/FHIR-34236)
* Exchange Workflow – added new workflow for Patient/Client and CBO applications [FHIR-34255](https://jira.hl7.org/browse/FHIR-34255), [FHIR-34256](https://jira.hl7.org/browse/FHIR-34256)
* [Connecting Applications with API Data Sources](connecting_applications_with_api_data_sources.html) -- new [FHIR-34255](https://jira.hl7.org/browse/FHIR-34255)
* [FHIR Artifacts Overview](artifacts.html) – updated to refer to new or changed artifacts
* [Draft Specifications for Personal Characteristics](specifications_for_personal_characteristics.html)-- new [FHIR-34339](https://jira.hl7.org/browse/FHIR-34239)



#### Examples

* Many of the examples have been renamed, updated, or added to appropriately provide examples of the changes noted above [FHIR-34257](https://jira.hl7.org/browse/FHIR-34257)


<style>
table, th, td 
{
  border: 1px solid Silver; 
}
th {
  background: Azure;
 }
</style>

<!-- ============================== -->
<!-- ############################################################################################################################################################ -->
---------------------
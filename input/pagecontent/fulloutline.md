### [Gravity Outline Home Page](index.html)
#### Overview
- Definition of SDOH
- Short Description of Gravity Project
- Supported Use Cases
  - Document SDOH data in conjunction with patient encounters with providers, payers, and community services
  - Document and track SDOH-related interventions to completion
  - Identify cohorts of individuals that have a common relationship to another entity (e.g., covered by the same payer) ==> IG doesn't do this.
- Core Activities Supported
  - Screening: This refers to activities where SDH data from individual patients are initially captured, whether through a self-administered, provider-administered, or health plan-administered questionnaire. These activities may also be repeated at certain intervals to monitor changes in social risks.
  - Assessment/Diagnosis: These include activities where providers (clinical and community-based) and health plans analyze the data obtained through screening to determine a patient’s social risks and needs.
  - Treatment/Interventions: These refer to actions undertaken by providers (clinical and community-based) and health plans to help address identified social needs. These include referrals, case management, care planning, counseling and education, and provision of services and orders.
- What the IG Does and What Systems it Involves?
  - Establishes a framework for SDOH-related interventions including:
    - capture of survey data from validated instruments
    - mapping the answers from the surveys into observations, conditions, and goals using SDOH-relevant value sets
    - generating and monitoring referrals from providers and care coordinators to CBOs
    - capturing the results of the referrals as procedures
  - Systems
    - EHR
    - CP
    - CBO Systems
    - Patient Applications
    - Eventually Payer systems?
- Dependencies and Relationships to Other IGs
  - Dependencies:
    - USCore
    - SDC
    - Subscriptions R5 Backport
    - VSAC
  - Related IGs
    - Human Services Directory
    - FAST for Registries?
    - DaVinci for Auth
    - BSER -- alternate referral workflow that will be harmonized
 - How to Read (each section with audience).  Roughly should be read front to back.

| Section | Sub-section | Description | Audience |
| --------| ----------- | --------- | ---------|
| Background| SDOH and Gravity | General background on the importance of collecting and standardizing SDOH data, and the Gravity Project     |  General |
| Background| SDOH Clinical Care Background | What is in and out of scope for this IG.  Shouldn't this be on the Home Page?     |  General |
| Background| [Functional Use Cases] |  This section provides a functional description of the interactions between the actors in an SDOH referral, and with links to the profiles and sections of the IG where more detail is provided. This should be read prior to the more detailed exchange workflow description.       |  General |
| Background| FHIR Technical | Background material that should be understood prior to attempting to understand this IG     |  General/Introductory |
| Implementation Guidance| [Standard Survey Instruments for SDOH (includes Mapping Instructions)] | The importance of standard survey instruments for the collection of SDOH, and how survey instruments are mapped to SDOH Conditions, Observations and Goals     |  General |
| Implementation Guidance|  [Referral Exchange Workflow] |  THis has three parts:  1) General description of Assess/Goals/Intervention workflow (should move to background) 2) Management of Consent (should move to separate section) 3) Detailed technical description of implementation of workflow using the IG's API  |  Detailed Technical |
| Implementation Guidance | [Synchronizing with Data Sources] | I'm not really sure what this is about     |  Detailed Technical  |
| Specifications | [FHIR Artifacts] | An index of the FHIR artifacts defined as part of this implementation guide.     |  Detailed Technical |
| Specifications | [Draft FHIR Artifacts for Personal Characteristics] | Draft proposals for profiles of Observation supporting Personal Characteristics     |  Detailed Technical |
| Specifications| [Must Support and Missing Data Conformance] | Conformance requirements for must support and missing data.     |  Detailed Technical |
| Specifications | [Privacy and Security] | Conformance requirements for privacy and security considerations     |  Detailed Technical |
| Specifications | [Downloads] | Downloads     |  Detailed Technical |
{:.grid}

#### Content and Organization
#### Notes to Implementers
#### Support for External Terminologies for Service Request and Procedures
* How to specify multiple codes .... --> move this elsewhere



#### Authors

### [Gravity Background](gravity_background.html)
#### Why Social Determinants of Health Matter

- Definition of SDOH
- Links to current efforts that address SDOH
- [Figure What's in your health ](Whatgoesintoyourhealth.jpg)

*(Make the image centered and change the width to make it look better )*

#### Standardizing SDOH Exchange

- Background of Standardizing SDOH data
- Emerging Intitiative standardizing SDOH data
- Opportunities
- Risks

#### Gravity Project Overview

- Gravity Project Background
- Mission
- HL7 FHIR Accelerator Program
- Link to Confluence Site

#### Gravity Project Challenge Statement

- What is a challenge statement? ### 3. SDOH Clinical Care Background

#### SDOH Clinical Care Scope


### [SDOH Clinical Care Background](sdoh_clinical_care_background.html)
#### Clinical Care Scope
*There is no explanation to this diagram, it is a littler premature, still haven't been introduced to these actors what does scope of interactions mean?*

[Scope of Interactions Figure](IGScope.jpg)

[Expanded Scope of Interactions Figure](SDOHInteractionsDrawingexpandedV5.jpg)
##### Out of Scope


1. Guidance on frequency of taking assesment
2. Standards for reporting quality measures
3. Addressing Consent beyond sharing to HIPPA

*Does this belong in background, is this out of scope for diagram2*
#### Conceptual Framework

[Conceptual Framework figure](ConceptualFramework2.jpg)

#### Data Modeling Framework
*This could be a good example of one of the diagrams we link link the mCode diagram to the existing artifact*
* Redo figure as an SVG with clickable access to all of the profiles directly *

[Data Modeling Figure](FHIRModeling.jpg){:.center }

### [Functional Use Cases]
#### Actors
#### Overview
#### Disclosure of Protected Health Information
#### Direct Referral
##### Actors and Assumptions
##### Annotated Flow Diagram
#### Direct Referral Light
##### Actors and Assumptions
##### Annotated Flow Diagram
#### Indirect Referral with Direct CBO
##### Actors and Assumptions
##### Annotated Flow Diagram
####  Indirect Referral with Direct Light CBO
##### Actors and Assumptions
##### Annotated Flow Diagram
#### Closing the loop with the patient
##### Actors and Assumptions
#### Patient Workflow

### [Survey Instrument Support](survey_instrument_support.html)
#### Enabling Survey Instruments

* The purpose of risk surveys
  * Pros + Cons
*  Output - QuestionaireResponse --> Observation and Condition
* Describes the approach to incorporate a risk survey into the information flow

[Risk Survey in Workflow](enablingsurveyinstruments.jpg)

#####  [Hunger Vital Sign (HVS) Survey Example](https://loinc.org/88121-9/)
##### [Protocol for Responding to and Assessing Patients Assets, Risks, and Experience (PREPARE) Survey Example](https://loinc.org/93025-5/)
 <span style-"color:purple">*Not much information on what these surveys are* </span>

### [Mapping Instructions](mapping_instructions.html)

* describes the mechanics of QuestionaireResponse --> condition and obervation
  * Conversion using [StructureMaps](https://build.fhir.org/ig/HL7/sdc/extraction.html#structuremap-based-extraction)
  * Structure Map language - [FHIR Mapping Language](http://hl7.org/fhir/R4/mapping-language.html)
  * Describes the overall process for supporting this transformation process

### [Support for Multiple Domains](support_for_multiple_domains.html)
*Deleted*

### [Exchange Workflow](exchange_workflow.html) (Audience = technical implementors?)

<div class="well" style="padding: 0.5em;background-color: white;border: 1px solid #0088f9;">
<strong>Note:</strong> patient and clinical data in the narrative example below are linked to the relevant FHIR examples using <a href="#"><code style="background-color: #f5f2f0; color: #000;">this styling</code></a>.
</div>

| Functional Use Case |  Description | Actors | Exchange Workflow|
| ------------------- | ------------- | ------- | ---------------- |
| [Direct Referral](fulloutline.html#directreferral) | A direct referral between a requesting entity and a performing entity where both entities have FHIR APIs to facilitate the exchanges | Pr, CC, Pa, CBO |   [Direct Referral Exchange Workflow](fulloutline.html#direct-referral-exchange)  |
| [Direct Referral (light)](fulloutline.html#directreferrallight) | A light version of the direct referral where the performing entity uses an application that can access the referring entities API (but does not have FHIR API capability) | Pr, CC, Pa, CBO | [Direct Referral (light) Exchange Workflow](fulloutline.html#direct-referral-light-exchange) |
| [Indirect Referral](fulloutline.html#indirectreferral) | A direct referral between a requesting entity and a performing entity where both entities have FHIR APIs to facilitate the exchanges | Pr, CC, Pa, CBO, CP | [Indirect Referral Exchange Workflow](fulloutline.html#indirect-referral-exchange)         |
| Patient App (no section) | a patient application may optionally communicate directly with any of the entities that support a FHIR API and provide a mechanism for secure exchange | Pr, CC, Pa, CBO, CP | THere is no such section |
{:.grid}


##### General Workflow
[General Workflow Figure](GeneralWorkflow3.jpg)
[Interaction Diagram](OverallInteractions.jpg)
##### Workflow and Managing Consent
[Managing Consent Figure](SDOHInteractionsDrawingConsentV5.jpg)
##### Closed Loop Referral
###### Actors
###### Direct Referral
<a name="direct-referral-exchange">

###### Interaction Diagram
[Iteraction Diagram](SDOHInteractionsDirectExchange.jpg)
###### Workflow Diagram
[Interaction Diagram](DirectReferralSF.jpg)

###### Direct Referral Light
<a name="direct-referral-light-exchange">

###### Interaction Diagram
[Iteraction Diagram](SDOHInteractionsDirectExchangeLight.jpg)

###### Workflow Diagram
[Interaction Diagram](DirectReferralLightSF.jpg)

###### Indirect Referral
<a name="indirect-referral-exchange">

###### Interaction Diagram
[Iteraction Diagram](SDOHInteractionsIndirectExchange.jpg)

###### Workflow Diagram
[Interaction Diagram](IndirectReferralSF.jpg)

###### Notes on Direct and Indirect Referrals
###### Patient Interactions
<a name="patient-interactions-exchange">

###### Overall Workflow
[WOrkflow Diagram](PatientClientExchange.jpg)

###### Detailed workflow for a single questionnaire
[Detailed Workflow](PatientQuestionnaire.jpg)

##### Support for API Access to SDOH Information
Link to [ONC 21st Century Cures Act Final Rule](https://www.healthit.gov/curesrule/)

### [Synchronizing Applications with API Data Sources](synchronizing_applications_with_api_data_sources.html)
##### Requirements
###### Patient/Client Applications
###### CBO Applications
### [FHIR Artifacts Overview](/fhir_artifacts_overview.html)
*Deleted*,  replaced with [Artifacts Overview][artifacts.html]

### [Checking Task Status](checking_task_status.html)
#### Use of Task Status
##### [Referral Task Status](StructureDefinition-SDOHCC-TaskForReferralManagement.html)
[Figure for Referral Task Status](ReferralTaskStatus.jpg)
Should probably be an html table, not an image of a table.
[Figure for Referral Task Statue Diagram](ReferralTaskStateDiagram.jpg)
##### Patient Task Status
[Figure for Patient Task Status](PatientTaskStatus.jpg)
Should probably be an html table, not an image of a table.
[Figure for Patient Task Statue Diagram](PatientTaskStateDiagram.jpg)
#### Checking Task Status
##### Polling
##### Subscription
###### Task Topic
###### ServiceRequest Topic
### [Privacy and Security](privacy_and_security.html)
#### Statues, Regulations, and Guiding Principles
#### FHIR Security and Implementation Guidance
All implementations must follow [FHIR Security](http://hl7.org/fhir/R4/security.html)
#### Security/ Privacy Related Technologies Including Explicit Consent and Security Labels
#### Exchange Security
#### Additionally Proteted Information
### [Must Support and Missing Data](mustsupport_and_missing_data.html)
#### Must Support and Missing Data
### [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html)
#### Background
#### Draft Specificaiton
##### Value Sets for Personal Characteristics
##### Guidance for Personal Characteristics of a Related Person or Practitioner
##### Guidance for Personal Charactersistics (e.g., R/E) that are also included as extensions on US Core
#### Reccomendations fo Collection and Reporting of Personal Characteristics

##### Guidance for use of Proverance with Race and Ethnicity Personal Characteristics
#### Testing Draft Specifications
#### US Core Intent
### Downloads
### Credits
#### Acknowledgements

### ImplementationGuide html page (a la USCore)
#### Intellectual Property
#### Cross Version Analysis
#### Dependencies
#### Globals

{% include markdown-link-references.md %}

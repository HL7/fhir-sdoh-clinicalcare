### [Gravity Outline Home Page](index.html)
#### Overview
- Definition of SDOH
- Description of Gravity Project
- Supported Use Cases
  - Document SDOH data in conjunction with patient encounters with providers, payers, and community services
  - Document and track SDOH-related interventions to completion
  - Identify cohorts of individuals that have a common relationship to another entity (e.g., covered by the same payer)

#### Content and Organization
#### Notes to Implementers
#### Support for External Terminologies for Service Request and Procedures
* How to specify multiple codes .... --> move this elsewhere

#### Intellectual Property
* Move to Downloads page

#### Cross Version Analysis
* Move to Downloads page

#### Dependencies
* Move to Downloads page

#### Globals
* Move to Downloads page

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

[Data Modeling Figure](FHIRModeling.jpg){:.centered}

### [Functional Use Cases] (Audience = non-technical?)
Purpose:  This section provides a functional description of the interactions between the actors in an SDOH referral, and with links to the profiles and sections of the IG where more detail is provided.  This should be read prior to the more detailed exchange workflow description.

Since this is a functional description, technical details have been abstracted.   For example, the mechanism through which the referring provider is informed of the status of the referral could use FHIR Subscriptions or polling (see [Checking Task Status] for details).   Similarly, the relationships between the profiles referenced are not described (see [Data Modeling Framework] ).  Management of task status is not described (see [Checking Task Status]).

##### Patient Stories and Workflow

* [Patient Stories]

##### Overview
** Numbering scheme is described.   I think the numbering scheme is confusing.  Each use case should have its own table describing the steps.  If they are the same as previous steps it can be noted.  Economizing on the steps and having to search for their description makes this hard to read.**

##### Actors

| Actor    |  Icon |  Description |
| ---------- | -------------- | ------------------ |
|  Provider|   ![providericon]   | Includes licensed providers and others that interact with the patient to assess social risk, set goals, and determine/recommend referrals.   |
|  Patient |   ![patienticon]   | definition consistent with Glossary   |
|  Care Coordinator (CC)       |     ![ccicon]         | A person who organizes various referral activities on behalf of the recipient and communicates information between all those involved in the care delivery.   |
|  Community Based Organization (CBO)       |  ![cboicon]            | Public or private not-for-profit resource hubs that provide specific services to the community or targeted population within the community.   |
|  Coordination Platform (CP)       |    ![cpicon]          | An intermediary that receives referrals, assesses patient needs, and works with one or more CBOs to deliver the services.   |
{:.grid}

&nbsp;&nbsp;&nbsp;&nbsp;

| Functional Use Case |  Description | Actors | Exchange Workflow|
| ------------------- | ------------- | ------- | ---------------- |
| [Direct Referral](fulloutline.html#directreferral) | A direct referral between a requesting entity and a performing entity where both entities have FHIR APIs to facilitate the exchanges | ![providericon], CC, Pa, CBO |   [Direct Referral Exchange Workflow](fulloutline.html#direct-referral-exchange)              |
| [Direct Referral (light)](fulloutline.html#directreferrallight) | A “light” version of the direct referral where the performing entity uses an application that can access the referring entities’ API (but does not have FHIR API capability) | ![providericon]. ![ccicon], ![patienticon], ![ccicon], ![cboicon]  | [Direct Referral (light) Exchange Workflow](fulloutline.html#direct-referral-light-exchange) |
| [Indirect Referral](fulloutline.html#indirectreferral) | A direct referral between a requesting entity and a performing entity where both entities have FHIR APIs to facilitate the exchanges | ![providericon]. ![ccicon], ![patienticon], ![ccicon], ![cboicon]. ![cpicon] | [Indirect Referral Exchange Workflow](fulloutline.html#indirect-referral-exchange)                   |
| Patient App (no section) | a patient application may optionally communicate directly with any of the entities that support a FHIR API and provide a mechanism for secure exchange | ![providericon]. ![ccicon], ![patienticon], ![ccicon], ![cboicon]  | THere is no such section |
{:.grid}


##### Business Associates

**Shouldn't this be in a separate section since it is generally applicable?**

##### Direct Referral
<a name="directreferral">

In this use case a provider works with a patient using a standardized assessment tool to identify and prioritize SDOH risks (steps 1-3), and then refers the patient to a CBO for help addressing those needs (steps4-9a) a CBO to help address those needs.  The CBO provides the requested support to the patient and the updated information is shared with the referring provider.

###### Actors and Assumptions
<div align="center">
| Actor    |  Abbrev/Icon | Assumption |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr, ![providericon]   | Provider has a FHIR API   |
|  Patient |   Pa, ![patienticon]   | Provider has a FHIR API  |
|  Community Based Organization        |  CBO, ![cboicon]           | CBO has a FHIR API   |
{:.grid}
</div>

![Direct Referral Functional Use Case](FunctionalUseCaseFlowDirectReferral3.jpg){:.centered}

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![patienticon] | Patient takes standardized assessment tool to identify risks | [Survey Instrument Support] |
| 2 | ![providericon]| Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity | &nbsp; |
| 3 | ![providericon], ![patienticon]|  Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list | [Condition][SDOHCC Condition], [SDOHCC Condition] |
| 4 | ![providericon], ![patienticon]|  Provider and patient identify a goal to pursue enrollment in a SNAP program | [Goal][SDOHCC Goal] |
| 5 | ![providericon], ![patienticon]|  Provider and patient agree that a referral to a contracted or non-contracted CBO is an appropriate next step| &nbsp; |
| 6 | ![patienticon] | Patient consents to be referred to the CBO, and to share appropriate information with the CBO | [Consent][SDOHCC Consent], [Service Request][SDOHCC Service Request], [Task][SDOHCC Task For Referral Management] |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application | ??What info?? |
| 8a | ![cboicon]| Provider or Care Coordinator creates and sends an electronic referral to the CBO | [Service Request][SDOHCC Service Request], [Task][SDOHCC Task For Referral Management]  |
| 9a | ![cboicon] | CBO receives and accepts referral | [Task][SDOHCC Task For Referral Management]  |
| 10 (optional) | ![cboicon], ![patienticon]| CBO communicates with the patient via their application to schedule appointments, collect additional information, etc.  This communication might not take place electronically.| ??what info/resources?? |
| 11 | ![cboicon] | CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed | [Task][SDOHCC Task For Referral Management], [Procedure][SDOHCC Procedure] |
| 12 | ![providericon] | Provider receives the updated status | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Survey Instrument Support] |
| 14 | ![providericon] | determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately | [Goal][SDOHCC Goal] |
{:.grid}

###### Considerations

I don't understand the point of this section.


##### Direct Referral Light
In this use case a provider works with a patient using a standardized assessment tool to identify and prioritize SDOH risks (steps 1-3), and then refers the patient to a CBO for help addressing those needs (steps4-9a) a CBO to help address those needs.  The CBO provides the requested support to the patient and the updated information is shared with the referring provider.

Functionally, this use case is the same as the previous use case, except that the CBO has a FHIR-enabled application, but does not support a FHIR API.  As a result, the provider can't push information to the CBO, but rather tha CBO needs to pull information from the provider.    At the conclusion of the referral, the CBO POSTS needed information to the Provider FHIR server (e.g., Procedures) and updates the status and the linked resources of the Task.

<div align="center">
| Actor    |  Abbrev/Icon | Assumption |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr, ![providericon]   | Provider has a FHIR API   |
|  Patient |   Pa, ![patienticon]   | Patient has a FHIR-enabled application  |
|  Community Based Organization        |  CBO, ![cboicon]           | CBO has a FHIR-enabled API   |
{:.grid}
</div>

![Functional Use Case Direct Referral Light](FunctionalUseCaseFlowDirectLightReferral3.jpg){:.centered}

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![patienticon] | Patient takes standardized assessment tool to identify risks | [Survey Instrument Support] |
| 2 | ![providericon]| Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity | &nbsp; |
| 3 | ![providericon], ![patienticon]|  Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list | [Condition][SDOHCC Condition], [SDOHCC Condition] |
| 4 | ![providericon], ![patienticon]|  Provider and patient identify a goal to pursue enrollment in a SNAP program | [Goal][SDOHCC Goal] |
| 5 | ![providericon], ![patienticon]|  Provider and patient agree that a referral to a contracted or non-contracted CBO is an appropriate next step| &nbsp; |
| 6 | ![patienticon] | Patient consents to be referred to the CBO, and to share appropriate information with the CBO | [Consent][SDOHCC Consent], [Service Request][SDOHCC Service Request], [Task][SDOHCC Task For Referral Management] |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application | ??What info?? |
| 8b | ![cboicon]| CBO application queries Provider or Care Coordinator API for new or updated referrals | [Service Request][SDOHCC Service Request], [Task][SDOHCC Task For Referral Management]  |
| 9b | ![cboicon] | CBO finds new referral and accepts the referral | [Task][SDOHCC Task For Referral Management]  |
| 10 (optional) | ![cboicon], ![patienticon]| CBO communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically| ??what info/resources?? |
| 11 | ![cboicon] | CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed. This will involve POSTing resources such as Procedures to the Provider FHIR server, and making sure they are linked appropriately. | [Task][SDOHCC Task For Referral Management], [Procedure][SDOHCC Procedure] |
| 12 | ![providericon] | Provider receives the updated status | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Survey Instrument Support] |
| 14 | ![providericon] | determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately | [Goal][SDOHCC Goal] |
{:.grid}


##### Indirect Referral with Direct CBO
<a name="indirectreferral">

[Functional Use Case Indirect Referral](FunctionalUseCaseFlowIndirectDirectReferral3.jpg)

###### Actors and Assumptions

<div align="center">
| Actor    |  Abbrev/Icon | Assumption |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr   | Provider has a FHIR API   |
|  Patient |   Pa   | Patient has a FHIR enabled personal application  |
|  Coordinating Platform        |  CP            | CP has a FHIR API   |
|  Community Based Organization        |  CBO            | CBO has a FHIR  API   |
{:.grid}
</div>

###### Provider Actions (same as Direct Referral)
###### Provider – CP – CBO workflow
###### Provider Actions (same as Direct Referral)
###### Considerations in addition to Direct Referral
#####  Indirect Referral with Direct Light CBO
<a name="directreferrallight">

[Functional Use Case Indirect Direct Light](FunctionalUseCaseFlowIndirectDirectLightReferral3.jpg)

###### Actors and Assumptions

| Actor    |  Abbrev/Icon | Assumption |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr   | Provider has a FHIR API   |
|  Patient |   Pa   | Patient has a FHIR enabled personal application  |
|  Coordinating Platform        |  CP   | CP has a FHIR API   |
|  Community Based Organization        |  CBO  | CBO has a FHIR enabled application (must do a push to CP)   |
{:.grid}

###### Provider Actions (same as Direct Referral)
###### Provider – CP – CBO workflow (note: steps with a "b" suffix are specific to this referral)
###### Provider Actions (same as Direct Referral)
###### Considerations (same as Indirect Referral with Direct CBO)
##### Closing the loop with the patient
###### Actors and Assumptions

| Actor    |  Abbrev/Icon | Assumption |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr   | Provider has a FHIR API   |
|  Patient |   Pa   | Patient has a FHIR enabled personal application. Registered with Pr's, CP's, and CBO's FHIR API  |
|  Coordinating Platform        |  CP   | CP has a FHIR API   |
|  Community Based Organization |  CBO  | CBO has a FHIR enabled application (must do a push to CP)   |
{:.grid}

###### Patient Workflow (from above functional use cases)
###### Considerations
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

{% include markdown-link-references.md %}

# 1. Gravity Outline Home Page

## 1.1 Overview
    - Definition of SDOH
    - Description of Gravity Project
    - Supported Use Cases
        - Document SDOH data in conjunction with patient encounters with providers, payers, and community services
        - Document and track SDOH-related interventions to completion
        - Identify cohorts of individuals that have a common relationship to another entity (e.g., covered by the same payer)
## 1.2 Content and Organization
    - Background
    - Change History
    - Context
    - Specifications
    - Downloads
    - Credits
## 1.3 Notes to Implementers
## 1.4 Support for External Terminologies for Service Request and Procedures
- [Includes Code SNippet for Summer Food Program Code]
## 1.5 Intellectual Property
## 1.6 Cross Version Analysis
## 1.7 Dependencies
## 1.8 Globals
## 1.9 Authors # 2. Gravity Background

## 2.1 Why Social Determinants of Health Matter
- Definition of SDOH
- Links to current efforts that address SDOH

<p align-"center">
<img src-"What-in-your-health.png" width-"600">
</p>

*(Make the image centered and change the width to make it look better )*

What Goes into Your Health Diagram
## 2.2 Standardizing SDOH Exchange
- Background of Standardizing SDOH data
- Emerging Intitiative standardizing SDOH data
- Opportunities
- Risks
## 2.3 Gravity Project Overview
- Gravity Project Background
- Mission
- HL7 FHIR Accelerator Program
- Link to Confluence Site
## 2.4 Gravity Project Challenge Statement
- What is a challenge statement? # 3. SDOH Clinical Care Background

## 3.1 SDOH Clinical Care Scope
The Gravity Project focus for this version of the IG is to standardize the exchange of SDOH information related to the following activities:

1) assessment of social risk,

2) establishing coded health concerns/problems,

3) creating patient driven goals, and

4) defining a RESTful closed loop referral process to manage interventions.

                       *Insert Diagram #1*

<p align-"center">
<img src-"diagram1.png" width-"600">
</p>


- Narrtative that describes the SDOH domains rather than the above diagram
- Link to current list of domains [SDOH Domains ](https://confluence.hl7.org/display/GRAV/Terminology+Workstream+Dashboard)

- The scope of interactions plan to cover all the interactions below..

*There is no explanation to this diagram, it is a littler premature, still haven't been introduced to these actors what does scope of interactions mean?*

                            *Insert Diagram 2*

<p align-"center">
<img src-"diagram2.png" width-"600">
<figure-caption>Figure 2. The Scope of Interactions. </figure-caption>
</p>


### 3.1.1 Out of Scope
    1. Guidance on frequency of taking assesment
    2. Standards for reporting quality measures
    3. Addressing Consent beyond sharing to HIPPA

*Does this belong in background, is this out of scope for diagram2*
## 3.2 Conceptual Framework

                        *Insert Diagram 3*

<p align-"center">
<img src-"diagram3.png" width-"600">
</p>


## 3.3 Data Modeling Framework
                        *Insert Diagram 4*
*This could be a good example of one of the diagrams we link link the mCode diagram to the existing artifact*

<p align-"center">
<img src-"Diagram4.png" width-"600">
</p>


# Functional Use Cases (Audience = non-technical?)
***
* Why does this section refer to implementation technologies like subscription?
* Isn't functional use cases more like A notifies B, or A queries B?
***

- Link to Patient Stories [Patient Stories ](https://confluence.hl7.org/display/GRAV/Patient+Stories)
- These use cases are represented by workflow diagrams on the Exchange Workflow Page [Exchange Worklows Page ](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/exchange_workflow.html)

- The following numbering is use throughout this section where  N is an integer number:

    - **N (e.g. 1-14)** are steps common to all functional use cases
    - **IN (e.g. I1-I12)** are additional steps used only by Indirect use cases
    - **INa (e.g. I8,I9)** are steps used by the Indirect use case when communicating with a FHIR API enabled CBO
    - **INb (e.g. I8b, I9b)** are steps used by the Indirect use case when communicating with a FHIR application enabled CBO

## 4.1 Overview


## 4.2 Actors

| Actor    |  Abbreviation/Icon |  Description |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr   | definition consistent with Glossary   |
|  Patient |   Pa   | definition consistent with Glossary   |
|  Care Coordinator        |     CC         | definition consistent with Glossary   |
|  Community Based Organization        |  CBO            | definition consistent with Glossary   |
|  Coordinating Platform        |    CP          | definition consistent with Glossary   |
{:.grid}

| Functional Use Case |  Description | Actors | Exchange Workflow|
| ------------------- | ------------- | ------- | ---------------- |
| [Direct Referral](#directreferral) | A direct referral between a requesting entity and a performing entity where both entities have FHIR APIs to facilitate the exchanges | Pr, CC, Pa, CBO |   [Direct Referral Exchange Workflow] (#direct-referral-exchange)              |
| [Direct Referral (light)](#directreferalllight) | A “light” version of the direct referral where the performing entity uses an application that can access the referring entities’ API (but does not have FHIR API capability) | Pr, CC, Pa, CBO | [Direct Referral (light) Exchange Workflow] (#direct-referral-light-exchange) |
| [Indirect Referral](#indirectreferral) | A direct referral between a requesting entity and a performing entity where both entities have FHIR APIs to facilitate the exchanges | Pr, CC, Pa, CBO, CP | [Indirect Referral Exchange Workflow](#indirect-referral-exchange)                   |
| Patient App (no section) | a patient application may optionally communicate directly with any of the entities that support a FHIR API and provide a mechanism for secure exchange | Pr, CC, Pa, CBO, CP | THere is no such section |
{:.grid}


## 4.3 Business Associates
- CBO and CP not covered entities
    - can be business associates (covered entity)
- Information describing what a covered entity is *(Is this necessary doesn't seem relevant maybe a link to informaiton would be better)*
## 4.4 Direct Referral
<a name="directreferral">

| Actor    |  Abbrev/Icon | Assumption |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr   | Provider has a FHIR API   |
|  Patient |   Pa   | Provider has a FHIR API  |
|  Community Based Organization        |  CBO            | CBO has a FHIR API   |
{:.grid}


### 4.4.3 Provider Actions
1. Patient takes standardized assessment tool to identify risks
2. Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity
3. Provider and patient determine that it is most important to address the Food Insecurity first – provider promotes the health concern to the problem list
4. Provider and patient add a goal related to this problem to pursue enrollment in a SNAP program
5. Provider and patient agree that a referral to a contracted or non-contracted CBO is an appropriate next step
6. Patient consents to be referred to the CBO and consents to have the information that will be provided sent to the CBO
7. Optional: Provider makes information regarding the referral available to the patient’s application

### 4.4.4 Provider- CBO Actions
8a. Provider or Care Coordinator creates and sends an electronic referral to the C

9a. CBO receives and accepts referral


 <span style-"color:purple">*What's the purpose of the 'a'?* </span>.

### 4.4.5 CBO Actions
10a. Optional: CBO communicates with the patient via their application to schedule appointments, collect additional information, etc.

CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed

### 4.4.6 Provider Actions
1. Provider receives the updated status
2. Optional: Provider closes loop with patient via questionnaire available to a patient’s application
3. Provider determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately

### 4.4.7 Considerations
- CBOs are typically not BAs of covered entities and therefore not bound by HIPAA’s privacy and security requirements
- Provider may not always have the relationship with the CBO
- CBO may not accept the referral or be unable to perform the requested service
- Closing the loop via patient reported outcome

<table><tr><td><img src="FunctionalUseCaseFlowDirectReferral3.jpg" /></td></tr></table>

<span style-"color:purple">*I would put this diagram at the top of the section, I would aslo add the caption* </span>

## 4.5 Direct Referral Light
<a name="directreferrallight">
<p align-"center">
<img src-"diagram6.png" width-"600">
<figure-caption><strong>Figure 1. Functional Use Case -- Direct Light Referral. </figure-caption>
</p>

| Actor      |  Abbrev/Icon   | Assumption         |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr   | Provider has a FHIR API   |
|  Patient |   Pa   | Patient has a FHIR enabled personal application  |
|  Community Based Organization        |  CBO            | CBO has a FHIR enabled application (must do a push to CP)   |
{:.grid}

### 4.5.3 Provider Actions
### 4.5.4 CBO- Provider Actions
### 4.5.5 CBO Actions
### 4.5.6 Provider Actions
### 4.5.7 Consideration

## 4.6 Indirect Referrral with Direct CBO
<a name="indirectreferral">
<p align-"center">
<img src-"diagram7.png" width-"600">
<figure-caption><strong>Figure 1. Functional Use Case -- Indirect Referral. </figure-caption>
</p>

| Actor    |  Abbrev/Icon | Assumption |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr   | Provider has a FHIR API   |
|  Patient |   Pa   | Patient has a FHIR enabled personal application  |
|  Coordinating Platform        |  CP            | CP has a FHIR API   |
|  Community Based Organization        |  CBO            | CBO has a FHIR  API   |
{:.grid}
### 4.6.3 Provider Actions
### 4.6.4 Provider- CP- CBO Workflow
### 4.6.5 Provider Actions
### 4.6.6 Considerations same as Direct Referral

## 4.7 Indirect Referral with Direct Light CBO
<a name="directreferrallight">
<table><tr><td><img src="FunctionalUseCaseFlowIndirectDirectLightReferral3.jpg" /></td></tr></table>

| Actor    |  Abbrev/Icon | Assumption |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr   | Provider has a FHIR API   |
|  Patient |   Pa   | Patient has a FHIR enabled personal application  |
|  Coordinating Platform        |  CP            | CP has a FHIR API   |
|  Community Based Organization        |  CBO            | CBO has a FHIR enabled application (must do a push to CP)   |
{:.grid}

### 4.7.3 Provider Actions
### 4.7.4 Provider- CP- CBO workflow (note: steps with a “b” suffix are specific to this referral)
### 4.7.5 Provider Actions
### 4.7.6 Considerations same as Direct Referral

## 4.8 Closing the Loop with the Patient

| Actor    |  Abbrev/Icon | Assumption |
| ---------- | -------------- | ------------------ |
|  Provider|   Pr   | Provider has a FHIR API   |
|  Patient |   Pa   | Patient has a FHIR enabled personal application. Registered with Pr's, CP's, and CBO's FHIR API  |
|  Coordinating Platform        |  CP            | CP has a FHIR API   |
|  Community Based Organization        |  CBO            | CBO has a FHIR enabled application (must do a push to CP)   |
{:.grid}
### 4.8.2 Patient Workflow (from above functional use cases)
### 4.8.3 Considerations # 5 Survey Instrument Support
## 5.1 Enabling Survey Instruments

- The purpose of risk surveys
    - Pros + Cons
- Output - QuestionaireResponse --> Observation and Condition

- Describes the approach to incorporate a risk survey into the information flow

<p align-"center">
<img src-"diagram9.png" width-"600">
<figure-caption><strong>Figure 1. Risk Survey in Workflow </figure-caption>
</p>


### 5.1.1 [Hunger Vital Sign (HVS) Survey Example](https://loinc.org/88121-9/)

- Outlines vital sign survey example representation

### 5.1.2 [Protocol for Responding to and Assessing Patients Assets, Risks, and Experience (PREPARE) Survey Example](https://loinc.org/93025-5/)

- Outlines partial example of a PREPARE survey

 <span style-"color:purple">*Not much information on what these surveys are* </span>
# 6. Mapping Instructions

- describes the mechanics of QuestionaireResponse --> condition and obervation
    - Conversion using [StructureMaps](https://build.fhir.org/ig/HL7/sdc/extraction.html#structuremap-based-extraction)
    - Structure Map language - [FHIR Mapping Language](http://hl7.org/fhir/R4/mapping-language.html)
    - Describes the overall process for supporting this transformation process

# 7. Support for Multiple Domains

## 7.1 Code Systems and Value Sets

- Describes how the Gravity Terminology WorkStream works
- [Supplemental Guide](https://confluence.hl7.org/display/GRAV/Supplemental+Guide)

## 7.2 External Value Set Guidance

· [Social Determinants of Health Conditions Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion)

· [Social Determinants of Health Goals Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion)

· [Social Determinants of Health Service Requests Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.790/expansion)

· [Social Determinants of Health Procedures Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion)

<p align-"center">
<img src-"diagram10.png" width-"600">
<figure-caption><strong>Figure 1. Example of VSAC SDOH Group Value Set for Condition.Code </figure-caption>
</p>
# 8. Exchange Workflow (Audience = technical implementors?)

## 8.1 General Workflow

    General Process
    1. Asses Patient and Determine Risk
    2. Patient and Provider estabilsh goals
    3. Patient and Provider agree on referrals/interventions, consent, task sent to performing entitty
<p align-"center">
<img src-"diagram11.png" width-"600">
<figure-caption><strong>Figure 1. General Workflow </figure-caption>
</p>

    System/System Interactions Supported:
    1. referrals via an intermediary (or indirect referrals) that may include interactions with multiple service performers,
    2. direct and direct light (where the interaction is with an application) referrals,
    3. interactions with a patient to complete a questionnaire or “form”, and
    4. interactions with a patient to cancel a service or indicate the outcome of the service


<p align-"center">
<img src-"diagram12.png" width-"600">
<figure-caption><strong>Figure 2. Overall Interactions </figure-caption>
</p>

## 8.2 Workflow and Managing Consent

    Describes specification for consent resource.

    The following diagram depicts:
    1. The patient interacts with the provider and takes a risk survey that creates the specific health concerns defined by the survey and the patient’s responses.
    2. The provider and patient determine which of the health concerns are valid, and “promote” the most important ones to the “problem list” to be addressed. The patient and provider may establish goals and agree on the specific referrals/interventions/exchanges (not depicted in this diagram). The patient provides consent to share information with the relevant organizations.
    3. The Provider’s System provides (via a FHIR API) the ability to share information with
        - CBO
        - CP
        - Payer
<p align-"center">
<img src-"diagram13.png" width-"600">
<figure-caption><strong>Figure 3. Exchange Workflow Managing Consent </figure-caption>
</p>

## 8.3 Closed Loop Referrral
### 8.3.1 Actors
    Provider
    1. a provider
    2. a payer as part of care management, risk assessment, or via programs that assess and intervene regarding social risk
    3. a CP

    CP
    1. This is a service that accepts referrals (it may also create them)
    2. May determine which Community Based Organization (CBO) is capable and available to provide the appropriate service
    3. Engages the CBO to perform the referral
    4. Tracks the referral process to completion
    5. Reports status back to the Referring Entity

    CBO/ Performer
    1. Provides one or more social risk services
    2. interacts with the CP or RE to provide status of the referral

### 8.3.2 Direct Referral
(*Link to the Direct Referral Functional Use Case Diagram*)
#### 8.3.2.1 Interaction Diagram

<p align-"center">
<img src-"diagram14.png" width-"600">
<figure-caption><strong>Figure 4. Workflow Direct Referral </figure-caption>
</p>


#### 8.3.2.2 Workflow Diagram

<p align-"center">
<img src-"diagram15.png" width-"600">
<figure-caption><strong>Figure 5. Workflow Direct Referral </figure-caption>
</p>

### 8.3.3. Direct Referral Light
#### 8.3.3.1 Interaction Diagram

<p align-"center">
<img src-"diagram16.png" width-"600">
<figure-caption><strong>Figure 6. Workflow Direct Referral Light </figure-caption>
</p>

#### 8.3.3.2 Workflow Diagram

<p align-"center">
<img src-"diagram17.png" width-"600">
<figure-caption><strong>Figure 7. Workflow Direct Referral </figure-caption>
</p>

### 8.3.4 Indirect Referral
    - Includes all the SHALL supports
#### 8.3.4.1 Interaction Diagram

<p align-"center">
<img src-"diagram18.png" width-"600">
<figure-caption><strong>Figure 8. Workflow Indirect Referral </figure-caption>
</p>

#### 8.3.4.2 Workflow Diagram

<p align-"center">
<img src-"diagram19.png" width-"600">
<figure-caption><strong>Figure 9. Workflow Indirect Referral </figure-caption>
</p>

### 8.3.5 Notes on Direct and Indirect Referrals
### 8.3.6 Patient Interactions

    List of supported interactions from a patient/client application
#### 8.3.6.1 Overall Workflow

<p align-"center">
<img src-"diagram20.png" width-"600">
<figure-caption><strong>Figure 10. Patient Client Interaction </figure-caption>
</p>

    Describes the high level of exchanges

#### 8.3.6.2 Detailed Workflow for a Single Questionnaire

<p align-"center">
<img src-"diagram21.png" width-"600">
<figure-caption><strong>Figure 11. Patient Client Questionaire/ Form </figure-caption>
</p>

## 8.4 Support for API Access to SDOH Information

Link to [ONC 21st Century Cures Act Final Rule](https://www.healthit.gov/curesrule/)# 9 Synchronizing Applications with API Data Sources

This Implementation Guide (IG) is providing recommended specifications for the synchronization of patient and Community Based Organization (CBO) applications with API data sources for SDOH information as defined in this IG.

## 9.1 Requirements
the following processes SHOULD be supported by all referral platforms and applications....

### 9.1.1 Patient/ Client Application

1) Applications are registered with the appropriate referral platforms.

2) On the first use of the application

Patient/Client is provided a URL to download the application to their smart phone or a link to an on-line application.
Patient/Client establishes application security
3) Referral Source provides Patient with a URL to the API that redirects to an authorization server

Patient enters credentials provided by the referral platform
Application is provided with an access token and refresh token
4) API URL and the tokens are stored in the application

5) When the patient/client authenticates to the application, on a timed schedule or on demand

Application uses the URL and refresh token to obtain an access token
Application follows the Referral Source Light workflow process
Note: steps 3-5 are repeated for each referral source

### 9.1.2 CBO Applications

1) Participating CBO applications are registered with the appropriate referral platforms.

3) Referral Source provides Patient with a URL to the API that redirects to an authorization server

CBO enters credentials provided by the referral platform
Application is provided with an access token and refresh token
4) API URL and the tokens are stored in the application

5) When the CBO authenticates to the application, on a timed schedule, or on demand

Application uses the URL and refresh token to obtain an access token
Application follows the Referral Source Light workflow process
Note: steps 3-5 are repeated for each referral source# 11. FHIR Artifacts Overview



## 11.1 Artifact Lists
- List of Resources
- List of Value Sets
- List of Codes Systems# 12 Checking Task Status

## 12.1 Use of Task Status
- Describes the use of Task.Status
- Difference between ReferralTask and PatientTask

### 12.1.1 Referral Task Status

[Referral Task Status](http://hl7.org/fhir/us/sdoh-clinicalcare/STU2/StructureDefinition-SDOHCC-TaskForReferralManagement.html)

<p align-"center">
<img src-"diagram23.png" width-"600">
</p>


<p align-"center">
<img src-"diagram22.png" width-"600">
<figure-caption><strong>Figure 1. Referral Task Status Diagram </figure-caption>
</p>

### 12.1.2 Patient Task Status

<p align-"center">
<img src-"diagram24.png" width-"600">

</p>

<p align-"center">
<img src-"diagram25.png" width-"600">

</p>

## 12.2 Checking Task Status
    - Service Delivery Organizations - burden of monitoring tasks
    - EHR Systtmes
### 12.2.1 Polling
- Description on how to search for tasks
- frequency of polling

### 12.2.2 Subscription
- describes subsription mechanism where client creates subscription instance on the server that indicates that it wants to be notified about changes

#### 12.2.2.1 Task Topic

- This topic allows for monitoring for newly created tasks as well as updates to assigned or requested tasks.


#### 12.2.2.2 ServiceRequest Topic

- This topic allows for monitoring for changes to a ServiceRequest when an organization is involved in fulfilling that request# 13 Privacy and Security

## 13.1 Statues, Regulations, and Guiding Principles
- description of what al implementations of SDOH include..
    - SHALL meet all current relevant Federal and State statutes and regulations regarding security and privacy.
    - SHALL use applicable technical standards required by current regulations published by CMS and ONC (allowing for voluntary use through the SVAP) unless an exception has been granted.
    - SHOULD follow the Gravity Project Data Principles when the final version is published.
    - SHALL support patient/member consent and/or treatment of sensitive information consistent with Federal and State statutes and regulations.
    - SHOULD support the consent and data sharing policies of trading partners involved in the exchange that are more protective so long as policies are consistent with or more restrictive than Federal and State statutes and regulations.
## 13.2 FHIR Security and Implementation Guidance

All implementations must follow [FHIR Security](http://hl7.org/fhir/R4/security.html)

## 13.3 Security/ Privacy Related Technologies Including Explicit Consent and Security Labels
## 13.4 Exchange Security
## 13.5 Additionally Proteted Information
# 14 Must Support and Missing Data
Systems claiming to conform to a profile SHALL support the elements in a profile as defined below: This guide adopts the following definitions of MustSupport for all direct transactions between the Sending and Receiving Systems

## 14.1 Must Support and Missing Data
- Sending System Requierments
- Receiving System Requierments
- Conformance to US Core# 15 Draft Specifications for Personal Characteristics

## 15.1 Background
- Importance of exchanging R/E data
- Challenges of exchanging R/E data
## 15.2 Draft Specificaiton
- draft spec meets reporting requierments
- personal characteristics modeled with observation resource

### 15.2.1 Value Sets for Personal Characteristics
- personal characteristic profiles are based on existing value sets
### 15.2.2 Guidance for Personal Characteristics of a Related Person or Practitioner
### 15.2.3 Guidance for Personal Charactersistics (e.g., R/E) that are also included as extensions on US Core
## 15.3 Reccomendations fo Collection and Reporting of Personal Characteristics

### 15.3.1 Guidance for use of Proverance with Race and Ethnicity Personal Characteristics
## 15.4 Testing Draft Specifications
## 15.5 US Core Intent # 16 Downloads

## 16.1 Full Implementation Guide
## 16.2 Package File
## 16.3 Formal Specific Definition Files
## 16.4 Examples: all examples that are used in this Implementation Guide available for download # 17 Credits

## 17.1 Acknowledgements

- List of individuals who have contributed # 18 STU2 Ballot CHanges

## 18.1 Jira Ticktes- all applied- see changes below
## 18.2 CodeSystems
## 18.3 Value Sets
## 18.4 Structure Definitions
## 18.5 Capability Statements
## 18.6 Documentation
## 18.7 Examples
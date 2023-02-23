This section provides a functional description of the interactions between the actors in an SDOH referral, and with links to the profiles and sections of the IG where more detail is provided.  This should be read prior to the more detailed exchange workflow description.

Since this is a functional description, technical details have been abstracted.   For example, the mechanism through which the referring provider is informed of the status of the referral could use FHIR Subscriptions or polling (see [Checking Task Status] for details).   Similarly, the relationships between the profiles referenced are not described (see [Data Modeling Framework] ).  Management of task status is not described (see [Checking Task Status]).

The use cases here relate to the Gravity [Patient Stories].  Implementers will benefit from looking at the detailed technical description of the exchange work flow for each use case, as well as the [Capability Statements] associated with each workflow and the [conformance artifacts](artifacts.html) generally.

### Actors
The actors in the workflows are described in the table below.   The graphical icons are used throughout the IG.   For each use case the assumptions regarding each type of actor will be described.

| Actor    |  Description |
| ----------  | ------------------ |
|  Provider ![providericon]   | Includes licensed providers and others that interact with the patient to assess social risk, set goals, and determine/recommend referrals.   |
|  Patient  ![patienticon]   | definition consistent with Glossary   |
|  Care Coordinator (CC) ![ccicon]         | A person who organizes various referral activities on behalf of the recipient and communicates information between all those involved in the care delivery.   |
|  Community Based Organization (CBO)  ![cboicon]  | Public or private not-for-profit resource hubs that provide specific services to the community or targeted population within the community.   |
|  Coordination Platform (CP)  ![cpicon]          | An intermediary that receives referrals, assesses patient needs, and works with one or more CBOs to deliver the services.   |
{:.grid}


### Overview
The functional use cases in the table below describe the referral process initiated by a provider, or other healthcare actor, and a request referral recipient, both directly and indirectly via an intermediary.   For each use case the capabilities or limitations of the actor are described.   The table links to the functional use case and the associated detailed technical exchange workflow.


| Functional Use Case |  Description           | Actors | Exchange Workflow|
| ------------------- | ---------------------- | ------- | ---------------- |
| [Direct Referral](functional_use_cases.html#directreferral) | A direct referral between a requesting entity and a performing entity where both entities have FHIR APIs to facilitate the exchanges | ![providericon], ![ccicon], ![patienticon], ![cboicon] |   [Direct Referral Exchange Workflow](exchange_workflow#direct-referral-exchange)              |
| [Direct Referral (light)](functional_use_cases.html#directreferrallight) | A “light” version of the direct referral where the performing entity uses an application that can access the referring entities’ API (but does not have FHIR API capability) | ![providericon]. ![ccicon], ![patienticon], ![ccicon], ![cboicon]  | [Direct Referral (light) Exchange Workflow](exchange_workflow.html#direct-referral-light-exchange) |
| [Indirect Referral](functional_use_cases.html#indirectreferral) | A direct referral between a requesting entity and a performing entity where both entities have FHIR APIs to facilitate the exchanges | ![providericon]. ![ccicon], ![patienticon], ![ccicon], ![cboicon]. ![cpicon] | [Indirect Referral Exchange Workflow](exchange_workflow.html#indirect-referral-exchange)                   |
| [Patient Coordination](functional_use_cases.html#patientworkflow| a patient application may optionally communicate directly with any of the entities that support a FHIR API and provide a mechanism for secure exchange | ![providericon]. ![ccicon], ![patienticon], ![ccicon], ![cboicon]  | [Patient Workflow Exchange](exchange_workflow.html#patient-exchange) |
{:.grid}


### Disclosure of Protected Health Information

Sharing data with CBOs and CPs must be done in conformance with HIPAA requirements.  Although CBOs and CPs are not 'covered entities' under HIPAA,
sharing with them can be facilitated by a Business Associate Agreement (BAA) between the covered entity (Providers, Payers and Clearing Houses) and the Business Associate.
Entities covered under a BAA may be able to receive Protected Health Information (PHI) as part of the agreement without consent of the patient. However, they are required to observe the same limitations as covered entities with regard the protection and disclosure of PHI.  Patient consent would generally required for a provider to disclose a patient's PHI to a CBO or CP that is neither a covered entity nor covered by a BAA.  See the [Privacy and Security] section for more detailed requirements on protecting patient privacy.

### Direct Referral
<a name="directreferral"></a>

In this use case a provider works with a patient using a standardized assessment tool to identify and prioritize SDOH risks (steps 1-3), and then refers the patient to a CBO for help addressing those needs (steps4-9a) a CBO to help address those needs.  The CBO provides the requested support to the patient and the updated information is shared with the referring provider.

The example assumes that the Provider has an existing relationship with the CBO.
The CBO may not accept the referral or be unable to perform the requested service.

#### Actors and Assumptions



| Actor    | Assumption |
| ---------- | ------------------ |
|  Provider ![providericon]   | Provider has a FHIR API   |
|  Patient  ![patienticon]   | Provider has a FHIR API  |
|  Community Based Organization (CBO)  ![cboicon] | CBO has a FHIR API   |
{:.grid .center }


#### Annotated Flow Diagram
![Direct Referral Functional Use Case](FunctionalUseCaseFlowDirectReferral3.jpg){:.center }

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

### Direct Referral Light
In this use case a provider works with a patient using a standardized assessment tool to identify and prioritize SDOH risks (steps 1-3), and then refers the patient to a CBO for help addressing those needs (steps4-9a) a CBO to help address those needs.  The CBO provides the requested support to the patient and the updated information is shared with the referring provider.

Functionally, this use case is the same as the previous use case, except that the CBO has a FHIR-enabled application, but does not support a FHIR API.  As a result, the provider can't push information to the CBO, but rather tha CBO needs to pull information from the provider.    At the conclusion of the referral, the CBO POSTS needed information to the Provider FHIR server (e.g., Procedures) and updates the status and the linked resources of the Task.

#### Actors and Assumptions

| Actor    | Assumption |
| -------- | ----------- |
|  Provider ![providericon]   | Provider has a FHIR API   |
|  Patient  ![patienticon]   | Patient has a FHIR-enabled application  |
|  Community Based Organization (CBO)  ![cboicon] | CBO has a FHIR-enabled API   |
{:.grid .center }



#### Annotated Flow Diagram
![Functional Use Case Direct Referral Light](FunctionalUseCaseFlowDirectLightReferral3.jpg){:.center }

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
{:.grid .center  }


### Indirect Referral with Direct CBO
<a name="indirectreferral"></a>

In this use case a provider works with a patient using a standardized assessment tool to identify and prioritize SDOH risks, and then refers the patient indirectly via a CP to a CBO for help addressing those needs.  The CP relays the referral to the CBO.  The CBO provides the requested support to the patient and the updated information is relayed back through the CP where it is shared with the referring provider.

Functionally, this indirect referral is essentially two direct referrals (Provider to CP, and CP to CBO) chained together.

The Provider has a relationship with the CP, but not with the CBO.  The use case assumes that the CP and the CPO have an established relationship.
The Provider may request to have the service delivered by a specific CBO.   The CP may not accept the referral or be unable to perform the requested service, or may need to split the request into multiple tasks to be performed by one or more CBOs.

#### Actors and Assumptions


| Actor    |   Assumption |
| ---------- | ------------------- |
|  Provider ![providericon]  | Provider has a FHIR API   |
|  Patient  ![patienticon]  | Patient has a FHIR enabled personal application  |
|  Coordinating Platform (CP)  ![cpicon] | CP has a FHIR API   |
|  Community Based Organization (CBO) ![cpicon] | CBO has a FHIR  API   |
{:.grid .center }



#### Annotated Flow Diagram
![Functional Use Case Indirect Referral](FunctionalUseCaseFlowIndirectDirectReferral3.jpg){:.center }

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![patienticon] | Patient takes standardized assessment tool to identify risks | [Survey Instrument Support] |
| 2 | ![providericon]| Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity | &nbsp; |
| 3 | ![providericon], ![patienticon]|  Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list | [Condition][SDOHCC Condition], [SDOHCC Condition] |
| 4 | ![providericon], ![patienticon]|  Provider and patient identify a goal to pursue enrollment in a SNAP program | [Goal][SDOHCC Goal] |
| 5 | ![providericon], ![patienticon]|  Provider and patient agree that a referral to a contracted or non-contracted CBO is an appropriate next step| &nbsp; |
| 6 | ![patienticon] | Patient consents to be referred to the CBO, and to share appropriate information with the CBO | [Consent][SDOHCC Consent], [Service Request][SDOHCC Service Request], [Task][SDOHCC Task For Referral Management] |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application | ??What info?? |
| I1 | ![providericon]| Provider or Care Coordinator creates and sends an electronic referral (and a copy of the consent) to the CP.  Same as 8a in the Direct Referral but the Provider is communicating with the CP instead of the CBO | [Service Request][SDOHCC Service Request], [Task][SDOHCC Task For Referral Management]  |
| I2 | ![cpicon] | CP receives and accepts referral | [Task][SDOHCC Task For Referral Management]  |
| I3 (optional) | ![cpicon], ![patienticon]| CP communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically| ??what info/resources?? |
| I4a | ![cpicon] | CP refers patient to a CBO, with which they have a relationship, to evaluate a patient’s eligibility and help the patient enroll in a SNAP program, if appropriate.
The flow is the same as for the Direct Referral but with the CP acting as a provider system. | [Task][SDOHCC Task For Referral Management], [Procedure][SDOHCC Procedure] |
| I5a | ![cboicon] | CBO receives and accepts the referral | [Task][SDOHCC Task For Referral Management] |
| I6a (optional)| ![cboicon] | CP makes information regarding the referral available to the patient’s application. |  |
| I7 | ![cpicon] | CP updates status of the initial referral | [Task][SDOHCC Task For Referral Management] |
| I8a (optional) | ![cboicon] | CBO communicates with patient via their application to schedule appointments, collect additional information, etc. |  |
| I9a | ![cboicon] | CBO updates the status of the referral to completed, and includes information on what was completed | [Task][SDOHCC Task For Referral Management] |
| I10 | ![cpicon] | CP communicates with the patient via their application to close loop on service(s) delivered by the CBO | [Task][SDOHCC Task For Referral Management] |
| I11 | ![cpicon] | CP uses input from the CBO and Patient to update the status of the referral and includes information on what was completed | [Task][SDOHCC Task For Referral Management] |
| I12 | ![providericon] | Provider receives the updated status | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Survey Instrument Support] |
| 14 | ![providericon] | determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately | [Goal][SDOHCC Goal] |
{:.grid .center  }

###  Indirect Referral with Direct Light CBO
<a name="directreferrallight"></a>

Applies to Providers and Payers as the referral requester, and patient is assessed by a provider and referred to a CP. CP refers to a CBO to deliver the service.

This section differs from the previous in that the interactions between the CP and CBO follow the Direct Light paradigm. The CBO will do a push to the CP. That is, CBOs without their own FHIR server will modify tasks directly on the CP’s FHIR server.

The Provider has a relationship with the CP, but not with the CBO.  The use case assumes that the CP and the CPO have an established relationship.
The Provider may request to have the service delivered by a specific CBO.   The CP may not accept the referral or be unable to perform the requested service, or may need to split the request into multiple tasks to be performed by one or more CBOs.

#### Actors and Assumptions


| Actor    |  Assumption |
| -------- | ---------- |
|  Provider ![providericon]   | Provider has a FHIR API   |
|  Patient  ![patienticon]   | Patient has a FHIR enabled personal application  |
|  Coordinating Platform  (CP) ![cpicon]   | CP has a FHIR API   |
|  Community Based Organization (CBO) ![cboicon]  | CBO has a FHIR enabled application (must do a push to CP)   |
{:.grid .center}


#### Annotated Flow Diagram
[Functional Use Case Indirect Direct Light](FunctionalUseCaseFlowIndirectDirectLightReferral3.jpg){:.center }

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![patienticon] | Patient takes standardized assessment tool to identify risks | [Survey Instrument Support] |
| 2 | ![providericon]| Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity | &nbsp; |
| 3 | ![providericon], ![patienticon]|  Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list | [Condition][SDOHCC Condition], [SDOHCC Condition] |
| 4 | ![providericon], ![patienticon]|  Provider and patient identify a goal to pursue enrollment in a SNAP program | [Goal][SDOHCC Goal] |
| 5 | ![providericon], ![patienticon]|  Provider and patient agree that a referral to a contracted or non-contracted CBO is an appropriate next step| &nbsp; |
| 6 | ![patienticon] | Patient consents to be referred to the CBO, and to share appropriate information with the CBO | [Consent][SDOHCC Consent], [Service Request][SDOHCC Service Request], [Task][SDOHCC Task For Referral Management] |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application | ??What info?? |
| I1 | ![providericon]| Provider or Care Coordinator creates and sends an electronic referral (and a copy of the consent) to the CP.  Same as 8a in the Direct Referral but the Provider is communicating with the CP instead of the CBO | [Service Request][SDOHCC Service Request], [Task][SDOHCC Task For Referral Management]  |
| I2 | ![cpicon] | CP receives and accepts referral | [Task][SDOHCC Task For Referral Management]  |
| I3 (optional) | ![cpicon], ![patienticon]| CP communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically| ??what info/resources?? |
| I4b | ![cpicon] | CP refers patient to a CBO, with which they have a relationship, to evaluate a patient’s eligibility and help the patient enroll in a SNAP program, if appropriate.  The flow is the same as for the Direct Referral but with the CP acting as a provider system. | [Task][SDOHCC Task For Referral Management], [Procedure][SDOHCC Procedure] |
| I5b | ![cboicon] | CBO finds new referral and accepts the referral | [Task][SDOHCC Task For Referral Management] |
| I6a (optional)| ![cpicon] | CP makes information regarding the referral available to the patient’s application. |  |
| I7 | ![cboicon] | CP updates status of the initial referral | [Task][SDOHCC Task For Referral Management] |
| I8b (optional) | ![cboicon] | Optional exchange with Patient does not occur electronically (no app to app exchange) |  |
| I9b | ![cboicon] | CBO updates the status of the referral to completed, and includes information on what was completed | [Task][SDOHCC Task For Referral Management] |
| I10 | ![cpicon] | CP communicates with patient via their application to close loop on service(s) delivered by CBO | [Task][SDOHCC Task For Referral Management] |
| I11 | ![cpicon] | CP uses input from CBO and Patient to update the status of the referral and includes information on what was completed | [Task][SDOHCC Task For Referral Management] |
| I12 | ![providericon] | Provider receives the updated status | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Survey Instrument Support] |
| 14 | ![providericon] | determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately | [Goal][SDOHCC Goal] |
{:.grid .center  }


### Closing the loop with the patient
#### Actors and Assumptions

| Actor    | Assumption |
| ----------  | ------------------ |
|  Provider! [providericon] | Provider has a FHIR API   |
|  Patient |   ![patienticon]   | Patient has a FHIR enabled personal application. Registered with Pr's, CP's, and CBO's FHIR API  |
|  Coordinating Platform (CP) ![cpicon]  | CP has a FHIR API   |
|  Community Based Organization (CBO) ![cboicon]  | CBO has a FHIR enabled application (must do a push to CP)   |
{:.grid}



### Patient Workflow
<a name="patientworkflow"></a>

The table below collects the patient interactions from the use cases described above.

Some limitations on this use case are that the Patient may not have access to an appropriate application or have completed process to register and authenticate with the API(s).
The Patient may not be willing or able to respond to the questionnaires

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application | ??What info?? |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Survey Instrument Support] |
| I3 (optional) | ![cpicon], ![patienticon]| CP communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically| ??what info/resources?? |
| I8a (optional) | ![cboicon] | CBO communicates with patient via their application to schedule appointments, collect additional information, etc. |  |
| I10 | ![cpicon] | CP communicates with patient via their application to close loop on service(s) delivered by CBO | [Task][SDOHCC Task For Referral Management] |
{:.grid .center  }

{% include markdown-link-references.md %}
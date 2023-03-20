This section describeds the interactions between the actors in an SDOH referral starting at a high level, and drilling all the way down to the details of the FHIR API calls, and provides links to the profiles and sections of the IG where more detail is provided.  First a high level overview of the interactions is provided that will abstract technical details.   For example, the mechanism through which the referring provider is informed of the status of the referral could use FHIR Subscriptions or polling (see [Checking Task Status] for details).   Similarly, the relationships between the profiles referenced are not described (see [Data Modeling Framework] ).  Management of task status is not described (see [Checking Task Status]).

The use cases here relate to the Gravity [Patient Stories].  Implementers will benefit from looking at the detailed technical description of the exchange work flow for each use case, as well as the [Capability Statements] associated with each workflow and the [conformance artifacts](artifacts.html) generally.

### General Workflow

This IG supports the following general [workflow](sdoh_clinical_care_scope.html):

1. Assess the patient to determine social risk -- this may be done by using an assessment tool or via a conversation with the patient, or both.  As part of the assessment, the patient and provider agree on the specific risk items that are to be labeled as verified health concerns or problems.
2. The patient and provider may establish specific goals regarding the identified social risk.
3. The patient and provider agree on specific referrals/interventions that should be undertaken to address the problems and goals.  The patient's consent is obtained to share their specific information with the entity that will be performing the services.  The provider then sends a task to the performing entity to initiate the electronic referral.

The figure below shows this high level workflow, along with the actors involved in each step, and the FHIR resources that support each step.

<object data="GeneralWorkflow3.svg" type="image/svg+xml"></object>
<br/>

### Actors and Icons
The actors in the workflows are described in the table below.   The graphical icons are used throughout the IG.   For each use case the assumptions regarding each type of actor will be described.

| Actor    |  Description |
| ----------  | ------------------ |
| ![providericon] Provider  | Includes licensed providers and others that interact with the patient to assess social risk, set goals, and determine/recommend referrals.   |
| ![ccicon]  Care Coordinator (CC)       | A person who organizes various referral activities on behalf of the recipient and communicates information between all those involved in the care delivery.   |
| ![cboicon] Community Based Organization (CBO)  | Public or private not-for-profit resource hubs that provide specific services to the community or targeted population within the community.   |
| ![cpicon]  Coordination Platform (CP) | An intermediary that receives referrals, assesses patient needs, and works with one or more CBOs to deliver the services.   |
| ![patienticon] Patient   | definition consistent with Glossary   |
| ![fhirserver] FHIR Server | A server that supports a FHIR API and can make FHIR API calls on other servers |
| ![fhirapplication] FHIR-enabled Application | An application that can make FHIR API calls to a FHIR server, but does not itself support a FHIR API |
| ![patientapp] FHIR-enabled Patient Application | A patient application that can connect to FHIR servers |
{:.grid}

The figure below shows thesystem to system interactions supported by this implementation guide.  These include:

1. referrals via an intermediary (or indirect referrals) that may include interactions with multiple service performers,
2. direct and direct light (where the interaction is with an application) referrals,
3. interactions with a patient to complete a questionnaire or "form", and
4. interactions with a patient to cancel a service or indicate the outcome of the service

<object data="OverallInteractions.svg" type="image/svg+xml"></object>
<br/>
The workflow and associated exchange patters for these interactions will now be described, first at a high level, and then in detail.

### Overview
The functional use cases in the table below describe the referral process initiated by a provider, or other healthcare actor, and a request referral recipient, both directly and indirectly via an intermediary.   For each use case the capabilities or limitations of the actor are described.   The table links to the functional use case and the associated detailed technical exchange workflow.


| Functional Use Case |  Description           | Actors | Exchange Workflow|
| ------------------------- | ------------------------------------ | ---------------- | ---------------- |
| [Direct Referral](functional_use_cases.html#directreferral) | A referral between a referring entity (e.g., Provider) and a performing entity (e.g., CBO) where both entities have FHIR APIs to facilitate exchange and a referring intermediary (e.g., CP) is not involved in the referral | ![providericon], ![ccicon], ![patienticon], ![cboicon] |   [Direct Referral Exchange Workflow]     |
| [Direct Referral (light)](functional_use_cases.html#directreferrallight) | A “light” version of the Direct Referral with the exception that the performing entity (e.g., CBO) does not have FHIR API capability but has an application that can access the referring entity’s API  | ![providericon], ![patienticon], ![ccicon], ![cboicon]  | [Direct Referral (light) Exchange Workflow]  |
| [Indirect Referral](functional_use_cases.html#indirectreferral) | A referral between a referring entity (e.g., Provider) and a performing entity (e.g., a CBO) that is mediated by a referring intermediary (e.g., a CP) where all entities have FHIR APIs to facilitate exchange  | ![providericon], ![patienticon], ![ccicon], ![cboicon]. ![cpicon] | [Indirect Referral Exchange Workflow]    |
| [Indirect Referral (light)](functional_use_cases.html#indirectreferrallight) | A referral between a referring entity (e.g., Provider) and a performing entity (e.g., a CBO) that is mediated by a referring intermediary (e.g., a CP) where the referring entity and referring intermediary have FHIR APIs, and the performing entity does not have FHIR API capability but has an application that can access the referring entity’s API | ![providericon], ![patienticon], ![ccicon], ![cboicon]. ![cpicon] | [Indirect Referral Light Exchange Workflow]        |
| [Patient Coordination](functional_use_cases.html#patientworkflow)| A patient application may, optionally, communicate directly with any entity that supports a FHIR API and provides a mechanism for secure exchange | ![providericon], ![patienticon], ![ccicon], ![cboicon]  | [Patient Workflow Exchange] |
{:.grid}


### Direct Referral
<a name="directreferral"></a>

In this use case a provider works with a patient using a standardized assessment tool to identify and prioritize social risks and needs, set goals, and obtain consent for referral ( steps 1-6 in diagram below).The patient is then referred to a CBO for help addressing prioritized needs ( steps 8-9) The CBO accepts the referral, provides the requested support to the patient, and shares the updated information with the referring provider.

The Provider and the CBO have FHIR servers.  The Patient has a FHIR-enabled patient application.

The example assumes that the Provider has an existing relationship with the CBO.
The CBO may not accept the referral or be unable to perform the requested service.

{% include img.html img="FunctionalUseCaseFlowDirectReferral3.svg" caption="Figure 1: Annotated Flow Diagram for Direct Referral" %}

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![patienticon] | Patient takes standardized assessment tool to identify social risks and needs |  [SDOHCCTaskForPatient] , [Questionnaire], [QuestionnaireResponse] |
| 2 | ![providericon]| Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity | [SDOHCC Observation Screening REsponse][SDOHCCObservationScreeningResponse] |
| 3 | ![providericon], ![patienticon]|  Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list | [SDOHCC Condition] |
| 4 | ![providericon], ![patienticon]|  Provider and patient identify a goal to pursue enrollment in a SNAP program | [SDOHCC Goal][SDOHCCGoal] |
| 5 | ![providericon], ![patienticon]|  Provider and patient agree that a referral to a CBO is an appropriate next step| &nbsp; |
| 6 | ![patienticon] | Patient consents to be referred to the CBO, and to share appropriate information with the CBO | [SDOHCC Consent][SDOHCCConsent] |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application |  |
| 8 | ![cboicon]| Provider or Care Coordinator creates and sends an electronic referral to the CBO | [SDOHCC Service Request], [SDOHCCTaskForReferral Management]  |
| 9 | ![cboicon] | CBO receives and accepts referral  (task)| [SDOHCC Task For Referral Management]  |
| 10 (optional) | ![cboicon], ![patienticon]| CBO communicates with the patient via their application to schedule appointments, collect additional information, etc.  This communication might not take place electronically.|  |
| 11 | ![cboicon] | CBO completes the evaluation and enrollment, updates the status of the referral (task) to completed, and includes information on what was completed | [SDOHCC Task For Referral Management], [SDOHCC Procedure] |
| 12 | ![providericon] | Provider receives the updated status and updates the status of the referral (service request) | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Survey Instrument Support], [SDOHCC Task For Patient][SDOHCCTaskForPatient], [Questionnaire] |
| 14 | ![providericon] | Provider determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately | [SDOHCC Goal] |
{:.grid}

#### Direct Referral Detailed View
{% include img.html img="DetailedDirectReferral.svg" caption="Figure 2: Detailed Direct Referral" %}

1. Post [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html)
  * Posted Task
  * {% include examplebutton.html example="Post_referral_task" b_title = "Click on Here To See Search Example" %}
2. Post Subscription
  * {% include examplebutton.html example="Post_referral_task" b_title = "Click on Here To See Search Example" %}
3. Get Service Request and Referenced Resources
  * [ServiceRequest](ServiceRequest-SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample.html), [Consent](Consent-SDOHCC-ConsentInformationDisclosureExample.html), [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html)
  * {% include examplebutton.html example="Post_referral_task" b_title = "Click on Here To See Search Example" %}
4. Send Notification
5. Get Task
  * Same as initial task, with status changed
6. Send Notification
7. Get Task
  * Same as initial task, with status changed
8. Send Notification
9. Get Task
  * Same as initial task, with status changed
10. Get Procedures
  * Procedures returned
  * {% include examplebutton.html example="Post_referral_task" b_title = "Click on Here To See Search Example" %}


### Direct Referral Light
In this use case a provider works with a patient using a standardized assessment tool to identify and prioritize social risks and needs (steps 1-3), and then refers the patient to a CBO for help addressing those needs (steps4-9a) a CBO to help address those needs.  The CBO provides the requested support to the patient and the updated information is shared with the referring provider.

The Provider has a FHIR server. The CBO has a FHIR-enabled application.  The Patient has a FHIR-enabled patient application.

Functionally, this use case is the same as the previous use case, except that the CBO has a FHIR-enabled application, but does not support a FHIR API.  As a result, the provider can't push information to the CBO, but rather tha CBO needs to pull information from the provider.    At the conclusion of the referral, the CBO POSTS needed information to the Provider FHIR server (e.g., Procedures) and updates the status and the linked resources of the Task.


{% include img.html img="FunctionalUseCaseFlowDirectLightReferral3.svg" caption="Figure 2: Annotated Flow Diagram for Direct Referral Light" %}

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![patienticon] | Patient takes standardized assessment tool to identify social risks and needs | [Survey Instrument Support] |
| 2 | ![providericon]| Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity | &nbsp; |
| 3 | ![providericon], ![patienticon]|  Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list | [SDOHCC Condition], [SDOHCC Condition] |
| 4 | ![providericon], ![patienticon]|  Provider and patient identify a goal to pursue enrollment in a SNAP program | [SDOHCC Goal] |
| 5 | ![providericon], ![patienticon]|  Provider and patient agree that a referral to a CBO is an appropriate next step| &nbsp; |
| 6 | ![patienticon] | Patient consents to be referred to the CBO, and to share appropriate information with the CBO | [SDOHCC Consent] |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application |  |
| 8b | ![cboicon]| CBO application queries Provider or Care Coordinator API for new or updated referrals | [SDOHCC Service Request], [SDOHCC Task For Referral Management]  |
| 9b | ![cboicon] | CBO finds new referral and accepts the referral | [SDOHCC Task For Referral Management]  |
| 10 (optional) | ![cboicon], ![patienticon]| CBO communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically|  |
| 11 | ![cboicon] | CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed. This will involve POSTing resources such as Procedures to the Provider FHIR server, and making sure they are linked appropriately. | [SDOHCC Task For Referral Management], [SDOHCC Procedure] |
| 12 | ![providericon] | Provider receives the updated status | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Survey Instrument Support] |
| 14 | ![providericon] | determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately | [SDOHCC Goal] |
{:.grid .center  }

#### Direct Referral Light - Detailed View

### Indirect Referral with Direct CBO
<a name="indirectreferral"></a>

In this use case a provider works with a patient using a standardized assessment tool to identify and prioritize social risks and needs, and then refers the patient indirectly via a CP to a CBO for help addressing those needs.  The CP relays the referral to the CBO.  The CBO provides the requested support to the patient and the updated information is relayed back through the CP where it is shared with the referring provider.

Functionally, this indirect referral is essentially two direct referrals (Provider to CP, and CP to CBO) chained together.  The Provider, CP, and CBO all have FHIR servers.  The Patient has a FHIR-enabled application.

The Provider has a relationship with the CP, but not with the CBO.  The use case assumes that the CP and the CPO have an established relationship.
The Provider may request to have the service delivered by a specific CBO.   The CP may not accept the referral or be unable to perform the requested service, or may need to split the request into multiple tasks to be performed by one or more CBOs.

{% include img.html img="FunctionalUseCaseFlowIndirectDirectReferral3.svg" caption="Figure 3: Annotated Flow Diagram for Indirect Referral" %}

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![patienticon] | Patient takes standardized assessment tool to identify social risks and needs | [Survey Instrument Support] |
| 2 | ![providericon]| Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity | &nbsp; |
| 3 | ![providericon], ![patienticon]|  Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list | [SDOHCC Condition], [SDOHCC Condition] |
| 4 | ![providericon], ![patienticon]|  Provider and patient identify a goal to pursue enrollment in a SNAP program | [SDOHCC Goal] |
| 5 | ![providericon], ![patienticon]|  Provider and patient agree that a referral to a CBO is an appropriate next step| &nbsp; |
| 6 | ![patienticon] | Patient consents to be referred to the CBO, and to share appropriate information with the CBO | [SDOHCC Consent] |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application |  |
| I1 | ![providericon]| Provider or Care Coordinator creates and sends an electronic referral (and a copy of the consent) to the CP.  Same as 8a in the Direct Referral but the Provider is communicating with the CP instead of the CBO | [SDOHCC Service Request], [SDOHCC Task For Referral Management]  |
| I2 | ![cpicon] | CP receives and accepts referral | [SDOHCC Task For Referral Management]  |
| I3 (optional) | ![cpicon], ![patienticon]| CP communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically|  |
| I4a | ![cpicon] | CP refers patient to a CBO, with which they have a relationship, to evaluate a patient’s eligibility and help the patient enroll in a SNAP program, if appropriate. The flow is the same as for the Direct Referral but with the CP acting as a provider system. | [SDOHCC Task For Referral Management], [SDOHCC Procedure] |
| I5a | ![cboicon] | CBO receives and accepts the referral | [SDOHCC Task For Referral Management] |
| I6a (optional)| ![cboicon] | CP makes information regarding the referral available to the patient’s application. |  |
| I7 | ![cpicon] | CP updates status of the initial referral | [SDOHCC Task For Referral Management] |
| I8a (optional) | ![cboicon] | CBO communicates with patient via their application to schedule appointments, collect additional information, etc. |  |
| I9a | ![cboicon] | CBO updates the status of the referral to completed, and includes information on what was completed | [SDOHCC Task For Referral Management] |
| I10 | ![cpicon] | CP communicates with the patient via their application to close loop on service(s) delivered by the CBO | [SDOHCC Task For Referral Management] |
| I11 | ![cpicon] | CP uses input from the CBO and Patient to update the status of the referral and includes information on what was completed | [SDOHCC Task For Referral Management] |
| I12 | ![providericon] | Provider receives the updated status | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Survey Instrument Support] |
| 14 | ![providericon] | determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately | [SDOHCC Goal] |
{:.grid .center  }

#### Indirect Referral With Direct CBO - Detailed View

###  Indirect Referral with Direct Light CBO
<a name="directreferrallight"></a>

Applies to Providers and Payers as the referral requester, and patient is assessed by a provider and referred to a CP. CP refers to a CBO to deliver the service. The Provider, CP, and CBO are all equipped with FHIR servers.  The patient is equipped with a FHIR-enabled application.

This section differs from the previous in that the interactions between the CP and CBO follow the Direct Light paradigm. The CBO will do a push to the CP. That is, CBOs without their own FHIR server will modify tasks directly on the CP’s FHIR server.
The Provider and CP have FHIR APIs.  The CBO has a FHIR-enabled application.  The patient has a FHIR-enabled application.

The Provider has a relationship with the CP, but not with the CBO.  The use case assumes that the CP and the CPO have an established relationship.
The Provider may request to have the service delivered by a specific CBO.   The CP may not accept the referral or be unable to perform the requested service, or may need to split the request into multiple tasks to be performed by one or more CBOs.


{% include img.html img="FunctionalUseCaseFlowIndirectDirectLightReferral3.svg" caption="Figure 3: Annotated Flow Diagram for Indirect Referral Light" %}

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![patienticon] | Patient takes standardized assessment tool to identify social risks and needs | [Survey Instrument Support] |
| 2 | ![providericon]| Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity | &nbsp; |
| 3 | ![providericon], ![patienticon]|  Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list |  [SDOHCC Condition] |
| 4 | ![providericon], ![patienticon]|  Provider and patient identify a goal to pursue enrollment in a SNAP program | [SDOHCC Goal] |
| 5 | ![providericon], ![patienticon]|  Provider and patient agree that a referral to a CBO is an appropriate next step| &nbsp; |
| 6 | ![patienticon] | Patient consents to be referred to the CBO, and to share appropriate information with the CBO | [SDOHCC Consent] |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application | |
| I1 | ![providericon]| Provider or Care Coordinator creates and sends an electronic referral (and a copy of the consent) to the CP.  Same as 8a in the Direct Referral but the Provider is communicating with the CP instead of the CBO | [SDOHCC Service Request], [SDOHCC Task For Referral Management]  |
| I2 | ![cpicon] | CP receives and accepts referral | [SDOHCC Task For Referral Management]  |
| I3 (optional) | ![cpicon], ![patienticon]| CP communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically| |
| I4b | ![cboicon] | CBO application queries CP FHIR API for new or updated referrals.  The flow is the same as for the Direct Referral Light but with the CP acting as a provider system. | [SDOHCC Task For Referral Management], [SDOHCC Procedure] |
| I5b | ![cboicon] | CBO finds new referral and accepts the referral | [SDOHCC Task For Referral Management] |
| I6a (optional)| ![cpicon] | CP makes information regarding the referral available to the patient’s application. |  |
| I7 | ![cboicon] | CP updates status of the initial referral | [SDOHCC Task For Referral Management] |
| I8b (optional) | ![cboicon] | Optional exchange with Patient does not occur electronically (no app to app exchange) |  |
| I9b | ![cboicon] | CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed. This will involve POSTing resources such as Procedures to the CP FHIR server, and making sure they are linked appropriately. | [SDOHCC Task For Referral Management] |
| I10 | ![cpicon] | CP communicates with patient via their application to close loop on service(s) delivered by CBO | [SDOHCC Task For Referral Management] |
| I11 | ![cpicon] | CP uses input from CBO and Patient to update the status of the referral and includes information on what was completed | [SDOHCC Task For Referral Management] |
| I12 | ![providericon] | Provider receives the updated status | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Survey Instrument Support] |
| 14 | ![providericon] | determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately | [SDOHCC Goal] |
{:.grid .center  }
#### Indirect Referral With Direct Light CBO - Detailed View

### Patient Workflow
<a name="patientworkflow"></a>

The table below collects the patient interactions from the use cases described above.

Some limitations on this use case are that the Patient may not have access to an appropriate application or have completed process to register and authenticate with the API(s).
The Patient may not be willing or able to respond to the questionnaires.

These interactions use a combination of FHIR-based interactions using [SDOHCCTaskForPatient], [Questionnaire] [Questionnaire Response],[SDOHCC Location] and [SDOHCC HealthCareService] as well as portal-based, phone and in-person interactions.

| Step | Actors | Description| References|
| -----| ------ | ---------- | --------- |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application |  |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application |  |
| I3 (optional) | ![cpicon], ![patienticon] | CP communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically| |
| I8a (optional) | ![cboicon] | CBO communicates with patient via their application to schedule appointments, collect additional information, etc. |  |
| I10 | ![cpicon] | CP communicates with patient via their application to close loop on service(s) delivered by CBO |  |
{:.grid}

{% include markdown-link-references.md %}
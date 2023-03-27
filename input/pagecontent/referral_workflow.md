This section describes the interactions between the actors in an SDOH referral starting at a high level, and drilling down to the details of the FHIR API calls, and provides links to the profiles and sections of the IG where more detail is provided.  First a high-level overview of the interactions is provided that will abstract technical details.   For example, the mechanism through which the referring provider is informed of the status of the referral could use FHIR Subscriptions or polling (see [Checking Task Status] for details).   Similarly, the relationships between the profiles referenced are not described (see [Data Modeling Framework] ).  Management of task status is not described (see [Checking Task Status]).

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

<!-- The figure below shows thesystem to system interactions supported by this implementation guide.  These include:

1. referrals via an intermediary (or indirect referrals) that may include interactions with multiple service performers,
2. direct and direct light (where the interaction is with an application) referrals,
3. interactions with a patient to complete a questionnaire or "form", and
4. interactions with a patient to cancel a service or indicate the outcome of the service

<object data="OverallInteractions.svg" type="image/svg+xml"></object>
<br/>
The workflow and associated exchange patters for these interactions will now be described, first at a high level, and then in detail. -->

### Overview
The functional use cases in the table below describe the referral process initiated by a provider, or other healthcare actor, and a request referral recipient, both directly and indirectly via an intermediary.   For each use case the capabilities or limitations of the actor are described.   The table links to the functional use case and the associated detailed technical exchange workflow.


| Functional Use Case |  Description           | Actors |
| ------------------------- | ------------------------------------ | ---------------- |
| [Direct Referral](referral_workflow.html#directreferral) | A referral between a referring entity (e.g., Provider) and a performing entity (e.g., CBO) where both entities have FHIR APIs to facilitate exchange and a referring intermediary (e.g., CP) is not involved in the referral | ![providericon], ![ccicon], ![patienticon], ![cboicon] |
| [Direct Referral (light)](referral_workflow.html#directreferrallight) | A “light” version of the Direct Referral with the exception that the performing entity (e.g., CBO) does not have FHIR API capability but has an application that can access the referring entity’s API  | ![providericon], ![patienticon], ![ccicon], ![cboicon]  |
| [Indirect Referral](referral_workflow.html#indirectreferral) | A referral between a referring entity (e.g., Provider) and a performing entity (e.g., a CBO) that is mediated by a referring intermediary (e.g., a CP) where all entities have FHIR APIs to facilitate exchange  | ![providericon], ![patienticon], ![ccicon], ![cboicon]. ![cpicon] |
| [Indirect Referral (light)](referral_workflow.html#indirectreferrallight) | A referral between a referring entity (e.g., Provider) and a performing entity (e.g., a CBO) that is mediated by a referring intermediary (e.g., a CP) where the referring entity and referring intermediary have FHIR APIs, and the performing entity does not have FHIR API capability but has an application that can access the referring entity’s API | ![providericon], ![patienticon], ![ccicon], ![cboicon]. ![cpicon] |
| [Patient Coordination](referral_workflow.html#patientcoordinationworkflow)| A patient application may, optionally, communicate directly with any entity that supports a FHIR API and provides a mechanism for secure exchange | ![providericon], ![patienticon], ![ccicon], ![cboicon]  |
{:.grid}


### Direct Referral
<a name="directreferral"></a>

In this use case a provider works with a patient using a standardized assessment tool to identify and prioritize social risks and needs, set goals, and obtain consent for referral ( steps 1-6 in diagram below).The patient is then referred to a CBO for help addressing prioritized needs ( steps 8-9) The CBO accepts the referral, provides the requested support to the patient, and shares the updated information with the referring provider.

The Provider and the CBO have FHIR servers.  The Patient has a FHIR-enabled patient application.

The example assumes that the Provider has an existing relationship with the CBO.
The CBO may not accept the referral or be unable to perform the requested service.

The drawing is followed by a key that describes each labeled interaction.   The section of the drawing focused on the FHIR-based exchanges specified by this IG are highlighted with a blue dashed rectangle.  The details of the FHIR-based exchanges in that box are provided in the [following section](referral_workflow.html#direct-referral-detailed-view).

<object data="FunctionalUseCaseFlowDirectReferral3.svg" type="image/svg+xml"></object>
<br/>


| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![patienticon] | Patient takes standardized assessment tool to identify social risks and needs |  [SDOHCCTaskForPatient] , [Questionnaire], [QuestionnaireResponse] |
| 2 | ![providericon]| Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity | [SDOHCC Observation Screening Response][SDOHCCObservationScreeningResponse] |
| 3 | ![providericon], ![patienticon]|  Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list | [SDOHCC Condition] |
| 4 | ![providericon], ![patienticon]|  Provider and patient identify a goal to pursue enrollment in a SNAP program | [SDOHCC Goal][SDOHCCGoal] |
| 5 | ![providericon], ![patienticon]|  Provider and patient agree that a referral to a CBO is an appropriate next step| &nbsp; |
| 6 | ![patienticon] | Patient consents to be referred to the CBO, and to share appropriate information with the CBO | [SDOHCC Consent][SDOHCCConsent] |
| 7 (optional)| ![providericon] | Provider makes information regarding the referral available to the patient’s application |  |
| 8 | ![cboicon]| Provider or Care Coordinator creates and sends an electronic referral to the CBO | [SDOHCC Service Request], [SDOHCC Task ForReferral Management]  |
| 9 | ![cboicon] | CBO receives and accepts referral  (task)| [SDOHCC Task For Referral Management]  |
| 10 (optional) | ![cboicon], ![patienticon]| CBO communicates with the patient via their application to schedule appointments, collect additional information, etc.  This communication might not take place electronically.|  |
| 11 | ![cboicon] | CBO completes the evaluation and enrollment, updates the status of the referral (task) to completed, and includes information on what was completed | [SDOHCC Task For Referral Management], [SDOHCC Procedure] |
| 12 | ![providericon] | Provider receives the updated status and updates the status of the referral (service request) | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Assessment Instrument Support], [SDOHCC Task For Patient][SDOHCCTaskForPatient], [Questionnaire] |
| 14 | ![providericon] | Provider determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately | [SDOHCC Goal] |
{:.grid}

#### Direct Referral Detailed View
The following figure shows the FHIR exchanges between the referral source and target.
For each numbered exchange, the details of the data elements exchanged, and the FHIR request and response are provided.

{% include img.html img="DetailedDirectReferral.svg" caption="Figure 2: Detailed Direct Referral" %}

| #    | From |  Description | Instances involved | FHIR Transaction |
| ===  | ==== | ============ | ================== | ================ |
| 1 |  Source | Post Referral Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) | [Transaction 1](FHIR_API_Examples.html#post-task-1) |
| 2 |  Source | Post Subscription | [Subscription](broken.html) | [Transaction 2](broken.html) |
| 3 |  Target  | Get Service Request and Referenced Resources | [ServiceRequest](ServiceRequest-SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample.html), [Consent](Consent-SDOHCC-ConsentInformationDisclosureExample.html), [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) | [Transaction 3](FHIR_API_Examples.html#post-task-1) |
| 4 |  Target | Send Notification |  | [Transaction 4](FHIR_API_Examples.html#post-task-1) |
| 5 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 5](FHIR_API_Examples.html#post-task-1) |
| 6 |  Target | Send Notification |  | [Transaction 6](FHIR_API_Examples.html#post-task-1) |
| 7 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 7](FHIR_API_Examples.html#post-task-1) |
| 8 |  Target | Send Notification |  | [Transaction 8](FHIR_API_Examples.html#post-task-1) |
| 9 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 9](FHIR_API_Examples.html#post-task-1) |
| 10 |  Source | Get Procedures | [Food Provided](Procedure-SDOHCC-ProcedureProvisionOfFoodExample.html), [Application Assistance](Procedure-SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample.html) | [Transaction 10](FHIR_API_Examples.html#post-task-1) |
{:.grid}


### Direct Referral Light
In this use case a provider works with a patient using a standardized assessment tool to identify and prioritize social risks and needs (steps 1-3), and then refers the patient to a CBO for help addressing those needs (steps4-9a) a CBO to help address those needs.  The CBO provides the requested support to the patient and the updated information is shared with the referring provider.

The Provider has a FHIR server. The CBO has a FHIR-enabled application.  The Patient has a FHIR-enabled patient application.

Functionally, this use case is the same as the previous use case, except that the CBO has a FHIR-enabled application, but does not support a FHIR API.  As a result, the provider can't push information to the CBO, but rather tha CBO needs to pull information from the provider.    At the conclusion of the referral, the CBO POSTS needed information to the Provider FHIR server (e.g., Procedures) and updates the status and the linked resources of the Task.

The drawing is followed by a key that describes each labeled interaction.   The section of the drawing focused on the FHIR-based exchanges specified by this IG are highlighted with a blue dashed rectangle.  The details of the FHIR-based exchanges in that box are provided in the [following section](referral_workflow.html#direct-referral-detailed-view).

<object data="FunctionalUseCaseFlowDirectLightReferral3.svg" type="image/svg+xml"></object>
<br/>

** ALIGN THESE DEFINITIONS WITH GLOSSARY **

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![patienticon] | Patient takes standardized assessment tool to identify social risks and needs | [Assessment Instrument Support] |
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
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Assessment Instrument Support] |
| 14 | ![providericon] | determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately | [SDOHCC Goal] |
{:.grid .center  }

#### Direct Referral Light - Detailed View
The referral occurs between the Provider/Requester and the CBO/Performer where the CBO/Performer does not have a FHIR API (FHIR Server or FHIR Façade).   The exchange with the Performer is initiated via an email with a secure link to the Provider/Requester API that can be used by an application available to the CBO/Performer to communicate with the Provider/Requester using RESTful exchanges that read, create, and update resources via the Provider/Requester API.

The following figure shows the FHIR exchanges between the referral source and target.
For each numbered exchange, the details of the data elements exchanged, and the FHIR request and response are provided.

{% include img.html img="DetailedDirectReferralLight.svg" caption="Figure 3: Detailed Direct Referral Light" %}

| #    | From |  Description | Instances involved | FHIR Transaction |
| ===  | ==== | ============ | ================== | ================ |
| 1 |  Source | Send e-mail with Secure Link |  | e-mail |
| 2 |  Target | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) | [Transaction 1](FHIR_API_Examples.html#post-task-1) |
| 3 |  Target  | Get Service Request and Referenced Resources | [ServiceRequest](ServiceRequest-SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample.html), [Consent](Consent-SDOHCC-ConsentInformationDisclosureExample.html), [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) | [Transaction 3](FHIR_API_Examples.html#post-task-1) |
| 4 |  Target | Update Task (accepted) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 4](FHIR_API_Examples.html#post-task-1) |
| 5 |  Target | Update Task (in-progress) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 5](FHIR_API_Examples.html#post-task-1) |
| 6 |  Target | Post Procedures | [Food Provided](Procedure-SDOHCC-ProcedureProvisionOfFoodExample.html), [Application Assistance](Procedure-SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample.html) | [Transaction 6](FHIR_API_Examples.html#post-task-1) |
| 7 |  Source | Update Task (completed) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 7](FHIR_API_Examples.html#post-task-1) |
(FHIR_API_Examples.html#post-task-1) |
{:.grid}

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
| 3 | ![providericon], ![patienticon]|  Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list | [SDOHCC Condition] |
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
The referral occurs in two separate interactions. The first is between the Referral Source and the Intermediary and the second is between the Intermediary and the Referral Performer.

This IG assumes that, in an Indirect Referral, the Referral Performer does not have the ability to communicate directly with the Referral Source.  Therefore, the intermediary SHALL support the following.

1. Create a local copy of all of the relevant referenced resources from the Referral Source
2. Create a Task to be Posted to the Referral Performer that references the Referral Source Task via Task.partOf
3. Create a ServiceRequest with ServiceRequest.intent value filler-order and ServiceRequest.basedOn references the original Referral Source ServiceRequest
4. Since local copies of the referenced resources are maintained by the Intermediary, the intermediary must periodically query the Referral Source for updates to the referenced resources
5. There are two version of the [Indirect Referral] -- one where the CBO / Performer has a FHIR API (e.g. [Direct Referral]) and one where the CBO / Performer uses a FHIR enabled application (e.g. [Direct Referral Light])

{% include img.html img="DetailedIndirectReferral.svg" caption="Figure 3: Detailed Indirect Referral" %}

###  Indirect Referral with Direct Light CBO

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

#### Notes on Direct and Indirect Referrals

1. Parties SHOULD use polling if one or both of the parties is unable to support the subscription model (see notes on the [Checking Task Status](checking_task_status.html) page).
2. The receiving party for the referral SHOULD use the batch query process to request periodic updates of reference resources.
3. The above system flows do not define the handling of all possible scenarios. Exchange scenarios may include refusing the referral, canceling the referral by either party, and error conditions that may occur when using RESTful exchanges.  It is up to each party to follow the current best practice in managing the state of the referral.
4. The Provider / Requester SHOULD set the Task.status to "requested" until it receives a valid HTTPS response indicating that the Task was received at which point it SHOULD set the Task.status to "received".

### Patient Coordination Workflow

This implementation guide supports additional interactions with a patient/client application (on a smartphone or portal).  These interactions include providing the patient/client with:

1. Information relating to a specific service referral
  * service requested
  * contact information for the service performer (where the patient/client does not want the service performer to initiate contact)
  * any required patient instructions
2. General information regarding available services (usually as a PDF)
3. Completion of a questionnaire (form) to:
  * assess social risks (risk survey)
  * inform service qualification or application
  * indicate reason for cancellation
  * determine the patient's view their interaction with the CBO/performer and the ability of the service provided to meet their needs
4. the ability to cancel the service
5. the ability to close the loop on services delivered (e.g., providing patient outcomes)


##### Patient Completion of Questionnaire -- Detailed View
Here we provided a detailed view of an interaction between a patient application and a requester (Provider, CBO or CPP) for the completion of a questionnaire.

<object data="PatientQuestionnaire.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved | FHIR Transaction |
| ===  | ==== | ============ | ================== | ================ |
| 1 |  Requester | Send e-mail with Secure Link |  | e-mail |
| 2 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) | [Transaction 1](FHIR_API_Examples.html#post-task-1) |
| 3 |  Patient  | Get Questionnaire | [Questionnaire](Questionnaire-SDOHCC-QuestionnaireHungerVitalSign.html) | [Transaction 3](FHIR_API_Examples.html#post-task-1) |
| 4 |  Patient | Update Task (accepted) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 4](FHIR_API_Examples.html#post-task-1) |
| 5 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 5](FHIR_API_Examples.html#post-task-1) |
| 6 |  Patient | Post Questionnaire Response | [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html) | [Transaction 6](FHIR_API_Examples.html#post-task-1) |
| 7 |  Patient | Update Task (completed and .Output references QuestionnaireResponse) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 7](FHIR_API_Examples.html#post-task-1) |
{:.grid}
{% include markdown-link-references.md %}
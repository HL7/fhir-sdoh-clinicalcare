This section describes the interactions between the actors in an SDOH referral starting both at a high level and at the level of FHIR API calls.   First a high-level overview of the interactions is provided.  This description abstracts technical details and should be accessible to the non-technical reader.  Details on task status updates (see [Checking Task Status] for details), and the relationship between profiles references (see [Data Modeling Framework] ) are omitted for clarity.

The use cases here relate to the Gravity [Patient Stories].  Implementers will benefit from looking at the detailed technical description of the exchange work flow for each use case, as well as the [Capability Statements] associated with each workflow and the [conformance artifacts](artifacts.html) generally.

### General Workflow

This IG supports the following general [workflow](sdoh_clinical_care_scope.html):

1. Assess the patient to determine social risk -- this may be done by using an assessment instrument or via a conversation with the patient, or both.  As part of the assessment, the patient and provider agree on the specific social risks that are to be labeled as verified health concerns or problems.
2. The patient and provider may establish specific goals regarding the identified social risk.
3. The patient and provider agree on specific referrals/interventions that should be undertaken to address the problems and goals.  The patient's consent is obtained to share their specific information with the entity that will be performing the services.  The provider then sends a task to the performing entity to initiate the electronic referral.

The figure below shows this high level workflow, along with the actors involved in each step, and the FHIR resources that support each step.

<object data="GeneralWorkflow3.svg" type="image/svg+xml"></object>
<br/>

### Actors, Systems and Icons
The actors in the workflows are described in the table below.   The graphical icons are used throughout the IG.   For each use case the assumptions regarding each type of actor will be described.

| Actor    |  Description |
| ----------  | ------------------ |
| ![providericon] Provider  | Includes licensed providers and others that interact with the patient to assess social risk, set goals, and determine/recommend referrals.   |
| ![ccicon]  Care Coordinator (CC)       | Coordinates the care and referral activities but normally does not make assessment, goal, or referral decisions.   |
| ![cboicon] Community Based Organization (CBO)  | Public or private not-for-profit resource hubs that provide specific services to the community or targeted population within the community.   |
| ![cpicon]  Coordination Platform (CP) | An intermediary that receives referrals, assesses patient needs, and works with one or more CBOs to deliver the services.   |
| ![patienticon] Patient   | A consumer, or client, who is the subject of the assessment, goals, referrals and services delivered. Use of the term in this IG does not imply a clinical context.   |
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

### Referral Use Cases
The functional use cases in the table below describe the referral process initiated by a provider, or other healthcare actor, and a request referral recipient, both directly and indirectly via an intermediary.   For each use case the capabilities or limitations of the actor are described.   The table links to the functional use case and the associated detailed technical exchange workflow.


| Functional Use Case |  Description           | Actors |
| ------------------------- | ------------------------------------ | ---------------- |
| [Direct Referral](referral_workflow.html#directreferral) | A referral between a referring entity (e.g., Provider) and a performing entity (e.g., CBO) where both entities have FHIR APIs to facilitate exchange and a referring intermediary (e.g., CP) is not involved in the referral | ![providericon], ![ccicon], ![patienticon], ![cboicon] |
| [Direct Referral (light)](referral_workflow.html#directreferrallight) | A “light” version of the Direct Referral with the exception that the performing entity (e.g., CBO) does not have FHIR API capability but has an application that can access the referring entity’s API  | ![providericon], ![patienticon], ![ccicon], ![cboicon]  |
| [Indirect Referral](referral_workflow.html#indirectreferral) | A referral between a referring entity (e.g., Provider) and a performing entity (e.g., a CBO) that is mediated by a referring intermediary (e.g., a CP) where all entities have FHIR APIs to facilitate exchange  | ![providericon], ![patienticon], ![ccicon], ![cboicon]. ![cpicon] |
| [Indirect Referral (light)](referral_workflow.html#indirectreferrallight) | A referral between a referring entity (e.g., Provider) and a performing entity (e.g., a CBO) that is mediated by a referring intermediary (e.g., a CP) where the referring entity and referring intermediary have FHIR APIs, and the performing entity does not have FHIR API capability but has an application that can access the referring entity’s API | ![providericon], ![patienticon], ![ccicon], ![cboicon]. ![cpicon] |
{:.grid}

### Patient Coordination Use Cases
__Need a patient coordination intro, and to refine the Referral Use Cases Intro above__

The [Patient Coordination](referral_workflow.html#patientcoordinationworkflow) includes some, but not all of the interactions with the Patient.  Specifically it contains those interactions where a task is created, whereas some patient interactions could involve the Patient application querying for data, such as Goals or Referral Tasks. In figure 1 below, patient coordination is indicated by a red box on steps 9 and 12.

| Functional Use Case |  Description           | Actors |
| ------------------------- | ------------------------------------ | ---------------- |
| [Patient Coordination](referral_workflow.html#patientcoordinationworkflow)|  A way for a referring party (provider, CBO, CP) to ask a patient to do something and track whether or not they have done it and why, and possibly the outcomes. Patient tasks include requests to out a form, contact a service provider, or review  material. | ![providericon], ![patienticon], ![ccicon], ![cboicon]  |
{:.grid}

### Referral Use Cases
The referral use cases described below are all involve a provider interacting with a patient to assess needs, establish goals, agree to a referral and acquire patient consent, initiate and track the progress of the referral, and update goals.   The use cases are distinguished by the absence or presence of an intermediary, and the FHIR capabilities of the recipient of the referral.

This figure shows this high level context of the referral use cases that are described in the sections that follow.
The two right most columns show data that could be exchanged at that step, and data though is aligned with that step.  This I only specifies the
data that is exchanged, so systems are free to use any internal representation.

{% include img.html img="HighLevelReferralContext.svg" caption="Figure 1: Referral Use Cases Context" %}


<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
	<caption><b>Annotations of Figure 1</b></caption>
<thead>
<tr>
<th>Step</th>
<th>Actors</th>
<th>Description</th>
<th>Exchanged</th>
<th>Aligns With</th>
</tr>
</thead>
<tbody><tr>
<td>1</td>
<td><img src="Patient.png" alt="Patient" width="35" height="35"></td>
<td>Patient takes standardized assessment tool to identify social risks and needs. This could be done via a SMART app that would post a QuestionnaireResponse or via the PatientTask mechanism, but could be manual</td>
<td>none</td>
<td><ul><li>[SDOHCCTaskForPatient]</li><li>[Questionnaire]</li><li>[QuestionnaireResponse]</li></ul></td>
</tr>
<tr>
<td>2</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35"></td>
<td>Provider evaluates assessment and identifies social risks</td>
<td>none</td>
<td><ul><li>[SDOHCC Observation Screening Response]</li><li>[SDOHCCObservationScreeningResponse]</li></ul>  ,</td>
</tr>
<tr>
<td>3</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35">, <img src="Patient.png" alt="Patient" width="35" height="35"></td>
<td>Provider and Patient: <ul><li>prioritize goals</li><li>agree on referral</li><li>capture consent for sharing information</li></ul></td>
<td>none</td>
<td>none</td>
</tr>
<tr>
<td>4</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35"></td>
<td>Provider promotes the health concern to the problem list, records goals, and captures patient consent</td>
<td>none</td>
<td><ul><li>[SDOHCC Condition]</li><li>[SDOHCC Consent][SDOHCCConsent]</li><li>[SDOHCC Goal]</li></ul></td>
</tr>
<tr>
<td>5 (optional)</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35"></td>
<td>Provider makes information regarding the referral, goals and plan available to the patient’s application</td>
<td><ul><li>[SDOHCC Service Request]</li><li>[SDOHCC Location] </li></ul></td>
<td>none</td>
</tr>
<tr>
<td>6</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>Provider or Care Coordinator initiates a referral to the CBO or CP</td>
<td><ul><li>[SDOHCC Service Request]</li><li>[SDOHCC Task For Referral Management] </li></ul></td>
<td>none</td>
</tr>
<tr>
<td>7</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>Recipient (CBO or CP) retrieves information about the referral and any needed supporting information, then makes a decision to accept or reject the referral. If the recipient rejects the referral either the process ends, or it resumes at step #6.</td>
<td><ul><li>[SDOHCC Task For Referral Management]</li><li>[SDOHCC ServiceRequest]</li><li>[SDOHCC Goal]</li><li>[SDOHCC Condition]</li></ul></td>
<td>none</td>
</tr>
<tr>
<td>8</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>Recipient (CBO or CP) updates the status of their work (task) to reflect progress via notes or status.</td>
<td>[SDOHCC Task For Referral Management]</td>
<td>none</td>
</tr>
<tr>
<td>9 (optional)</td>
<td><td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>, <img src="Patient.png" alt="Patient" width="35" height="35"></td>
<td>Recipient (CBO or CP) communicates with the patient via their application to schedule appointments, collect additional information, etc.  This communication might not take place electronically.</td>
<td>none</td>
<td>none</td>
</tr>
<tr>
<td>10</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>Recipient (CBO or CP) completes the completes the requested action, updates the status of their work (task) to completed, and includes information on what was completed</td>
<td><ul><li>[SDOHCC Task For Referral Management]</li><li>[SDOHCC Procedure]</li></ul></td>
<td>missing</td>
</tr>
<tr>
<td>11</td>
<td><img src="Provider.png" alt="Patient" width="35" height="35"></td>
<td>Provider receives the updated status and updates the status of the referral (service request)</td>
<td>[SDOHCC Task For Referral Management]</td>
<td>none</td>
</tr>
<tr>
<td>12 (Optional)</td>
<td><img src="Provider.png" alt="Patient" width="35" height="35"></td>
<td>Provider closes loop by gathering feedback/satisfaction via questionnaire</td>
<td><ul><li>[SDOHCC Task For Patient][SDOHCCTaskForPatient]</li><li>[Questionnaire]</li></ul></td>
<td>missing</td>
</tr>
<tr>
<td>13</td>
<td><img src="Provider.png" alt="Patient" width="35" height="35"></td>
<td>Provider determines if the goals/plan have been satisfied and/or progress has been made on the goal/plan and updates the goal/plan appropriately</td>
<td>none</td>
<td>[SDOHCC Goal]</td>
</tr>
</tbody></table>


#### Direct Referral
<a name="directreferral"></a>

In this use case the patient is referred to a CBO for help addressing prioritized needs. The CBO accepts the referral, provides the requested support to the patient, and shares the updated information with the referring provider.

The Provider and the CBO have FHIR servers.  The Patient may have a FHIR-enabled patient application.

The example assumes that the Provider has an existing relationship with the CBO.
The CBO may not accept the referral or be unable to perform the requested service.

<!-- The drawing is followed by a key that describes each labeled interaction.     -->
The details of the FHIR-based exchanges  are provided in the [following section](referral_workflow.html#direct-referral-detailed-view).

<!-- {% include img.html img="DirectReferralFunctional.svg" caption="Figure 2: Direct Referral" %}


| Step | Actors | Description| Exchanged | Aligns With|
| -----| ------------- | ------- | ---------------- |
| 1 | ![cboicon]| Provider or Care Coordinator creates and sends an electronic referral to the CBO | [SDOHCC Service Request], [SDOHCC Task ForReferral Management]  | |
| 2 | ![cboicon] | CBO receives and accepts referral  (task)| [SDOHCC Task For Referral Management]  | |
| 3 (optional) | ![cboicon], ![patienticon]| CBO communicates with the patient via their application to schedule appointments, collect additional information, etc.  This communication might not take place electronically.|  | |
| 4 | ![cboicon] | CBO completes the evaluation and enrollment, updates the status of the referral (task) to completed, and includes information on what was completed | [SDOHCC Task For Referral Management], [SDOHCC Procedure] | |
{:.grid}
 -->
##### Direct Referral Detailed View
The following figure shows the FHIR exchanges between the referral source and target.
For each numbered exchange, the details of the data elements exchanged, and the FHIR request and response are provided.

{% include img.html img="DetailedDirectReferral.svg" caption="Figure 3: Detailed Direct Referral" %}

| #    | From |  Description | Instances involved | FHIR Transaction |
| ===  | ==== | ============ | ================== | ================ |
| 1 |  Source | Post Referral Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) | [Transaction 1](FHIR_API_Examples.html#post-task-1) |
| 2 |  Target  | Get Service Request and Referenced Resources | [ServiceRequest](ServiceRequest-SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample.html), [Consent](Consent-SDOHCC-ConsentInformationDisclosureExample.html), [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) | [Transaction 3](FHIR_API_Examples.html#post-task-1) |
| 3 |  Target | Send Notification | [Subscription Notification Bundle] | [Transaction 4](FHIR_API_Examples.html#post-task-1) |
| 4 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 5](FHIR_API_Examples.html#post-task-1) |
| 5 |  Target | Send Notification | [Subscription Notification Bundle] | [Transaction 6](FHIR_API_Examples.html#post-task-1) |
| 6 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 7](FHIR_API_Examples.html#post-task-1) |
| 7 |  Target | Send Notification | [Subscription Notification Bundle] | [Transaction 8](FHIR_API_Examples.html#post-task-1) |
| 8 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 9](FHIR_API_Examples.html#post-task-1) |
| 9 |  Source | Get Procedures | [Food Provided](Procedure-SDOHCC-ProcedureProvisionOfFoodExample.html), [Application Assistance](Procedure-SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample.html) | [Transaction 10](FHIR_API_Examples.html#post-task-1) |
{:.grid}


### Direct Referral Light
In this use case a provider works with a patient using a standardized assessment instrument to identify and prioritize social risks and needs, and then refers the patient to a CBO for help addressing those needs.  The CBO provides the requested support to the patient and the updated information is shared with the referring provider.

The Provider has a FHIR server. The CBO has a FHIR-enabled application.  The Patient has a FHIR-enabled patient application.

Functionally, this use case is the same as the previous use case, except that the CBO has a FHIR-enabled application, but does not support a FHIR API.  As a result, the provider can't push information to the CBO, but rather tha CBO needs to pull information from the provider.    At the conclusion of the referral, the CBO POSTS needed information to the Provider FHIR server (e.g., Procedures) and updates the status and the linked resources of the Task.

<!-- The drawing is followed by a key that describes each labeled interaction.      -->
The details of the FHIR-based exchanges in that box are provided in the [following section](referral_workflow.html#direct-referral-detailed-view).

<!-- {% include img.html img="DirectLightReferralFunctional.svg" caption="Figure 4: Direct Light Referral" %}

| Step | Actors | Description| Exchanged | Aligns With|
| -----| ------------- | ------- | ---------------- |
| 1 | ![cboicon]| CBO application queries Provider or Care Coordinator API for new or updated referrals | [SDOHCC Service Request], [SDOHCC Task For Referral Management]  | |
| 2 | ![cboicon] | CBO finds new referral and accepts the referral | [SDOHCC Task For Referral Management]  |
| 3 (optional) | ![cboicon], ![patienticon]| CBO communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically|  |
| 4 | ![cboicon] | CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed. This will involve POSTing resources such as Procedures to the Provider FHIR server, and making sure they are linked appropriately. | [SDOHCC Task For Referral Management], [SDOHCC Procedure] |
{:.grid} -->

##### Direct Referral Light - Detailed View
The referral occurs between the Provider/Requester and the CBO/Performer where the CBO/Performer does not have a FHIR API (FHIR Server or FHIR Façade).   The exchange with the Performer is initiated via an email with a ~~secure link to the Provider/Requester API that can be used by an application available~~ link to an application and instructions for authentication with the application.  This application can be used by the CBO/Performer to communicate with the Provider/Requester using RESTful exchanges that read, create, and update resources via the Provider/Requester API.

The following figure shows the FHIR exchanges between the referral source and target.
For each numbered exchange, the details of the data elements exchanged, and the FHIR request and response are provided.

{% include img.html img="DetailedDirectReferralLight.svg" caption="Figure 3: Detailed Direct Referral Light" %}

| #    | From |  Description | Instances involved | FHIR Transaction |
| ===  | ==== | ============ | ================== | ================ |
| 1 |  Source | Send e-mail with link to application and authentication instructions |  | e-mail |
| 2 |  Target | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) | [Transaction 1](FHIR_API_Examples.html#post-task-1) |
| 3 |  Target  | Get Service Request and Referenced Resources | [ServiceRequest](ServiceRequest-SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample.html), [Consent](Consent-SDOHCC-ConsentInformationDisclosureExample.html), [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) | [Transaction 3](FHIR_API_Examples.html#post-task-1) |
| 4 |  Target | Update Task (accepted) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 4](FHIR_API_Examples.html#post-task-1) |
| 5 |  Target | Update Task (in-progress) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 5](FHIR_API_Examples.html#post-task-1) |
| 6 |  Target | Post Procedures | [Food Provided](Procedure-SDOHCC-ProcedureProvisionOfFoodExample.html), [Application Assistance](Procedure-SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample.html) | [Transaction 6](FHIR_API_Examples.html#post-task-1) |
| 7 |  Source | Update Task (completed) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 7](FHIR_API_Examples.html#post-task-1) |
(FHIR_API_Examples.html#post-task-1) |
{:.grid}

#### Indirect Referral with Direct CBO
<a name="indirectreferral"></a>

In this use case a provider works with a patient using a standardized assessment instrument to identify and prioritize social risks and needs, and then refers the patient indirectly via a CP to a CBO for help addressing those needs.  The CP relays the referral to the CBO.  The CBO provides the requested support to the patient and the updated information is relayed back through the CP where it is shared with the referring provider.

Functionally, this indirect referral is essentially two direct referrals (Provider to CP, and CP to CBO) chained together.  The Provider, CP, and CBO all have FHIR servers.  The Patient has a FHIR-enabled application.

The Provider has a relationship with the CP, but not with the CBO.  The use case assumes that the CP and the CPO have an established relationship.
The Provider may request to have the service delivered by a specific CBO.   The CP may not accept the referral or be unable to perform the requested service, or may need to split the request into multiple tasks to be performed by one or more CBOs.

<!-- {% include img.html img="FlowIndirectDirectReferralFunctional.svg" caption="Figure 5: Indirect Referral with Direct CBO" %}

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![providericon]| Provider or Care Coordinator creates and sends an electronic referral (and a copy of the consent) to the CP.  Same as step 1 in the Direct Referral but the Provider is communicating with the CP instead of the CBO | [SDOHCC Service Request], [SDOHCC Task For Referral Management]  |
| 2 | ![cpicon] | CP receives and accepts referral | [SDOHCC Task For Referral Management]  |
| 3 (optional) | ![cpicon], ![patienticon]| CP communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically|  |
| 4 | ![cpicon] | CP refers patient to a CBO, with which they have a relationship, to evaluate a patient’s eligibility and help the patient enroll in a SNAP program, if appropriate. The flow is the same as for the Direct Referral but with the CP acting as a provider system. | [SDOHCC Task For Referral Management], [SDOHCC Procedure] |
| 5 | ![cboicon] | CBO receives and accepts the referral | [SDOHCC Task For Referral Management] |
| 6 (optional)| ![cboicon] | CP makes information regarding the referral available to the patient’s application. |  |
| 7 | ![cpicon] | CP updates status of the initial referral | [SDOHCC Task For Referral Management] |
| 8 (optional) | ![cboicon] | CBO communicates with patient via their application to schedule appointments, collect additional information, etc. |  |
| 9 | ![cboicon] | CBO updates the status of the referral to completed, and includes information on what was completed | [SDOHCC Task For Referral Management] |
| 10 | ![cpicon] | CP communicates with the patient via their application to close loop on service(s) delivered by the CBO | [SDOHCC Task For Referral Management] |
| 11 | ![cpicon] | CP uses input from the CBO and Patient to update the status of the referral and includes information on what was completed | [SDOHCC Task For Referral Management] |
| 12 | ![providericon] | Provider receives the updated status | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Survey Instrument Support] |
{:.grid .center  }
 -->
##### Indirect Referral With Direct CBO - Detailed View
The referral occurs in two separate interactions. The first is between the Referral Source and the Intermediary and the second is between the Intermediary and the Referral Performer.

This IG assumes that, in an Indirect Referral, the Referral Performer does not have the ability to communicate directly with the Referral Source.  Therefore, the intermediary SHALL support the following.

1. Create a local copy of all of the relevant referenced resources from the Referral Source
2. Create a Task to be Posted to the Referral Performer that references the Referral Source Task via Task.partOf
3. Create a ServiceRequest with ServiceRequest.intent value filler-order and ServiceRequest.basedOn references the original Referral Source ServiceRequest
4. Since local copies of the referenced resources are maintained by the Intermediary, the intermediary must periodically query the Referral Source for updates to the referenced resources
5. There are two version of the [Indirect Referral] -- one where the CBO / Performer has a FHIR API (e.g. [Direct Referral]) and one where the CBO / Performer uses a FHIR enabled application (e.g. [Direct Referral Light])

{% include img.html img="DetailedIndirectReferral.svg" caption="Figure 3: Detailed Indirect Referral" %}

####  Indirect Referral with Direct Light CBO

Applies to Providers and Payers as the referral requester, and patient is assessed by a provider and referred to a CP. CP refers to a CBO to deliver the service. The Provider, CP, and CBO are all equipped with FHIR servers.  The patient is equipped with a FHIR-enabled application.

This section differs from the previous in that the interactions between the CP and CBO follow the Direct Light paradigm. The CBO will do a push to the CP. That is, CBOs without their own FHIR server will modify tasks directly on the CP’s FHIR server.
The Provider and CP have FHIR APIs.  The CBO has a FHIR-enabled application.  The patient has a FHIR-enabled application.

The Provider has a relationship with the CP, but not with the CBO.  The use case assumes that the CP and the CPO have an established relationship.
The Provider may request to have the service delivered by a specific CBO.   The CP may not accept the referral or be unable to perform the requested service, or may need to split the request into multiple tasks to be performed by one or more CBOs.


{% include img.html img="FlowIndirectDirectLightReferralFunctional.svg" caption="Figure 3: Annotated Flow Diagram for Indirect Referral Light" %}

| Step | Actors | Description| References|
| -----| ------------- | ------- | ---------------- |
| 1 | ![providericon]| Provider or Care Coordinator creates and sends an electronic referral (and a copy of the consent) to the CP.  Same as 1 in the Direct Referral but the Provider is communicating with the CP instead of the CBO | [SDOHCC Service Request], [SDOHCC Task For Referral Management]  |
| 2 | ![cpicon] | CP receives and accepts referral | [SDOHCC Task For Referral Management]  |
| 3 (optional) | ![cpicon], ![patienticon]| CP communicates with the patient via their application to schedule appointments, collect additional information, etc. This exchange might not occur electronically| |
| 4 | ![cboicon] | CBO application queries CP FHIR API for new or updated referrals.  The flow is the same as for the Direct Referral Light but with the CP acting as a provider system. | [SDOHCC Task For Referral Management], [SDOHCC Procedure] |
| 5 | ![cboicon] | CBO finds new referral and accepts the referral | [SDOHCC Task For Referral Management] |
| 6 (optional)| ![cpicon] | CP makes information regarding the referral available to the patient’s application. |  |
| 7 | ![cboicon] | CP updates status of the initial referral | [SDOHCC Task For Referral Management] |
| 8 (optional) | ![cboicon] | Optional exchange with Patient does not occur electronically (no app to app exchange) |  |
| 9 | ![cboicon] | CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed. This will involve POSTing resources such as Procedures to the CP FHIR server, and making sure they are linked appropriately. | [SDOHCC Task For Referral Management] |
| 10 | ![cpicon] | CP communicates with patient via their application to close loop on service(s) delivered by CBO | [SDOHCC Task For Referral Management] |
| 11 | ![cpicon] | CP uses input from CBO and Patient to update the status of the referral and includes information on what was completed | [SDOHCC Task For Referral Management] |
| 12 | ![providericon] | Provider receives the updated status | [Checking Task Status] |
| 13 (Optional) | ![providericon] | Provider closes loop with patient via questionnaire available to a patient’s application | [Assessment Instrument Support] |
{:.grid .center  }

#### Notes on Direct and Indirect Referrals

1. Parties SHOULD use polling if one or both of the parties is unable to support the subscription model (see notes on the [Checking Task Status](checking_task_status.html) page).
2. The receiving party for the referral SHOULD use the batch query process to request periodic updates of reference resources.
3. The above system flows do not define the handling of all possible scenarios. Exchange scenarios may include refusing the referral, canceling the referral by either party, and error conditions that may occur when using RESTful exchanges.  It is up to each party to follow the current best practice in managing the state of the referral.
4. The Provider/Requester SHOULD set the Task.status to "requested" until it receives a valid HTTPS response indicating that the Task was received at which point it SHOULD set the Task.status to "received".

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
4. the ability to close the loop on services delivered (e.g., providing patient outcomes)


##### Patient Completion of Questionnaire -- Detailed View
Here we provided a detailed view of an interaction between a patient application and a requester (Provider, CBO or CPP) for the completion of a questionnaire.

<object data="PatientQuestionnaire.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved | FHIR Transaction |
| ===  | ==== | ============ | ================== | ================ |
| 1 |  Requester | Send e-mail with link to an application and instructions for authentication with the application |  | e-mail |
| 2 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) | [Transaction 1](FHIR_API_Examples.html#post-task-1) |
| 3 |  Patient  | Get Questionnaire | [Questionnaire](Questionnaire-SDOHCC-QuestionnaireHungerVitalSign.html) | [Transaction 3](FHIR_API_Examples.html#post-task-1) |
| 4 |  Patient | Update Task (accepted) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 4](FHIR_API_Examples.html#post-task-1) |
| 5 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 5](FHIR_API_Examples.html#post-task-1) |
| 6 |  Patient | Post Questionnaire Response | [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html) | [Transaction 6](FHIR_API_Examples.html#post-task-1) |
| 7 |  Patient | Update Task (completed and .Output references QuestionnaireResponse) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed | [Transaction 7](FHIR_API_Examples.html#post-task-1) |
{:.grid}

{% include markdown-link-references.md %}
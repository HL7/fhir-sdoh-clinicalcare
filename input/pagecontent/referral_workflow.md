This section describes the interactions between the actors in an SDOH referral starting both at a high-level and at the level of FHIR API calls.   First a high-level overview of the interactions is provided.  This description abstracts technical details and should be accessible to the non-technical reader.
For the sake of simplicity, only relationships critical to the Referral Workflow are provided. (For additional details on task status updates see [Checking Task Status], and  on relationships between profiles see [Data Modeling Framework].)

The use cases here relate to the Gravity [Patient Stories].  Implementers will benefit from looking at the detailed technical description of the exchange work flow for each use case, as well as the [Capability Statements] associated with each workflow and the [conformance artifacts](artifacts.html) generally.

### General Workflow

This IG supports the following general [workflow](sdoh_clinical_care_scope.html):

1. Assess the patient to determine social risk -- this may be done by using an assessment instrument, via a conversation with the patient, or both.  As part of the assessment, the patient and provider agree on the specific social risks that are to be labeled as verified health concerns or problems.
2. The patient and provider may establish goals regarding the identified social risk.
3. The patient and provider agree on referrals/interventions that should be undertaken to address the problems and goals.  The patient's consent is obtained to share their specific information with the entity that will be performing the services.  The provider then sends a task to the performing entity to initiate the electronic referral.

The figure below shows this high-level workflow, the actors involved in each step, and the FHIR resources that support each step.

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
| ![patienticon] Patient   | A consumer, or client, who is the subject of the assessment, goals, referrals and services delivered. Use of the term in this IG does not necessarily imply a clinical context.   |
| ![fhirserver] FHIR Server | A server that supports a FHIR API and can make FHIR API calls to other servers |
| ![fhirapplication] FHIR-enabled Application | An application that can make FHIR API calls to a FHIR server, but does not itself support a FHIR API |
| ![patientapp] FHIR-enabled Patient Application | A patient application that can connect to FHIR servers |
{:.grid}

### Referral Use Cases
The functional use cases in the table below describe the referral process initiated by a provider, or other healthcare actor, to a referral recipient, both directly and indirectly via an intermediary.   For each use case the capabilities or limitations of the actor are described.   The table links to the functional use case and the associated detailed technical exchange workflow.

| Functional Use Case |  Description           | Actors |
| ------------------------- | ------------------------------------ | ---------------- |
| [Direct Referral](referral_workflow.html#directreferral) | A referral between a referring entity (e.g., provider) and a performing entity (e.g., CBO) where both entities have FHIR APIs to facilitate exchange and a referring intermediary (e.g., CP) is not involved in the referral | ![providericon], ![ccicon], ![patienticon], ![cboicon] |
| [Direct Referral (light)](referral_workflow.html#direct-referral-light) | A “light” version of the Direct Referral with the exception that the performing entity (e.g., CBO) does not have FHIR API capability but has an application that can access the referring entity’s API  | ![providericon], ![patienticon], ![ccicon], ![cboicon]  |
| [Indirect Referral](referral_workflow.html#indirectreferral) | A referral between a referring entity (e.g., provider) and a performing entity (e.g., a CBO) that is mediated by a referring intermediary (e.g., a CP) where all entities have FHIR APIs to facilitate exchange  | ![providericon], ![patienticon], ![ccicon], ![cboicon]. ![cpicon] |
| [Indirect Referral (light)](referral_workflow.html#indirect-referral-with-direct-light-cbo) | A referral between a referring entity (e.g., provider) and a performing entity (e.g., a CBO) that is mediated by a referring intermediary (e.g., a CP) where the referring entity and referring intermediary have FHIR APIs, and the performing entity does not have FHIR API capability but has an application that can access the referring entity’s API | ![providericon], ![patienticon], ![ccicon], ![cboicon]. ![cpicon] |
{:.grid}


#### Referral Use Case Overview
The referral use cases described below all involve a provider interacting with a patient to assess needs, establish goals, agree to a referral and acquire patient consent, initiate and track the progress of the referral, and update goals.   The "direct" and "indirect" use cases are distinguished by the absence or presence of an intermediary, and the FHIR capabilities of the recipient of the referral.

This figure shows the high-level context of the referral use cases that are described in the sections that follow.
The two right-most columns show data that could be exchanged at that step, and data though is aligned with that step.  This only specifies the
data that is exchanged, so systems are free to use any internal representation.

The [Patient Coordination](referral_workflow.html#patient-coordination-workflow) includes some, but not all the interactions with the patient.  It provides a way for a referral sources, CPs, and CBOs to ask a patient to do something and track whether or not they have done it and why, and possibly the outcomes. In figure 1 below, patient coordination is indicated by a red box on steps 9 and 12.

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
<td><ul>
<li><a href="StructureDefinition-SDOHCC-TaskForPatient.html">SDOHCC Task For Patient</a></li>
<li><a href="https://www.hl7.org/fhir/questionnaire.html">Questionnaire</a></li>
<li><a href="https://www.hl7.org/fhir/questionnaireresponse.html">QuestionnareResponse</a></li></ul></td>
<td>none</td>
</tr>
<tr>
<td>2</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35"></td>
<td>Provider evaluates assessment and identifies social risks</td>
<td>none</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-ObservationScreeningResponse.html">SDOHCC Observation Screening Response</a></li>
        <li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Condition</a></li></ul></td>
</tr>
<tr>
<td>3</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35">, <img src="Patient.png" alt="Patient" width="35" height="35"></td>
<td>Provider and Patient: <ul>
                          <li>agree on Conditions to add to Problem List</li>
                          <li>prioritize goals</li>
                          <li>agree on referral</li>
                          <li>obtain consent for sharing information</li>
                          </ul></td>
<td>none</td>
<td>none</td>
</tr>
<tr>
<td>4</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35"></td>
<td>Provider promotes the health concern to the problem list, records goals, and captures patient consent</td>
<td>none</td>
<td><ul>
<li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Observation Screening Response</a></li>
<li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Condition</a></li>
<li><a href="StructureDefinition-SDOHCC-Consent.html">SDOHCC Consent</a></li>
<li><a href="StructureDefinition-SDOHCC-Goal.html">SDOHCC Goal</a></li></ul></td>
</tr>
<tr>
<td>5 (optional)</td>
<td><img src="Provider.png" alt="Provider" width="35" height="35"></td>
<td>Provider makes information regarding the referral, goals and plan available to the patient’s application</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a></li><li><a href="StructureDefinition-SDOHCC-Location.html">SDOHCC Location</a> </li></ul></td>
<td>none</td>
</tr>
<tr>
<td>6</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>Provider or Care Coordinator initiates a referral to the CBO or CP</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a></li><li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task for Referral Management</a> </li></ul></td>
<td>none</td>
</tr>
<tr>
<td>7</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>Recipient (CBO or CP) retrieves information about the referral and any needed supporting information, then decides to accept or reject the referral. If the recipient rejects the referral either the process ends, or it resumes at step #6.</td>
<td><ul>
<li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task for Referral Management</a></li>
<li><a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a></li>
<li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Condition</a></li>
<li><a href="StructureDefinition-SDOHCC-Goal.html">SDOHCC Goal</a></li>
<li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Observation Screening Response</a></li>
</ul></td>
<td>none</td>
</tr>
<tr>
<td>8</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>Recipient (CBO or CP) updates the status of their work (task) to reflect progress via notes or status.</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task for Referral Management</a></li></ul></td>
<td>none</td>
</tr>
<tr>
<td>9 (optional)</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35">, <img src="Patient.png" alt="Patient" width="35" height="35"></td>
<td>Recipient (CBO or CP) communicates with the patient via their application to schedule appointments, collect additional information, etc.  This IG doesn't highlight communication outside of electronic means, but such communication is always possible.</td>
<td>none</td>
<td>none</td>
</tr>
<tr>
<td>10</td>
<td><img src="CBO.png" alt="CBO" width="35" height="35"> or <img src="CoordinationPlatform.png" alt="CP" width="35" height="35"></td>
<td>Recipient (CBO or CP) completes the requested action, updates the status of their work (task) to completed, and includes information on what was completed</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC ServiceRequest</a></li><li><a href="StructureDefinition-SDOHCC-Procedure.html">SDOHCC Procedure</a></li></ul></td>
<td>missing</td>
</tr>
<tr>
<td>11</td>
<td><img src="Provider.png" alt="Patient" width="35" height="35"></td>
<td>Provider receives the updated status and updates the status of the referral (service request)</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task for Referral Management</a></li></ul></td>
<td>none</td>
</tr>
<tr>
<td>12 (Optional)</td>
<td><img src="Provider.png" alt="Patient" width="35" height="35"></td>
<td>Provider closes loop by gathering feedback/satisfaction via questionnaire</td>
<td><ul>
<li><a href="StructureDefinition-SDOHCC-TaskForPatient.html">SDOHCCTaskForPatient</a></li>
<li><a href="https://www.hl7.org/fhir/questionnaire.html">Questionnaire</a></li></ul></td>
<td>missing</td>
</tr>
<tr>
<td>13</td>
<td><img src="Provider.png" alt="Patient" width="35" height="35"></td>
<td>Provider determines if the goals/plan have been satisfied and/or progress has been made on the goal/plan and updates the goal/plan appropriately</td>
<td>none</td>
<td><ul><li><a href="StructureDefinition-SDOHCC-Goal.html">SDOHCC Goal</a></li></ul></td>
</tr>
</tbody></table>


#### Direct Referral
<a name="directreferral"></a>

In this use case the patient is referred to a CBO for help addressing prioritized needs. The CBO accepts the referral, provides the requested support to the patient, and shares the updated information with the referring provider.

The provider and the CBO have FHIR servers.  The patient may have a FHIR-enabled patient application.

The example assumes that the provider has an existing relationship with the CBO.
The CBO may not accept the referral or be unable to perform the requested service.

The details of the FHIR-based exchanges  are provided in the [following section](referral_workflow.html#direct-referral-detailed-view).

##### Direct Referral Detailed View
The following figure shows the FHIR exchanges between the referral source and target.
For each numbered exchange, the details of the data elements exchanged, and the FHIR request and response are provided.

{% include img.html img="DetailedDirectReferral.svg" caption="Figure 3: Detailed Direct Referral" %}

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Source | Post Referral Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) |
| 2 |  Target  | Get Service Request and Referenced Resources | [ServiceRequest](ServiceRequest-SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample.html), [Consent](Consent-SDOHCC-ConsentInformationDisclosureExample.html), [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) |
| 3 |  Target | Send Notification | [Subscription Notification Bundle] |
| 4 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 5 |  Target | Send Notification | [Subscription Notification Bundle] |
| 6 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 7 |  Target | Send Notification | [Subscription Notification Bundle] |
| 8 |  Source | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 9 |  Source | Get Procedures | [Food Provided](Procedure-SDOHCC-ProcedureProvisionOfFoodExample.html), [Application Assistance](Procedure-SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample.html) |
{:.grid}


#### Direct Referral Light
In this use case, a provider works with a patient using a standardized assessment instrument to identify and prioritize social risks and needs, and then refers the patient to a CBO for help addressing those needs.  The CBO provides the requested support to the patient and the updated information is shared with the referring provider.

The provider has a FHIR server. The CBO has a FHIR-enabled application.  The patient has a FHIR-enabled patient application.

Functionally, this use case is the same as the previous use case, except that the CBO has a FHIR-enabled application, but does not support a FHIR API.  As a result, the provider can't push information to the CBO, but rather the CBO needs to pull information from the provider.    At the conclusion of the referral, the CBO POSTS needed information (e.g., Procedures) to the provider FHIR server and updates the status and the linked resources of the Task.

The details of the FHIR-based exchanges in that box are provided in the [following section](referral_workflow.html#direct-referral-detailed-view).

##### Direct Referral Light - Detailed View
The referral occurs between the provider/Requester and the CBO/Performer where the CBO/Performer does not have a FHIR API (FHIR Server or FHIR Façade).   The exchange with the Performer is initiated via an email with a link to an application and instructions for authentication with the application.  This application can be used by the CBO/Performer to communicate with the provider/Requester using RESTful exchanges that read, create, and update resources via the provider/Requester API.

The following figure shows the FHIR exchanges between the referral source and target.
For each numbered exchange, the details of the data elements exchanged, and the FHIR request and response are provided.

{% include img.html img="DetailedDirectReferralLight.svg" caption="Figure 3: Detailed Direct Referral Light" %}

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Source | Send e-mail with link to application and authentication instructions |
| 2 |  Target | Get Task | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) |
| 3 |  Target  | Get Service Request and Referenced Resources | [ServiceRequest](ServiceRequest-SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample.html), [Consent](Consent-SDOHCC-ConsentInformationDisclosureExample.html), [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) |
| 4 |  Target | Update Task (accepted) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 5 |  Target | Update Task (in-progress) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 6 |  Target | Post Procedures | [Food Provided](Procedure-SDOHCC-ProcedureProvisionOfFoodExample.html), [Application Assistance](Procedure-SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample.html) |
| 7 |  Source | Update Task (completed) | [Referral Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
(FHIR_API_Examples.html#post-task-1) |
{:.grid}

#### Indirect Referral with Direct CBO
<a name="indirectreferral"></a>

In this use case, a provider works with a patient using a standardized assessment instrument to identify and prioritize social risks and needs, and then refers the patient indirectly via a CP to a CBO for help addressing those needs.  The CP relays the referral to the CBO.  The CBO provides the requested support to the patient and the updated information is relayed back through the CP where it is shared with the referring provider.

Functionally, this indirect referral is essentially two direct referrals (provider to CP, and CP to CBO) chained together.  The provider, CP, and CBO all have FHIR servers.  The patient has a FHIR-enabled application.

The provider has a relationship with the CP, but not with the CBO.  The use case assumes that the CP and the CPO have an established relationship.
The provider may request to have the service delivered by a specific CBO.   The CP may not accept the referral or be unable to perform the requested service, or may need to split the request into multiple tasks to be performed by one or more CBOs.

##### Indirect Referral With Direct CBO - Detailed View
The referral occurs in two separate interactions. The first is between the Referral Source and the intermediary and the second is between the intermediary and the Referral Performer.

This IG assumes that, in an Indirect Referral, the Referral Performer does not have the ability to communicate directly with the Referral Source.  Therefore, the intermediary SHALL support the following.

1. Create a local copy of all of the relevant referenced resources from the Referral Source
2. Create a Task to be Posted to the Referral Performer that references the Referral Source Task via Task.partOf
3. Create a ServiceRequest with ServiceRequest.intent value filler-order and ServiceRequest.basedOn references the original Referral Source ServiceRequest
4. Since local copies of the referenced resources are maintained by the intermediary, the intermediary must periodically query the Referral Source for updates to the referenced resources
5. There are two versions of the [Indirect Referral] -- one where the CBO / Performer has a FHIR API (e.g. [Direct Referral]) and one where the CBO / Performer uses a FHIR enabled application (e.g. [Direct Referral Light])

{% include img.html img="DetailedIndirectReferral.svg" caption="Figure 3: Detailed Indirect Referral" %}

####  Indirect Referral with Direct Light CBO

Applies to providers and Payers as the referral requester, and patient is assessed by a provider and referred to a CP. CP refers to a CBO to deliver the service. The provider, CP, and CBO are all equipped with FHIR servers.  The patient is equipped with a FHIR-enabled application.

This section differs from the previous in that the interactions between the CP and CBO follow the Direct Light paradigm. The CBO will do a push to the CP. That is, CBOs without their own FHIR server will modify tasks directly on the CP’s FHIR server.
The provider and CP have FHIR APIs.  The CBO has a FHIR-enabled application.  The patient has a FHIR-enabled application.

The provider has a relationship with the CP, but not with the CBO.  The use case assumes that the CP and the CPO have an established relationship.
The provider may request to have the service delivered by a specific CBO.   The CP may not accept the referral or be unable to perform the requested service, or may need to split the request into multiple tasks to be performed by one or more CBOs.

##### Indirect Referral With Direct Light CBO - Detailed View
{% include img.html img="DetailedIndirectReferralLight.svg" caption="Figure 3: Detailed Indirect Referral Light" %}

#### Notes on Direct and Indirect Referrals

1. Parties SHOULD use polling if one or both of the parties is unable to support the subscription model (see notes on the [Checking Task Status](checking_task_status.html) page).
2. The receiving party for the referral SHOULD use the batch query process to request periodic updates of reference resources.
3. The above system flows do not define the handling of all possible scenarios. Exchange scenarios may include refusing the referral, canceling the referral by either party, and error conditions that may occur when using RESTful exchanges.  It is up to each party to follow the current best practice in managing the state of the referral.
4. The provider/Requester SHOULD set the Task.status to "requested" until it receives a valid HTTPS response indicating that the Task was received at which point it SHOULD set the Task.status to "received".

### Patient Coordination Workflow


| Functional Use Case       |  Description                         | Actors           |
| ------------------------- | ------------------------------------ | ---------------- |
| [Complete Questionnaire](referral_workflow.html#complete-questionnaire)|  Referring party (provider, CBO, CP) asks a patient to complete a questionnaire.  This functionality can be used to assess social risks, inform service qualification or application, indicate reasons for cancellation, or determine the patient's view their interaction with the CBO/performer and the ability of the service provided to meet their needs. | ![providericon], ![patienticon], ![ccicon], ![cboicon]  |
| [General Information Request](referral_workflow.html#general-information-request)| Referring party (provider, CBO, CP) sends a patient a free text question and receives a free text response.  | ![providericon], ![patienticon], ![ccicon], ![cboicon]  |
| [Make Contact Directions](referral_workflow.html#make-contact-directions)|  Referring party (provider, CBO, CP) provides contact information for the service performer (where the patient/client does not want the service performer to initiate contact). | ![providericon], ![patienticon], ![ccicon], ![cboicon]  |
| [Review Material](referral_workflow.html#review-material)|  Referring party (provider, CBO, CP) requests that the patient review a document, usually as a PDF. | ![providericon], ![patienticon], ![ccicon], ![cboicon]  |
{:.grid}

In the examples below, it is assumed that the patient has been equipped with the patient application, and authenticated communication between the patient application and the requester has already been established.
See [Connecting Applications with API Data Sources](connecting_applications_with_api_data_sources.html#patientclient-applications) for more details.  The referenced data instances are all in their completed state. In practice, they would move through the state transitions indicated, with the requester initializing their inputs fields, and the patient completing the output fields, and updating the status.

#### Complete Questionnaire
Here we provide a detailed view of an interaction between a patient application and a requester (provider, CBO or CPP) for the completion of a questionnaire.

<object data="PatientQuestionnaire.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientRiskQuestionnaireCompletedExample.html) |
| 2 |  Patient  | Get Questionnaire, Questionnaire PDF, or Questionnaire URL | [Questionnaire](Questionnaire-SDOHCC-QuestionnaireHungerVitalSign.html) |
| 3 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskPatientRiskQuestionnaireCompletedExample.html) with status changed |
| 4 |  Patient | Post Questionnaire Response | [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html) |
| 5 |  Patient | Update Task (completed and .Output references QuestionnaireResponse) | [Patient Task](Task-SDOHCC-TaskPatientRiskQuestionnaireCompletedExample.html) with status changed |
{:.grid}

#### General Information Request
Here we provide a detailed view of an interaction between a patient application and a requester (provider, CBO or CPP) for a general information request.

<object data="PatientInformation.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) |
| 2 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
| 3 |  Patient | Update Task (completed and .Output.value includes text of response) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
{:.grid}

#### Make Contact Directions
Here we provide a detailed view of an interaction between a patient application and a requester (provider, CBO or CPP) for providing contact directions.

<object data="PatientContact.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) |
| 2 |  Patient  | Get Contact | [HealthCareService](HealthcareService-SDOHCC-HealthcareServiceTelecomAppointmentExample.html) |
| 3 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample.html) with status changed |
| 4 |  Patient | Update Task (completed and .Output includes chosen contact) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
{:.grid}

#### Review Material
Here we provide a detailed view of an interaction between a patient application and a requester (provider, CBO or CPP) for providing review materials.

<object data="PatientReview.svg" type="image/svg+xml"></object>
<br>

| #    | From |  Description | Instances involved |
| ---  | ---- | ------------ | ------------------ |
| 1 |  Patient | Get Task | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) |
| 2 |  Patient  | Get DocumentReference | [DocumentReference] |
| 3 |  Patient | Update Task (in-progress) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
| 4 |  Patient | Update Task (completed ) | [Patient Task](Task-SDOHCC-TaskPatientMakeAppointmentCompletedExample.html) with status changed |
{:.grid}



{% include markdown-link-references.md %}
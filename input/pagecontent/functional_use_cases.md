The following acronyms are used:
- Community Based Organization (CBO) -- organizations that deliver requested social services (e.g. food pantry)
- Coordination Platform (CP) -- an intermediary that receives referrals, assesses patient needs, and works with one or more CBOs to deliver the services

The following numbering is used throughout this section where N is an integer number:

- N (e.g. 1-14) are steps common to all functional use cases
- IN (e.g. I1, I12) are additional steps used only by Indirect use cases
- INa (e.g. I8a, I9a) are steps used by the Indirect use case when communicating with a FHIR API enabled CBO
- INb (e.g. I8b, I9b) are steps used by the Indirect use case when communicating with a FHIR application enabled CBO

### Patient Stories and Workflow
SDOH IG related Patient Stories are available on the Gravity Project Confluence site [here](https://confluence.hl7.org/display/GRAV/Patient+Stories).

These use cases are represented by workflow diagrams on the [Exchange Workflow Page](exchange_workflow.html) with figures that refer to the FHIR Resources used. Implementers will also benefit from reviewing the [server capability](artifacts.html#capability-statements) statements for each specific workflow, and the [conformance artifacts](artifacts.html) generally.

### Overview
The exchange interactions below give guidance on the process to ‘close the loop’ between a provider, or other healthcare actor, who makes a request (referral) for SDOH services and the request recipient (referral recipient, with various FHIR enabled capabilities and configurations as described below). In FHIR the request (referral) is provided as a combination of <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a>/<a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a>.  Included below, is guidance on how the IG is implemented to enable back and forth communication. This does not replace reviewing the FHIR artifacts (such as Capability Statements, Resource profiles, and value sets) and narrative guidance found elsewhere in this guide.

The functional use cases defined below are based on specific exchanges of information between the relevant actors. These use cases include:

- A direct referral between a requesting entity and a performing entity where both entities have FHIR APIs to facilitate the exchanges
- A "light" version of the direct referral where the performing entity uses an application that can access the referring entities' API (but does not have FHIR API capability)
- An indirect referral, where the communication between the referring entity and the performing entity is through an intermediary (such as a Coordination Platform as defined below) that has FHIR API capability
- Finally, a patient application may optionally communicate directly with any of the entities that support a FHIR API and provide a mechanism for secure exchange

### Actors

- Provider -- includes licensed providers and others that interact with the patient to assess social risk, set goals, and determine/recommend referrals
- Care Coordinator -- coordinates the care and referral activities but normally does not make assessment, goal, or referral decisions
- Patient -- a consumer, or client, who is the subject of the assessment, goals, referrals and services delivered
- Community Based Organization (CBO) -- organizations that deliver requested social services (e.g. food pantry)
- Coordination Platform (CP) -- an intermediary that receives referrals, assesses patient needs, and works with one or more CBOs to deliver the services

### Business Associates

- CBOs and CPs are not covered entities under HIPAA.  (Covered entities only include Providers, Payers, and Clearing Houses)
- However, a CBO and/or CP may be a Business Associate (BA) of a covered entity.  This requires a Business Associate Agreement (BAA) between the covered entity and the BA.
- Entities covered under a BAA may be able to receive Protected Health Information (PHI) as part of the agreement without consent of the patient.  However, they are required to observe the same limitations as covered entities with regard the protection and disclosure of PHI.
- Typically, a BAA is required by a covered entity to avoid disclosure of PHI by non-covered entities and, in particular, in situations where clinical information is shared to help manage the needs of the patient  (e.g., if the patient is diabetic and therefore has specific dietary constraints)
- For a covered entity or business associate to share PHI with an entity that is not a covered entity or does not have a BAA, consent of the patient is generally required (there are specific exceptions allowed by HIPAA)


### Direct Referral (Pull by Provider from CBO, involving [FHIR Subscription Resource](checking_task_status.html#subscription))

Applies to Providers, Payers and CPs as the referral requester

Patient assessed by Provider and referred to CBO to deliver the service

#### Actors

- Provider / Care Coordinator
- Patient
- Community Based Organization (CBO)

#### Assumptions

- Provider has a FHIR API
- Patient has a FHIR enabled personal application
- CBO has a FHIR API

#### Provider Actions

&nbsp;&nbsp;&nbsp;&nbsp;1 Patient takes standardized assessment tool to identify risks

<p style="margin: 0 0 10px 50px; width: 95%;">
See <a href="survey_instrument_support.html#survey-instrument-support">Survey Instrument Support</a> for FHIR guidance
</p>

&nbsp;&nbsp;&nbsp;&nbsp;2 Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity

&nbsp;&nbsp;&nbsp;&nbsp;3 Provider and patient decide to address the Food Insecurity first – Provider promotes the health concern to the problem list

<p style="margin: 0 0 10px 50px; width: 95%;">
FHIR Condition Resource is used to capture the problem list. The SDOHCC Condition profile is here: <a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Condition</a></p>

&nbsp;&nbsp;&nbsp;&nbsp;4 Provider and patient identify a goal to pursue enrollment in a SNAP program

<p style="margin: 0 0 10px 50px; width: 95%;">
Communicated with <a href="StructureDefinition-SDOHCC-Goal.html">SDOHCC Goal</a>
</p>

&nbsp;&nbsp;&nbsp;&nbsp;5 Provider and patient agree that a referral to a contracted or non-contracted CBO is an appropriate next step

&nbsp;&nbsp;&nbsp;&nbsp;6 Patient consents to be referred to the CBO, and to share appropriate information with the CBO

<p style="margin: 0 0 10px 50px; width: 95%;">
<a href="StructureDefinition-SDOHCC-Consent.html">SDOHCC Consent</a> could be used as a record of the consent on the FHIR server
</p>
<p style="
    margin: 0 0 10px 50px;
    width: 95%;
">
Important: The provider's system creates a <a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a> and <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a>, which is associated with the SDOHCC ServiceRequest through the <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">Task.focus</a> data element
</p>

&nbsp;&nbsp;&nbsp;&nbsp;7 Optional: Provider makes information regarding the referral available to the patient's application

#### Provider – CBO Actions

&nbsp;&nbsp;&nbsp;&nbsp;8a Provider or Care Coordinator creates and sends an electronic referral to the CBO

<p style="margin: 0 0 10px 50px; width: 95%;">
See <a href="exchange_workflow.html#workflow-diagram">exchange workflow</a>. In the Direct Referral, after creating a <a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a> and <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a>, and posting them to the CBO's FHIR server, the provider's system also creates a Subscription on the CBO's FHIR server (see <a href="checking_task_status.html#subscription">checking_task_status.html#subscription</a> and especially <a href="checking_task_status.html#task-topic">Task topic</a>). Task is associated with the SDOHCC ServiceRequest through the <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">Task.focus</a> data element. Importantly, the Task is the means to communicate from the CBO to the provider that work is being done or is done (once created by provider, it is modified by the CBO). The SDOHCC ServiceRequest is a receipt of service and can contain additional information for the CBO through its various fields such as the supporting document field. The Task is where the CBO communicates back to the provider. For example, Task.input field is where the CBO can communicate information the CBO used to complete the task. Finally, the provider may also include a <a href="StructureDefinition-SDOHCC-TaskForPatient.html">SDOHCC Task For Patient</a> indicating actions for the patient to take or an assessment (questionnaire) to fill out
</p>

&nbsp;&nbsp;&nbsp;&nbsp;9a CBO receives and accepts referral

<p style="margin: 0 0 10px 50px; width: 95%;">
The subscription set-up in 8a means that the CBO can update the Task locally and a notification is sent to provider (See <a href="checking_task_status.html">checking task status</a> for details.). Locally, the CBO updates the SDOHCC Task For Referral Management <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">status</a> from <a href="https://hl7.org/fhir/R4/codesystem-task-status.html#task-status-requested">requested</a> to ‘accepted’. When work commences, the SDOHCC Task For Referral Management status is updated using the FHIR API to ‘in progress’
</p>

<p style="margin: 0 0 10px 50px; width: 95%;">
There is the possibility that a further referral is made by the CBO to a separate CBO. This can be communicated by creating a new <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a> instance that references the initial <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a> and the <a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a> through <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">partOf:SupportedPartOf</a> and <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">basedOn:SupportedBasedOn</a>, respectively. The new Task instance is a child Task. We would appreciate feedback on any use of this paradigm.
</p>

#### CBO Actions

&nbsp;&nbsp;&nbsp;&nbsp;10 Optional: CBO communicates with the patient via their application to schedule appointments, collect additional information, etc.

&nbsp;&nbsp;&nbsp;&nbsp;11 CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed

<p style="margin: 0 0 10px 50px; width: 95%;">
To indicate completion, the following are performed by the CBO: Any procedures performed by the CBO are indicated by creating a <a href="StructureDefinition-SDOHCC-Procedure.html">SDOHCC Procedure</a> using the POST method of the FHIR API (i.e. CREATE through the FHIR API) on the CBO FHIR server. The procedure is connected to the service request thru referencing the <a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a> instance from the <a href="StructureDefinition-SDOHCC-Procedure.html">SDOHCC Procedure</a> instance. Also, the relevant <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a> should refer to the <a href="StructureDefinition-SDOHCC-Procedure.html">SDOHCC Procedure</a> through the relevant <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">Task.output</a> field. The SDOHCC Task For Referral Management <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">Task.status</a> is updated to <a href="https://hl7.org/fhir/R4/codesystem-task-status.html#task-status-completed">completed</a>.
</p>

#### Provider Actions

&nbsp;&nbsp;&nbsp;&nbsp;12 Provider receives the updated status

<p style="margin: 0 0 10px 50px; width: 95%;">
See <a href="checking_task_status.html">checking task status</a> for guidance. As the CBO has a FHIR server, the Provider will receive a notification through the subscription mechanism and then pull the <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a> and any related actions taken <a href="StructureDefinition-SDOHCC-Procedure.html">(SDOHCC Procedure)</a> from the CBO's FHIR server
</p>

&nbsp;&nbsp;&nbsp;&nbsp;13 Optional: Provider closes loop with patient via questionnaire available to a patient's application

<p style="margin: 0 0 10px 50px; width: 95%;">
See <a href="survey_instrument_support.html#survey-instrument-support">Survey Instrument Support</a> for FHIR guidance.
</p>

&nbsp;&nbsp;&nbsp;&nbsp;14 Provider determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately

<p style="margin: 0 0 10px 50px; width: 95%;">
See <a href="StructureDefinition-SDOHCC-Goal.html">SDOHCC Goal FHIR profile</a> and 'achievementStatus'
</p>

#### Considerations

- CBOs are typically not BAs of covered entities and therefore not bound by HIPAA's privacy and security requirements
- Provider may not have a relationship CBO
- CBO may not accept the referral or be unable to perform the requested service
- Closing the loop via patient reported outcomes

<table><tr><td><img src="FunctionalUseCaseFlowDirectReferral3.jpg" /></td></tr></table>

### Direct Referral Light (Push by CBO to Provider, involving <a href="checking_task_status.html#polling">Polling</a>)

Same as the Direct Referral workflow above with the following exceptions noted below:

#### Actors (same as Direct Referral)

CBO has an application that can interact with a FHIR API but does not have a FHIR server

#### Assumptions

- Provider has a FHIR API
- Patient has a FHIR enabled personal application
- CBO has a FHIR enabled application but not a FHIR API

#### Provider Actions (same as Direct Referral)

- steps 1 through 7
<p style="margin: 0 0 10px 50px; width: 95%;">
Note from 6: The provider's system creates a <a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a> and <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a>. The Task is associated with the SDOHCC ServiceRequest through the <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">Task.focus</a> data element.
</p>

#### CBO - Provider Actions (changed based on CBO application vs FHIR API)

&nbsp;&nbsp;&nbsp;&nbsp;8b. CBO application queries Provider or Care Coordinator API for new or updated referrals

<p style="margin: 0 0 10px 50px; width: 95%;">
See <a href="exchange_workflow.html#direct-referral-light">direct referral light exchange workflow</a>. The query occurs after receiving electronic communication that there is a referral. The CBO application queries the Provider or Care Coordinator FHIR API for new or updated referrals. Alternatively, in the absence of electronic notification, the CBO could monitor for new Tasks and ServiceRequests using polling (for guidance on polling see <a href="checking_task_status.html#polling">Polling</a>).
</p>

<p style="margin: 0 0 10px 50px; width: 95%;">
While polling can be efficient, if a provider sends a secure link with a specific Task and ServiceRequest to fulfill, the CBO (Referral Recipient) system can perform queries by id on the provider's server using the FHIR API (using the FHIR <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">Task id</a> and <a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest Resource instance id</a>). Using the HTTPS GET method with the FHIR Resource type and id, one can directly find a specific instance, whether the id was provided directly by the provider's system or the id of the instance was previously pulled using polling. Additionally, a generic request for all the Resources of a type can be performed. Provider's server must implement the option to limit the returned Resource instances by date (see appropriate <a href="artifacts.html#capability-statements">CapabilityStatement</a>).
</p>

<p style="margin: 0 0 10px 50px; width: 95%;">
Also, as in 8a, Task is associated with the SDOHCC ServiceRequest through <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">Task.focus</a>. Importantly, the Task is the means to communicate from the CBO to the provider that work is being done or is done (once created by provider, it is modified by the CBO). The SDOHCC ServiceRequest is a receipt of service and can contain additional information for the CBO through its various fields such as the supporting document field. The Task is where the CBO communicates back to the provider. For example, the Task.input field is where the CBO can communicate information used to complete the task. Finally, the provider may also include a <a href="StructureDefinition-SDOHCC-TaskForPatient.html">SDOHCC Task For Patient</a> indicating actions for the patient to take or a assessment (questionnaire) to fill out.
</p>

&nbsp;&nbsp;&nbsp;&nbsp;9b CBO finds new referral and accepts the referral

<p style="margin: 0 0 10px 50px; width: 95%;">
The CBO updates the SDOHCC Task For Referral Management <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">status</a> from <a href="https://hl7.org/fhir/R4/codesystem-task-status.html#task-status-requested">requested</a> to ‘accepted’. When work commences, the SDOHCC Task For Referral Management status is updated using the FHIR API to ‘in progress’
</p>

<p style="margin: 0 0 10px 50px; width: 95%;">
There is the possibility that a further referral was made by the CBO to a separate CBO. For a CBO without a FHIR server, this can be communicated by sending (i.e. CREATE method of the FHIR API) a new child <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a> instance that references the initial <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a>/<a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a> through <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">partOf:SupportedPartOf</a> and <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">basedOn:SupportedBasedOn</a> respectively. This is done using the POST method to the provider's server. We would appreciate feedback on any use of this paradigm.
</p>

#### CBO Actions

&nbsp;&nbsp;&nbsp;&nbsp;10 Optional exchange with Patient might not occur electronically

&nbsp;&nbsp;&nbsp;&nbsp;11 CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed

<p style="margin: 0 0 10px 50px; width: 95%;">
To indicate completion via the FHIR API, the following are performed by the CBO: Any procedures performed by the CBO are indicated by sending a <a href="StructureDefinition-SDOHCC-Procedure.html">SDOHCC Procedure</a> to the referral source server using the POST method of the FHIR API (i.e. CREATE through the FHIR API). The procedure can be connected to the service request thru referencing the <a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a> instance from the <a href="StructureDefinition-SDOHCC-Procedure.html">SDOHCC Procedure</a> instance. Also, the relevant <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a> should refer to the <a href="StructureDefinition-SDOHCC-Procedure.html">SDOHCC Procedure</a> through the relevant <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">Task.output</a> field. The SDOHCC Task For Referral Management <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">Task.status</a> is updated using the FHIR API to <a href="https://hl7.org/fhir/R4/codesystem-task-status.html#task-status-completed">completed</a>.
</p>

#### Provider Actions (same as Direct Referral)

- steps 12 through 14
- step 12 will be through direct modification on the provider's server of the Task by the CBO, rather than through use of subscription notification.

#### Considerations (same as Direct Referral)

- CBOs are typically not BAs of covered entities and therefore not bound by HIPAA's privacy and security requirements
- Provider may not have a relationship CBO
- CBO may not accept the referral or be unable to perform the requested service
- Closing the loop via patient reported outcomes

<table><tr><td><img src="FunctionalUseCaseFlowDirectLightReferral3.jpg" /></td></tr></table>


### Indirect Referral with Direct CBO

Applies to Providers and Payers as the referral requester

Patient is assessed by a provider and referred to a CP. CP refers to a CBO to deliver the service.

In the Indirect Referral with Direct CBO, each system has a FHIR server. Thus, the interactions will be highly similar to the Direct process described above. The Provider will use subscription on the CP's FHIR server, and the CP will use subscription on the CBO's FHIR server. See [capability statements](artifacts.html#capability-statements) for server behavior requirements.

See [exchange workflow](exchange_workflow.html#workflow-diagram-2)

#### Actors

- Provider / Care Coordinator
- Patient
- CP
- CBO

#### Assumptions

- Provider has a FHIR API
- Patient has a FHIR enabled persona application
- CP has a FHIR API
- CBO has a FHIR API

#### Provider Actions (same as Direct Referral)

- steps 1 through 7

#### Provider – CP – CBO workflow

&nbsp;&nbsp;&nbsp;&nbsp;I1 Provider or Care Coordinator creates and sends an electronic referral (and a copy of the consent) to the CP
<p style="margin: 0 0 10px 50px; width: 95%;">
Same as 8a in the Direct Referral but the Provider is communicating with the CP's FHIR server instead of a CBO's FHIR server
</p>
<p style="margin: 0 0 10px 50px; width: 95%;">
See <a href="exchange_workflow.html#workflow-diagram-2">exchange workflow</a>
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I2 CP receives and accepts referral
<p style="margin: 0 0 10px 50px; width: 95%;">
CP is replacing the CBO in 9a. The CP is the entity communicating with the provider's server, and it is on the CP's server that the provider creates a Subscription instance
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I3 Optional: CP communicates with patient via their application to schedule appointments, collect additional information, etc.

&nbsp;&nbsp;&nbsp;&nbsp;I4a CP refers patient to a CBO, with which they have a relationship, to evaluate a patient’s eligibility and help the patient enroll in a SNAP program, if appropriate

<p style="margin: 0 0 10px 50px; width: 95%;">
The flow is the same as for the Direct Referral but with the CP acting as a provider system
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I5a CBO receives and accepts the referral

&nbsp;&nbsp;&nbsp;&nbsp;I6a Optional: CP makes information regarding the referral available to the patient's application

&nbsp;&nbsp;&nbsp;&nbsp;I7 CP updates status of the initial referral

<p style="margin: 0 0 10px 50px; width: 95%;">
CP updates the original Task. This should trigger a subscription notification to the provider's system
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I8a Optional: CBO communicates with patient via their application to schedule appointments, collect additional information, etc.

&nbsp;&nbsp;&nbsp;&nbsp;I9a CBO updates the status of the referral to completed, and includes information on what was completed

<p style="margin: 0 0 10px 50px; width: 95%;">
Similar to 11. However, here this is done on the CBO's FHIR server, so the CP will receive a subscription notification of actions on the CBO's FHIR server.
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I10 Optional: CP communicates with the patient via their application to close loop on service(s) delivered by the CBO

&nbsp;&nbsp;&nbsp;&nbsp;I11 CP uses input from the CBO and Patient to update the status of the referral and includes information on what was completed

<p style="margin: 0 0 10px 50px; width: 95%;">
The CP modifications will trigger a notification to Provider. If the CBO creates child Task instances, the child tasks will reference the initial <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task For Referral Management</a>/<a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a> through <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">partOf:SupportedPartOf</a> and <a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">basedOn:SupportedBasedOn</a>, respectively. It may be relevant for the CP to communicate child Tasks as additional information to the Provider. This is enabled by the tools in this guide but communicating child Tasks is currently left as a business decision. We would appreciate feedback on any use of this paradigm.
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I12 Provider receives the updated status

<p style="margin: 0 0 10px 50px; width: 95%;">
Provider receives a subscription notification when the CP updates the Task on the CP's FHIR server
</p>

#### Provider Actions (same as Direct Referral)

- steps 13 and 14

#### Considerations in addition to Direct Referral

- CP may not be a BA of the covered entity and therefore not bound by HIPAA's privacy and security requirements
- CP may not have a formal relationship with a CBO
- Provider may request to have the service delivered by a specific CBO
- CP may not accept the referral or be unable to perform the requested service
- CP may need to split the request into multiple tasks to be performed by more than one CBO

<table><tr><td><img src="FunctionalUseCaseFlowIndirectDirectReferral3.jpg" /></td></tr></table>

### Indirect Referral with Direct Light CBO
<a name="indirectreferrallight">

### Indirect Referral with Direct Light CBO

Applies to Providers and Payers as the referral requester, and patient is assessed by a provider and referred to a CP. CP refers to a CBO to deliver the service.

This section differs from the previous in that the interactions between the CP and CBO follow the Direct Light paradigm. The CBO will do a push to the CP. That is, CBOs without their own FHIR server will modify tasks directly on the CP's FHIR server.

#### Actors

- Provider / Care Coordinator
- Patient
- Coordination Platform (CP)
- Community Based Organization (CBO)

#### Assumptions

- Provider has a FHIR API
- Patient has a FHIR enabled persona application
- CP has a FHIR API
- CBO has a FHIR enabled application
- Applications cannot talk to each other

#### Provider Actions (same as Direct Referral)

- steps 1 through 7

#### Provider – CP – CBO workflow (note: steps with a "b" suffix are specific to this referral)

&nbsp;&nbsp;&nbsp;&nbsp;I1 Provider or Care Coordinator creates and sends an electronic referral (and a copy of the consent) to the CP

&nbsp;&nbsp;&nbsp;&nbsp;I2 CP receives and accepts referral

&nbsp;&nbsp;&nbsp;&nbsp;I3 Optional: CP communicates with patient via their application to schedule appointments, collect additional information, etc.

&nbsp;&nbsp;&nbsp;&nbsp;I4b CBO application queries CP for new or updated referrals

<p style="margin: 0 0 10px 50px; width: 95%;">
Similar to 8b in the Direct Light above, but here the CBO is interacting with the CP's FHIR server, rather than directly with the provider's server
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I5b CBO finds new referral and accepts the referral

<p style="margin: 0 0 10px 50px; width: 95%;">
Similar to 9b in the Direct Light above, but here the CBO is interacting with the CP's FHIR server rather than directly with the provider's server
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I6a Optional: CP makes information regarding the referral available to the patient's application

&nbsp;&nbsp;&nbsp;&nbsp;I7 CP updates status of the initial referral (no change)

<p style="margin: 0 0 10px 50px; width: 95%;">
As in the previous, the interactions between the CP and the provider's FHIR server are mediated through the Direct paradigm that is subscription notification driven. However, as the CBO has directly modified the referral on the CP FHIR server, there may be no need for the CP to do anything more. In other words, if the CBO modifies the Task instance which the Provider placed on the CP's FHIR server, and to which the Provider subscribed, then the provider's system will receive a subscription notification when the CBO modifies the Task!
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I8b Optional exchange with Patient does not occur electronically (no app to app exchange)

&nbsp;&nbsp;&nbsp;&nbsp;I9b CBO updates the status of the referral to  <a href="https://hl7.org/fhir/R4/codesystem-task-status.html#task-status-completed">completed<a/>, and includes information on what was completed

<p style="margin: 0 0 10px 50px; width: 95%;">
As in 11, CBO completes the evaluation and enrollment, but this time on the CP's FHIR server
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I10 Optional: CP communicates with patient via their application to close loop on service(s) delivered by CBO

&nbsp;&nbsp;&nbsp;&nbsp;I11 CP uses input from CBO and Patient to update the status of the referral and includes information on what was completed

<p style="margin: 0 0 10px 50px; width: 95%;">
This step may benefit from the CBO directly modifying the Task provided by the CP's system
</p>

&nbsp;&nbsp;&nbsp;&nbsp;I12 Provider receives the updated status

#### Provider Actions (same as Direct Referral)

- steps 13 and 14

#### Considerations (same as Indirect Referral with Direct CBO)

- CP may not be a BA of the covered entity and therefore not bound by HIPAA's privacy and security requirements
- CP may not have a formal relationship with a CBO
- Provider may request to have the service delivered by a specific CBO
- CP may not accept the referral or be unable to perform the requested service
- CP may need to split the request into multiple tasks to be performed by more than one CBO

<table><tr><td><img src="FunctionalUseCaseFlowIndirectDirectLightReferral3.jpg" /></td></tr></table>

### Closing the loop with the patient

The following applies to Providers, Payers, CPs and CPOs and assumes patient is using a personal application (e.g., Smart Phone application) that has already been registered and authenticated with the provider's EHR API, the CP's API and the CBO's API.

Of course, there other set-ups which are determined by business requirements. However, to standardize interactions, this IG uses the [SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html) for actions for the patient, and instructions for using [FHIR Questionnaire](survey_instrument_support.html). The questionnaires can be used for both process feedback and information accrual. For help with the FHIR Resources to use please see [exchange_workflow.html#patient-interactions](exchange_workflow.html#patient-interactions).

#### Actors

- Provider / Care Coordinator
- Patient
- CP
- CBO (FHIR API)

#### Patient Workflow (from above functional use cases)

All exchanges are optional. For additional workflow guidance the [Exchange Workflow page](https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/exchange_workflow.html#patient-interactions) may be useful.

- Provider - Patient optional initial exchange with patient

&nbsp;&nbsp;&nbsp;&nbsp;7 Provider makes information regarding the referral available to the patient's application

- CP - Patient Indirect Referral optional exchange with a patient

&nbsp;&nbsp;&nbsp;&nbsp;I3 CP communicates with patient via their application to schedule appointments, collect additional information, etc.

- CBO - Patient (assumes CBO has FHIR API) optional interaction with patient

&nbsp;&nbsp;&nbsp;&nbsp;I8a CBO communicates with patient via their application to schedule appointments, collect additional information, etc.

- CP - Patient in the Indirect Referral, optional closing of the loop

&nbsp;&nbsp;&nbsp;&nbsp;I10 CP communicates with the patient via their application to close loop on service(s) delivered by the CBO

- Provider - Patient in the Indirect Referral optional closing of the loop

&nbsp;&nbsp;&nbsp;&nbsp;13 Provider closes loop with patient via questionnaire available to a patient's application

#### Considerations

- Patient may not have an appropriate application or completed process to register and authenticate with the API(s)
- Patient may not be willing or able to respond to the questionnaires

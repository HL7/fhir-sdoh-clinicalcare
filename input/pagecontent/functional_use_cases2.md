The following acronyms are used:
- Community Based Organization (CBO) -- organizations that deliver social requested services (e.g. food pantry)
- Coordination Platform (CP) -- an intermediary that receives referrals, assesses patient needs, and works with one or more CBOs to deliver the services

The following numbering is use throughout this section where N is an integer number:

- N (e.g. 1-14) are steps common to all functional use cases
- IN (e.g. I1-I12) are additional steps used only by Indirect use cases
- INa (e.g. I8,I9) are steps used by the Indirect use case when communicating with a FHIR API enabled CBO
- INb (e.g. I8b, I9b) are steps used by the Indirect use case when communicating with a FHIR application enabled CBO

### Patient Stories and Workflow
SDOH IG related Patient Stories are available on the Gravity Project Confluence site [here](https://confluence.hl7.org/display/GRAV/Patient+Stories).

These use cases are represented by workflow diagrams on the [Exchange Workflow Page](exchange_workflow.html)

### Overview
The basis of the exchange interactions described below is to attempt to ‘close the loop’ between a provider, or other healthcare actor, who makes a request (referral), in FHIR provided as a combination of [SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html)/[SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html), for SDOH services and the request recipient (referral recipient, with various FHIR enabled capabilities and configurations as described below). The workflow detailed below provides a vision of how the IG is implemented (including all FHIR Artifacts, such as Capability Statements, Resource profiles, and value sets) to enable back and forth communication. 

The functional use cases defined below are based on specific exchanges of information between the relevant actors.  These use cases include:

- A direct referral between a requesting entity and a performing entity where both entities have FHIR APIs to facilitate the exchanges
- A "light" version of the direct referral where the performing entity uses and application that can access the referring entities API (but does not have FHIR API capability)
- An indirect referral, where the communication between the referring entity and the performing entity is through an intermediary (such as a Coordination Platform as defined below) that has FHIR API capability
- Finally, a patient application may optionally communicate directly with any of the entities that support a FHIR API and provide a mechanism for secure exchange

### Actors

- Provider -- includes licensed providers and others that interact with the patient to assess social risk, set goals, and determine/recommend referrals
- Care Coordinator -- coordinates the care and referral activities but normally does not make assessment, goal, or referral decisions
- Patient -- a consumer, or client, who is the subject of the assessment, goals, referrals and services delivered
- Community Based Organization (CBO) -- organizations that deliver social requested services (e.g. food pantry)
- Coordination Platform (CP) -- an intermediary that receives referrals, assesses patient needs, and works with one or more CBOs to deliver the services

### Business Associates

- CBOs and CPs are not covered entities under HIPAA.  (Covered entities only include Providers, Payers, and Clearing Houses)
- However, a CBO and/or CP may be a Business Associate (BA) of a covered entity.  This requires a Business Associate Agreement (BAA) between the covered entity and the BA.
- Entities covered under a BAA may be able to receive Protected Health Information (PHI) as part of the agreement without consent of the patient.  However, they are required to observe the same limitation as covered entities with regard the protection and disclosure of PHI.
- Typically, a BAA is required by a covered entity to avoid disclosure of PHI by non-covered entities and, in particular, in situations where clinical information is shared to help manage the needs of the patient  (e.g., if the patient is diabetic and therefore has specific dietary constraints)
- For a covered entity or business associate to share PHI with an entity that is not a covered entity or does not have a BAA, consent of the patient is generally required (there are specific exceptions allowed by HIPAA)


### Direct Referral

Applies to Providers, Payers and CPs as the referral requester

Patient assessed by provider and referred to CBO to deliver the service 

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

&nbsp;&nbsp;&nbsp;&nbsp;2 Provider evaluates assessment and identifies Food Insecurity and Transportation Insecurity

&nbsp;&nbsp;&nbsp;&nbsp;3 Provider and patient determine that it is most important to address the Food Insecurity first – provider promotes the health concern to the problem list

&nbsp;&nbsp;&nbsp;&nbsp;4 Provider and patient add a goal related to this problem to pursue enrollment in a SNAP program

&nbsp;&nbsp;&nbsp;&nbsp;5 Provider and patient agree that a referral to a contracted or non-contracted CBO is an appropriate next step

&nbsp;&nbsp;&nbsp;&nbsp;6 Patient consents to be referred to the CBO and consents to have the information that will be provided sent to the CBO

&nbsp;&nbsp;&nbsp;&nbsp;7 Optional: Provider makes information regarding the referral available to the patient's application

#### Provider – CBO Actions 

&nbsp;&nbsp;&nbsp;&nbsp;8a Provider or Care Coordinator creates and sends an electronic referral to the CBO

&nbsp;&nbsp;&nbsp;&nbsp;For direct light, the Provider or Care Coordinator creates and sends an electronic referral to CBO with secure link to Referral Source FHIR server containing the [FHIR SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html)/[SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html) referencing additional supporting FHIR Resources (such as FHIR Observations, FHIR Conditions, etc.).

&nbsp;&nbsp;&nbsp;&nbsp;9a CBO receives and accepts referral

#### CBO Actions

&nbsp;&nbsp;&nbsp;&nbsp;10 Optional: CBO communicates with the patient via their application to schedule appointments, collect additional information, etc.

&nbsp;&nbsp;&nbsp;&nbsp;11 CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed

#### Provider Actions

&nbsp;&nbsp;&nbsp;&nbsp;12 Provider receives the updated status

&nbsp;&nbsp;&nbsp;&nbsp;13 Optional: Provider closes loop with patient via questionnaire available to a patient's application

&nbsp;&nbsp;&nbsp;&nbsp;14 Provider determines if the goal has been satisfied and/or progress has been made on the goal and updates the goal appropriately

#### Considerations 

- CBOs are typically not BAs of covered entities and therefore not bound by HIPAA's privacy and security requirements
- Provider may not always have the relationship with the CBO
- CBO may not accept the referral or be unable to perform the requested service
- Closing the loop via patient reported outcomes 

<table><tr><td><img src="FunctionalUseCaseFlowDirectReferral3-Msg DME w Int.jpg" /></td></tr></table>


### Direct Referral Light

Same as the Direct Referral workflow above with the following exceptions noted below: 

#### Actors (same as Direct Referral)

Community Based Organization (CBO) has an application that can interact with a FHIR API but does not have a FHIR server

#### Assumptions

- Provider has a FHIR API
- Patient has a FHIR enabled personal application
- CBO has a FHIR enabled application (but not a FHIR API)

#### Provider Actions (same as Direct Referral)

- steps 1 through 7

#### CBO - Provider Actions (changed based on CBO application vs FHIR API)

&nbsp;&nbsp;&nbsp;&nbsp;8b CBO application queries Provider or Care Coordinator API for new or updated referrals.

&nbsp;&nbsp;&nbsp;&nbsp;The CBO (Referral Recipient) system queries the Referral Source FHIR server using the FHIR API (using the FHIR [Task id](StructureDefinition-SDOHCC-TaskForReferralManagement-definitions.html#Task.id) and [SDOHCC ServiceRequest Resource instance id](StructureDefinition-SDOHCC-ServiceRequest-definitions.html#ServiceRequest.id)). Every instance of a FHIR Resource or Profile has a FHIR Server specific unique id. Using the HTTPS GET method with the Resource type and id, one can directly find a specific instance if the Referral Source identifies it or the id of the instance was previously pulled. Additionally, a generic request for all the Resources of a type can be performed. Referral Source servers should have implemented the option to limit the returned Resource instances by date.

&nbsp;&nbsp;&nbsp;&nbsp;9b CBO finds new referral and accepts the referral

&nbsp;&nbsp;&nbsp;&nbsp;The CBO updates the status of the referral to indicate acceptance of the referral, by updating the [status](StructureDefinition-SDOHCC-TaskForReferralManagement-definitions.html#Task.status) of the FHIR [SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html) specific to the referral indicated above from [requested](https://hl7.org/fhir/R4/codesystem-task-status.html#task-status-requested) to ‘accepted.’ FHIR SDOHCC Task For Referral Management status is updated using the FHIR API to ‘in progress’ when work commences.

&nbsp;&nbsp;&nbsp;&nbsp;There is the possibility that a further referral was made by the CBO to a separate CBO. For a CBO without a FHIR server, this can be communicated by sending (i.e. CREATE method of the FHIR API) a FHIR [SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html) instance that references the initial [SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html)/[SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html) through [partOf:SupportedPartOf](StructureDefinition-SDOHCC-TaskForReferralManagement-definitions.html#Task.partOf:SupportedPartOf) and [basedOn:SupportedBasedOn](StructureDefinition-SDOHCC-ServiceRequest-definitions.html#ServiceRequest.basedOn:SupportedBasedOn) respectively, to the Referral Source FHIR server. The new Task instance is a child Task. We would appreciate feedback on any use of this paradigm.

#### CBO Actions (changed step 10 might not occur electronically)

&nbsp;&nbsp;&nbsp;&nbsp;10 Optional exchange with Patient might not occur electronically

&nbsp;&nbsp;&nbsp;&nbsp;11 CBO completes the evaluation and enrollment, updates the status of the referral to completed, and includes information on what was completed 

&nbsp;&nbsp;&nbsp;&nbsp;To indicate completion via the FHIR API, the following are performed by the CBO: Any procedures performed by the CBO are indicated by sending a [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html) to the referral source server using the POST method of the FHIR API (i.e. CREATE through the FHIR API). The procedure can be connected to the service request thru referencing the FHIR [SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html) instance from the FHIR [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html) Profile instance. Also, the relevant [SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html) should refer to the [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html) through the relevant [Task.output](StructureDefinition-SDOHCC-TaskForReferralManagement-definitions.html#Task.output) field. The FHIR SDOHCC Task For Referral Management [Task.status](StructureDefinition-SDOHCC-TaskForReferralManagement-definitions.html#key_Task.status) is updated using the FHIR API to [completed](https://hl7.org/fhir/R4/codesystem-task-status.html#task-status-completed). 

#### Provider Actions (same as Direct Referral)

- steps 12 through 14 

#### Considerations (same as Direct Referral)

<table><tr><td><img src="FunctionalUseCaseFlowDirectLightReferral3-Msg DME w Int.jpg" /></td></tr></table>


### Indirect Referral with Direct CBO

Applies to Providers and Payers as the referral requester

Patient is assessed by a practitioner and referred to a Coordination Platform (CP). CP refers to a Community Based Organization (CBO) to deliver the service

#### Actors

- Provider / Care Coordinator
- Patient
- Coordination Platform (CP)
- Community Based Organization (CBO)

#### Assumptions

- Provider has a FHIR API
- Patient has a FHIR enabled persona application
- CP has a FHIR API
- CBO has a FHIR API

#### Provider Actions (same as Direct Referral)

- steps 1 through 7

#### Provider – CP – CBO workflow 

&nbsp;&nbsp;&nbsp;&nbsp;I1 Provider or Care Coordinator creates and sends an electronic referral (and a copy of the consent) to the CP

&nbsp;&nbsp;&nbsp;&nbsp;I2 CP receives and accepts referral

&nbsp;&nbsp;&nbsp;&nbsp;I3 Optional: CP communicates with patient via their application to schedule appointments, collect additional information, etc.

&nbsp;&nbsp;&nbsp;&nbsp;I4a CP refers patient to a CBO, with which they have a relationship, to evaluate the patient’s eligibility and help the patient enroll in a SNAP program, if appropriate 

&nbsp;&nbsp;&nbsp;&nbsp;I5a CBO receives and accepts the referral

&nbsp;&nbsp;&nbsp;&nbsp;I6a Optional: CP makes information regarding the referral available to the patient's application

&nbsp;&nbsp;&nbsp;&nbsp;I7 CP updates status of the initial referral

&nbsp;&nbsp;&nbsp;&nbsp;I8a Optional: CBO communicates with patient via their application to schedule appointments, collect additional information, etc.

- step 11 CBO completes the evaluation and enrollment

&nbsp;&nbsp;&nbsp;&nbsp;I9a CBO updates the status of the referral to completed, and includes information on what was completed

&nbsp;&nbsp;&nbsp;&nbsp;I10 Optional: CP communicates with the patient via their application to close loop on service(s) delivered by the CBO

&nbsp;&nbsp;&nbsp;&nbsp;I11 CP uses the input from the CBO and Patient to update the status of the referral and includes information on what was completed

&nbsp;&nbsp;&nbsp;&nbsp;I12 Provider receives the updated status 

#### Provider Actions (same as Direct Referral)

- steps 13 and 14 

#### Considerations in addition to Direct Referral

- CPs may not be a BA of the covered entity and therefore not bound by HIPAA's privacy and security requirements
- CP may not always have a formal relationship with a CBO
- Provider may request to have the service delivered by a specific CBO
- CP may not accept the referral or be unable to perform the requested service
- CP may need to split the request into multiple tasks to be performed by more than one CBO

<table><tr><td><img src="FunctionalUseCaseFlowIndirectDirectReferral3-Msg DME w Int.jpg" /></td></tr></table>

### Indirect Referral with Direct Light CBO

Applies to Providers and Payers as the referral requester, and patient is assessed by a practitioner and referred to a Coordination Platform (CP).  CP refers to a Community Based Organization (CBO) to deliver the service

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

&nbsp;&nbsp;&nbsp;&nbsp;I4b CBO application queries the CP for new or updated referrals  

&nbsp;&nbsp;&nbsp;&nbsp;I5b CBO finds new referral and accepts the referral

&nbsp;&nbsp;&nbsp;&nbsp;I6a Optional: CP makes information regarding the referral available to the patient's application

&nbsp;&nbsp;&nbsp;&nbsp;I7 CP updates status of the initial referral

&nbsp;&nbsp;&nbsp;&nbsp;I8b Optional exchange with Patient does not occur electronically (no app to app exchange)

- step 11 CBO completes the evaluation and enrollment

&nbsp;&nbsp;&nbsp;&nbsp;I9b CBO updates the status of the referral to completed, and includes information on what was completed

&nbsp;&nbsp;&nbsp;&nbsp;I10 Optional: CP communicates with the patient via their application to close loop on service(s) delivered by the CBO

&nbsp;&nbsp;&nbsp;&nbsp;I11 CP uses the input from the CBO and Patient to update the status of the referral and includes information on what was completed

&nbsp;&nbsp;&nbsp;&nbsp;I12 Provider receives the updated status 

#### Provider Actions (same as Direct Referral)

- steps 13 and 14

#### Considerations (same as Indirect Referral with Direct CBO)

<table><tr><td><img src="FunctionalUseCaseFlowIndirectDirectLightReferral3-Msg DME w Int.jpg" /></td></tr></table>

### Closing the loop with the patient

The following applies to Providers, Payers, CPs and CPOs and assumes patient is using a personal application (e.g., Smart Phone application) that has already been registered and authenticated with the provider's EHR API, the CP API and the CBO API.

#### Actors

- Practitioner / Care Coordinator
- Patient
- CP
- CBO (FHIR API)

#### Patient Workflow (from above functional use cases)

All exchanges are optional

- Provider - Patient

&nbsp;&nbsp;&nbsp;&nbsp;7 Provider makes information regarding the referral available to the patient's application

- CP - Patient

&nbsp;&nbsp;&nbsp;&nbsp;I3 CP communicates with patient via their application to schedule appointments, collect additional information, etc.

- CBO - Patient (assumes CBO has FHIR API)

&nbsp;&nbsp;&nbsp;&nbsp;I8a CBO communicates with patient via their application to schedule appointments, collect additional information, etc.

- CP - Patient

&nbsp;&nbsp;&nbsp;&nbsp;I10 CP communicates with the patient via their application to close loop on service(s) delivered by the CBO

- Provider - Patient

&nbsp;&nbsp;&nbsp;&nbsp;13 Provider closes loop with patient via questionnaire available to a patient's application

#### Considerations 

- Patient may not have an appropriate application or completed process to register and authenticate with the API(s)
- Patient may not be willing or able to respond to the questionnaires

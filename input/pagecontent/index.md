### Overview

Social determinants of health (SDOH) are the conditions in the environments where people are born, live, learn, work, play, worship, and age that affect a wide range of health, functioning, and quality-of-life outcomes and risks[^1]. They are increasingly being recognized as essential factors that influence healthcare outcomes. This HL7 Implementation Guide (IG) defines how to exchange coded content using the HL7 FHIR Standard for the following SDOH-focused care activities: screening, clinical assessment/diagnosis, goal setting, and the planning and performing of interventions.  This IG addresses the need to gather SDOH information in multiple settings, share that information between stakeholders, and exchange referrals between organizations to address specific social risks and needs, all with appropriate patient consent.  In addition, the IG demonstrates how to share clinical data to support secondary purposes such as population health, quality, and research.


This IG was developed by the [Gravity Project], which aims to build and promulgate consensus-driven social determinants of health (SDOH) data standards for health and social care interoperability and use among multiple stakeholders. The project and this implementation guide are focused on the U.S. environment.  This IG leverages content from the [US Core Implementation Guide]({{site.data.fhir.ver.uscore}}/index.html) and binds to US-specific terminology.  However, the basic constructs and interaction patterns may well be applicable outside the U.S.

The IG supports the following use cases:
* 	Documenting SDOH data in conjunction with patient encounters with providers, payers, and community services
*   Referring patients to address SDOH needs via an electronic workflow.  The referral framework includes support for intermediary organizations to manage service delivery, closed loop feedback to the ordering provider and direct engagement with the patient and their caregivers.
* 	Identifying cohorts of individuals that have a common relationship to another entity (e.g., covered by the same payer)

{% include img-med.html img="ConceptualFramework-orig.jpeg" caption="Figure 1: Conceptual Framework for SDOH Clinical Care" %}

<div markdown="1" class="stu-note">
This IG often refers to Community Based Organizations (CBOs) as synonymous with a referral target and clinicians as synonymous with the referring provider.
There is nothing that prevents use of the IG for other referral sources and targets.
</div>

The activities supported by this IG include (see [Conceptual Framework](sdoh_clinical_care_scope.html) for more details)
  - Screening: This refers to activities where social risk data from individuals are initially captured, whether through a self-administered, provider-administered, or health plan-administered questionnaire. These activities may also be repeated at certain intervals to monitor changes in social risks.
  - Assessment/Diagnosis: These include activities where providers (clinical and community-based) and health plans analyze the data obtained through screening and interaction with the individual to determine their social risks and needs.
  - Interventions: These refer to actions undertaken by providers (clinical and community-based) and health plans to help address identified social risks and needs. These include referrals, case management, care planning, counseling and education, and provision of services and orders.


Currently, this IG is intended to support Patient Applications, Provider's Electronic Health Record (EHR) systems, Coordination Platforms that intermediate between Providers, and Community Based Organizations that provide SDOH services. In the future payer systems and governmental systems will be supported. The IG establishes a framework for SDOH-related interventions including:
* capture of  data from validated assessment instruments
* mapping the responses from assessments to observations, conditions, and goals using SDOH-specific value sets using established standards (see [Assessment Instrument Support](assessment_instrument_support.html#using-structuremap-to-generate-observations-or-conditions-from-questionnaireresponse))
* generating and monitoring referrals from providers and care coordinators for SDOH-related services provided by CBOs
* capturing the results of the referrals as procedures

### Dependencies on Other IGs

| Implementation Guide | Version | Dependency |
| -------------------- | ------- | ---------- |
| [US Core](https://hl7.org/fhir/us/core/STU3.1.1/) | 3.1.1 | Where possible, all profiles in this IG are either derived from US Core 3.1.1 or aligned with that release and future releases as much as possible.  U.S. Core also sets expectations for a variety of referenced resources and establishes baseline conformance expectations.  |
| [Structured Document Capture (SDC)](http://hl7.org/fhir/uv/sdc/)| 3.0.0  | SDC is the basis for mapping QuestionnaireResponses to Observations and Conditions. SDC also provides guidance around how questionnaires can be created with support for score calculation, conditional behavior, specific rendering expectations, etc.   |
| [Subscriptions R5 Backport](http://hl7.org/fhir/uv/subscriptions-backport) |1.1.0   | Subscriptions are recommended for monitoring completion of referrals.  |
|[Value Set Authority Center](https://vsac.nlm.nih.gov/) (VSAC)| 0.9.0   |    Gravity Project social risk data elements are published in [Value Set Authority Center](https://vsac.nlm.nih.gov/) (VSAC) value sets. The value sets can be identified by searching for "The Gravity Project" steward. You will need to create a free National Library of Medicine (NLM) account to access the value sets. Value sets will be updated bi-annually on June 30th and December 31st.   |
{:.grid}

### Relationships to Other IGs

| Implementation Guide |  Relationship  |
| -------------------- |  ---------- |
| [Bidirectional Service eReferral (BSeR)](http://hl7.org/fhir/us/bser/)  | Whereas this IG orchestrates referrals using the FHIR query interface, BSeR bases referral management on the exchange of self-contained Bundles of FHIR resources.  Gravity is working with BSeR to align referral approaches. |
| [Clinical Documentation Exchange (CDex)](http://hl7.org/fhir/us/davinci-cdex) | Allows payers to retrieve or solicit records from an EHR related to patients covered under their plans. May be used to allow payers retrieving SDOH-related information for quality measures or in support of contractual or other payment schemes. |
| [Data Exchange for Quality Measures Implementation Guide](https://hl7.org/fhir/us/davinci-deqm/) | SDOH-related services will inevitably be included in quality measurement programs |
| [DaVinci Prior Authorization Support](http://hl7.org/fhir/us/davinci-pas/) (PAS)|  Together with CRD and DTR, these three IGs (collectively known as the Da Vinci Burden Reduction IGs) provide support for prior authorization and other documentation capture and could be relevant for SDOH-related services. |
| [DaVinci Coverage Requirements Discovery](http://hl7.org/fhir/us/davinci-crd/) (CRD) |  Together with PAS and DTR, these three IGs (collectively known as the Da Vinci Burden Reduction IGs) provide support for prior authorization and other documentation capture and could be relevant for SDOH-related services. |
| [DaVinci Documentation Templates and Rules](http://hl7.org/fhir/us/davinci-dtr/) (DTR) | Together with PAS and CRD, these three IGs (collectively known as the Da Vinci Burden Reduction IGs) provide support for prior authorization and other documentation capture and could be relevant for SDOH-related services.  |
| [Human Services Directory](https://build.fhir.org/ig/HL7/FHIR-IG-Human-Services-Directory) | Can be used by a provider to identify referral targets for SDOH-related services  |
| [IHE FHIR Audit Event Query and Feed to ATNA](https://wiki.ihe.net/index.php/Audit_Trail_and_Node_Authentication) | For systems wishing to maintain robust audit records of changes and access to patient records (always a good idea), this IG defines standards for using FHIR to do so. (Note that this standard is only really relevant if there's a need for electronic sharing of audit records.) |
| [National Healthcare Directory Exchange](https://hl7.org/fhir/us/ndh/2023Sep/)| A U.S. Office of the National Coordinator-sponsored IG supporting the exchange of directory information for a wide range of service providers and organizations |
| [PACIO Cognitive Status](http://hl7.org/fhir/us/pacio-cs) | Defines standards for sharing information about a patient's cognitive capabilities and limitations, which may influence decisions about appropriate SDOH interventions. |
| [PACIO Functional Status](http://hl7.org/fhir/us/pacio-fs) | Defines standards for sharing information about a patient's physical capabilities, which may influence decisions about appropriate SDOH interventions (e.g. with respect to transport). |
| [Patient Contributed Data](http://www.hl7.org/documentcenter/public/ballots/2022SEP/downloads/HL7_PCD_R1_I1_2022SEP.pdf) | Defines guidance for incorporation of patient and caregiver-collected information into clinical records. |
| [Physical Activity](https://hl7.org/fhir/us/physical-activity/) | This IG inherits functionality from the SDOH IG and uses a similar architectural approach to manage sharing of physical activity goals, referrals, and patient engagement. |
| [Quality Measure Implementation Guide](http://hl7.org/fhir/us/cqfmeasures) | Defines standards for sharing clinical quality measures electronically, allowing defining and sharing measures related to SDOH evaluation and interventions. |
| [SmartApp Launch](http://hl7.org/fhir/smart-app-launch)  | Allows launching third party applications in the context of another system, including allowing the application to controlled access to patient information.  |
{:.grid}



### How to Read this IG

This IG contains a wealth of material targeting different audiences. Some sections provide more general or introductory content, while others provide detailed technical information targeted at implementors.  The table below provides a listing of the key sections of the IG in the rough order that they should be read.

| Section | Sub-section | Description | Audience |
| --------| ----------- | --------- | ---------|
| Background| [SDOH and the Gravity Project](sdoh_challenges_gravity.html) | General background on the importance of collecting and standardizing social risk data, and the Gravity Project     |  General |
| Background| [SDOH Clinical Care Background](sdoh_clinical_care_scope.html) | A description of the clinical scope of this IG    |  General |
| Background| [Technical Background](technical_background.html) | Background material that should be understood prior to attempting to understand this IG     |  General/Introductory |
| Implementation Guidance| [Assessment Instrument Support] | A description of the importance of standard assessment instruments for the collection of social risk data, and how assessment instruments are mapped to SDOH Conditions, Observations and Goals     |  General |
| Implementation Guidance|  [Referral Workflow] |  Provides a high-level description of the referral workflows and patient interactions supported by this IG, and then drills down to a detailed description of the FHIR API calls implementing the referral workflow   |  Introductory and Detailed Technical |
| Implementation Guidance | [Connecting Applications with API Data Sources] | Provides a description of  establishing connections to enable the exchange of information supporting the [Referral Workflow].    |  Detailed Technical  |
| Specifications | [FHIR Artifacts](artifacts.html) | An index of the FHIR artifacts defined as part of this implementation guide     |  Detailed Technical |
| Specifications| [Must Support and Missing Data] | Conformance requirements for must support and missing data     |  Detailed Technical |
| Specifications | [Privacy and Security] | Conformance requirements for privacy and security considerations     |  Detailed Technical |
| Specifications | [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html) | Draft proposals for Observation profiles supporting Personal Characteristics     |  Detailed Technical |
| Specifications | [Downloads](downloads.html) | Downloads     |  Detailed Technical |
{:.grid}

### Key Technical Content of this IG
* [CapabilityStatements](artifacts.html#):   CapabilityStatements formally define the different types of systems that can comply with this implementation guide and set conformance expectations around what resources and behaviors they must support.  This IG provides capability statements for Patient applications, referral sources and recipients, and coordination platform intermediaries.
* [Profiles](artifacts.html#profiles): Profiles describe constraints and extensions on resources and data types to reflect the requirements of the use cases in an implementation guide This IG provides Observation, Condition, Procedure, ServiceRequest, Task, Goal, Group, HealthcareService, Consent, and Location profiles. In addition, this implementation guide uses (and in some cases further profiles) profiles defined in US Core.
* [Value Sets](artifacts.html#value-sets):  FHIR value sets specify a set of codes drawn from one or more code systems, intended for use in a particular context. The Gravity Project has worked intensively to develop value sets for SDOH-related content.  This content is described where it is used.  See the following profiles: [SDOHCC Condition], [SDOHCC Observation Screening Response], [SDOHCC Procedure], [SDOHCC ServiceRequest], [SDOHCC Goal].
* [Examples](artifacts.html#examples):  This IG provides contextually relevant examples of all profiles.
* [Referral Workflow](referral_workflow.html):  The management of referrals by providers to community-based organizations with different levels of FHIR capability and the assignment of tasks to Patients is described in detail.

* [Draft Specifications for Personal Characteristics](draft_specifications_for_personal_characteristics.html):   These profiles are included to test and promote their use and possible future incorporation into [US Core]({{site.data.fhir.ver.uscore}}/index.html).

-----------------------------------------------------------------------------------------------------
[^1]: [Healthy People 2030](https://health.gov/healthypeople/priority-areas/social-determinants-health)

{% include markdown-link-references.md %}
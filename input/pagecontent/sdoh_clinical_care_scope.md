###  SDOH Clinical Care Scope
### Scope of this IG

The focus for this version of the IG is to standardize the exchange of SDOH information related to the following activities:

* assessment of social risk,
* establishing coded health concerns/problems,
* creating patient driven goals, and
* defining a RESTful closed loop referral process to manage interventions.

####  Out of Scope

The following items are out of scope for this version of the IG.

* Providing guidance on the frequency of administering assessments (this is left up to the responsible organizations based on their standards of practice).
* Standards for reporting quality measures to payers or quality organizations (this is left to the [Data Exchange for Quality Measures Implementation Guide](https://hl7.org/fhir/us/davinci-deqm/) that was co-authored by NCQA).
* Addressing Consent beyond the consent to share information between a HIPAA covered entity and entities that are not covered by HIPAA.
* Administrative activities such as eligibility checking, prior authorization, or billing for SDOH services.

### Conceptual Framework

Coded SDOH content is captured across core health care activities: screening/assessment, establishing health concerns, goal setting, care planning, interventions, outcomes and reporting. The conceptual framework, illustrated below, shows how these activities form a cycle of care. Over time, a patient’s progress toward care goals can be tracked and measured.
{% include img.html img="ConceptualFramework-orig.jpeg" caption="Figure 1: Conceptual Framework" %}

### Scope of Interactions

The scope of interactions is intended to cover all of the interactions shown in the drawing below. The focus of the current IG is interactions between a patient, provider, and CBO, with possible intermediation by a Coordinationg Platform (CP).  The IG supports interactions with CBOs that support either a FHIR-enabled application that can FHIR servers, or a FHIR-server based application that supports querying other FHIR servers, as well as being queried by other applications.  In the drawing below, bidirectional solid arrows reflect communication between two endpoints with FHIR servers, whereas unidirectional solid arrows reflect FHIR API calls by a FHIR-enabled application against a FHIR server.

{% include img.html img="SystemDiagram.svg" caption="Figure 2: System Interactions" %}
<br>
<br>
### Data Modeling Framework
The diagram below shows the data model for the assessment process including the creation of health concerns, goal setting (patient-centered goals), and creation of referrals using service request and procedure/intervention. The graphic represents key relationships defined in this IG for the [Questionnaire] and  [QuestionnaireResponse] resources, as well as the [Observation], [SDOHCC Condition], [SDOHCC Goal], [SDOHCC Referral Management Task], [SDOHCC ServiceRequest] and [SDOHCC Procedure] profiles.   For graphical clarity, only key references between profiles are shown (e.g., references to Patient profile are not shown).   Clicking on the profiles in the drawing will link to the defining specification.

The [SDOHCC Patient Task] provides the ability to direct the patient to seek service from a particular [SDOHCC HealthcareService], or to respond to a customer service questionnaire.

<object data="FHIRModeling.svg" type="image/svg+xml"></object>
<br/>
*Figure 3: Data Modeling Framework*

{% include markdown-link-references.md %}
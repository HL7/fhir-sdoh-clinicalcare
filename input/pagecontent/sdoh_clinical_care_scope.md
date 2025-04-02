### Conceptual Framework

Coded SDOH content is captured across core health care activities: screening/assessment, establishing health concerns, goal setting, care planning, interventions, outcomes and reporting. The conceptual framework, illustrated below, shows how these activities form a cycle of care. Over time, a patient’s progress toward care goals can be tracked and measured.
{% include img.html img="ConceptualFramework-orig.jpeg" caption="Figure 1: Conceptual Framework" %}

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

### Scope of Interactions

The focus of this IG is interactions between a patient, provider, and CBO, with possible intermediation by a Coordination Platform (CP).  Provider EHRs and CPs will act as both clients and servers, accepting data from other systems and allowing it to be queried, while also storing data on and retrieving data from other systems.  Patient systems will act only as clients - accessing and sometimes manipulating data on other systems, but not exposing interfaces for other systems to interact with. The IG supports interactions with CBOs that support either a FHIR-enabled application (e.g. phone, tablet, web application) that queries other systems but does not expose its own data for query, or as a FHIR-Server Enabled application that exposes its own data for query and manipulation as well as querying and sometimes updating other systems.  In the drawing below, bidirectional solid arrows reflect communication between two endpoints with FHIR servers, whereas unidirectional solid arrows reflect FHIR API calls by a FHIR-enabled application against a FHIR server.

{% include img.html img="SystemDiagram.svg" caption="Figure 2: System Interactions" %}
<br>
<br>
### Data Modeling Framework

The diagram below reflects the primary data structures and relationships associated with each of the major business processes covered by this implementation guide:
* Assessment - where information is gathered from a patient (typically via a [QuestionnaireResponse]({{site.data.fhir.path}}questionnaireresponse.html)) based on a standardized Questionnaire resulting in one or more [SDOHCC Observation Screening Response]s. These may be accompanied by additional [SDOHCC Observation Assessment]s.   If there are concerns about a patient's social determinants situation, a [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html) will be defined allowing the concern to be tracked as part of the patient's problem list.
* Goal Management - if an SDOH issue has been identified, the [SDOHCC Goal]s agreed to between the patient and practitioner will be created and, over time, updated.  These goals can be associated with the [SDOHCC Observation Screening Response]s, [SDOHCC Observation Assessment]s, and/or [SDOHCC Condition]s they seek to manage and improve.  In some cases, a Goal might also point to Observations to reflect the outcome of the goal.
* Referral Management - the formal order is captured as a [SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html) and linked to the [SDOHCC Goal](StructureDefinition-SDOHCC-Goal.html), [SDOHCC Observation Screening Response](StructureDefinition-SDOHCC-ObservationScreeningResponse.html), [SDOHCC Observation Assessment](StructureDefinition-SDOHCC-ObservationAssessment.html), and [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html)s that justify the action.  It may also link to a [SDOHCC Consent](StructureDefinition-SDOHCC-Consent.html) allowing the referral recipient to further share information.  The [SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html) coordinates the solicitation and resulting process, possibly being linked to child actions by the referral recipient.  Eventually, [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html)s document what action was taken.
* Patient Engagement - allows [SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html) requests to be made of the patient or their caregiver(s).  Depending on the nature of the task, it will point to a [Questionnaire]({{site.data.fhir.path}}questionnaire.html) , with a result of a [QuestionnaireResponse]({{site.data.fhir.path}}questionnaireresponse.html), to a [DocumentReference]({{site.data.fhir.path}}documentreference.html) containing a PDF form, and later another DocumentReference with the PDF response, a [SDOHCC Healthcare Service](StructureDefinition-SDOHCC-HealthcareService.html) containing information about who to contact, or nothing at all.

In the diagram, blue shapes indicate profiles defined in this IG and yellow shapes indicate profiles defined in IGs on which we have dependencies (US Core or SDC).  Only key references between profiles are shown.  Most participant resources (Patient, Practitioner, Organization, etc.) are excluded because they are referenced from most profiles.

<object data="FHIRModelingV2.svg" type="image/svg+xml"></object>
<br/>
**Figure 3: Data Modeling Framework**

{% include markdown-link-references.md %}
### Project Model

The Gravity Project develops evidence-based terminology, value sets, and FHIR-based exchange standards to support collaboration among health care, social, and public health organizations in addressing the social determinants of health (SDOH). Given this mission, the Gravity Project Model, illustrated below, describes the existing and possible activities that the community has determined data standards can support. The Gravity Project does not claim responsibility for building standards for every activity in the model; other entities may be better positioned to lead some efforts, and the model simply names them. For the full set of activities and their definitions, see the [Gravity Project Model materials](https://confluence.hl7.org/spaces/GRAV/pages/453903104/Gravity+Project+Conceptual+Model+-+Proposed+2026+Update) maintained by the Gravity Project on Confluence.
{% include img.html img="GravityProjectModel.png" caption="Figure 1: Gravity Project Model" %}

<div markdown="1" class="stu-note">
Previous versions of this guide included a conceptual model that drew concerns from the community: an overly clinical focus, implied workflows that did not represent the variability of social service provision, and the absence of concepts central to social service evidence and practice. Because the revised illustration intentionally does not imply workflow, sequence, or fixed relationships, it is no longer a conceptual model — it is the Gravity Project Model: the set of existing and possible activities the community has determined data standards can support. The consensus revision materials are maintained by the Gravity Project on Confluence.
</div>

### Scope of this IG

The focus for this version of the IG is to standardize the exchange of SDOH information related to the following activities:

* assessment of social risk,
* establishing coded health concerns/problems,
* creating patient driven goals, and
* defining a closed-loop referral process to request, coordinate, and document SDOH-related interventions (see the [Project Model](sdoh_clinical_care_scope.html#project-model) for the broader set of activities these support).

####  Out of Scope

The following items are out of scope for this version of the IG.

* Providing guidance on the frequency of administering assessments (this is left up to the responsible organizations based on their standards of practice).
* Standards for reporting quality measures to payers or quality organizations (this is left to the [Data Exchange for Quality Measures Implementation Guide](https://hl7.org/fhir/us/davinci-deqm/) that was co-authored by NCQA).
* Addressing Consent beyond the consent to share information between a HIPAA covered entity and entities that are not covered by HIPAA.
* Administrative activities such as eligibility checking, prior authorization, or billing for SDOH services.

### Scope of Interactions

The focus of this IG is interactions between a patient, provider, and community-based organization (CBO). There may be scenarios where there will be intermediation by a Coordination Platform (CP). Provider EHRs, CBO systems of record and CPs (when present) will act as both clients and servers, accepting data from other systems and allowing it to be queried, while also storing data on and retrieving data from other systems. Patient systems will act only as clients - accessing and sometimes manipulating data on other systems but not exposing interfaces for other systems to interact with. The IG supports interactions with CBOs that support either a FHIR-enabled application (e.g. phone, tablet, web application) that queries other systems but does not expose its own data for query, or as a FHIR-Server Enabled application that exposes its own data for query and manipulation as well as querying and sometimes updating other systems.

### Data Modeling Framework

The diagram below reflects the primary data structures and relationships associated with each of the major business processes covered by this implementation guide:
* Assessment - where information is gathered from a patient (typically via a [QuestionnaireResponse]({{site.data.fhir.path}}questionnaireresponse.html)) based on a standardized Questionnaire resulting in one or more [SDOHCC Observation Screening Response]s. These may be accompanied by additional [SDOHCC Observation Assessment]s.   If there are concerns about a patient's social determinants situation, a [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html) will be defined allowing the concern to be tracked as part of the patient's problem list.

<div>{% include AssessmentFramework.svg %}</div>
<br clear="all"/>

* Goal Management - if an SDOH issue has been identified, the [SDOHCC Goal]s agreed to between the patient and practitioner will be created and, over time, updated.  These goals can be associated with the [SDOHCC Observation Screening Response]s, [SDOHCC Observation Assessment]s, and/or [SDOHCC Condition]s they seek to manage and improve.  In some cases, a Goal might also point to Observations to reflect the outcome of the goal.

<div>{% include GoalManagementFramework.svg %}</div>
<br clear="all"/>

* Referral Management - the formal order is captured as a [SDOHCC ServiceRequest](StructureDefinition-SDOHCC-ServiceRequest.html) and linked to the [SDOHCC Goal](StructureDefinition-SDOHCC-Goal.html), [SDOHCC Observation Screening Response](StructureDefinition-SDOHCC-ObservationScreeningResponse.html), [SDOHCC Observation Assessment](StructureDefinition-SDOHCC-ObservationAssessment.html), and [SDOHCC Condition](StructureDefinition-SDOHCC-Condition.html)s that justify the action.  It may also link to a [SDOHCC Consent](StructureDefinition-SDOHCC-Consent.html) allowing the referral recipient to further share information.  The [SDOHCC Task For Referral Management](StructureDefinition-SDOHCC-TaskForReferralManagement.html) coordinates the solicitation and resulting process, possibly being linked to child actions by the referral recipient.  Eventually, [SDOHCC Procedure](StructureDefinition-SDOHCC-Procedure.html)s document what action was taken.

<div>{% include ReferralManagement.svg %}</div>
<br clear="all"/>

* Patient Engagement - allows [SDOHCC Task For Patient](StructureDefinition-SDOHCC-TaskForPatient.html) requests to be made of the patient or their caregiver(s).  Depending on the nature of the task, it will point to a [Questionnaire]({{site.data.fhir.path}}questionnaire.html) , with a result of a [QuestionnaireResponse]({{site.data.fhir.path}}questionnaireresponse.html), to a [DocumentReference]({{site.data.fhir.path}}documentreference.html) containing a PDF form, and later another DocumentReference with the PDF response, a [SDOHCC Healthcare Service](StructureDefinition-SDOHCC-HealthcareService.html) containing information about who to contact, or nothing at all.

<div>{% include PatientEngagementFramework.svg %}</div>
<br clear="all"/>

In the diagram, blue shapes indicate profiles defined in this IG and yellow shapes indicate profiles defined in IGs on which we have dependencies (US Core or SDC).  Only key references between profiles are shown.  Most participant resources (Patient, Practitioner, Organization, etc.) are excluded because they are referenced from most profiles.


{% include markdown-link-references.md %}
###  SDOH Clinical Care Scope
### Scope of this IG

The focus for this version of the IG is to standardize the exchange of SDOH information related to the following activities:

1)	assessment of social risk,
2)	establishing coded health concerns/problems,
3) 	creating patient driven goals, and
4)	defining a RESTful closed loop referral process to manage interventions.

####  Out of Scope

The following items are out of scope for this version of the IG.

1) Providing guidance on the frequency of administering assessment (this is left up to the responsible organizations based on their standards of practice).
2) Standards for reporting quality measures to payers or quality organizations (this is left to the Data Exchange for Quality Measures Implementation Guide that was co-authored by NCQA).
3) Addressing Consent beyond the consent to share information between a HIPAA covered entity and entities that are not covered by HIPAA.
4) Administrative activities such as eligibility checking, prior authorization, or billing for SDOH services.

### Conceptual Framework

Coded SDOH content is captured across core health care activities: screening/assessment, establishing health concerns, goal setting, care planning, interventions, outcomes and reporting. The conceptual framework, illustrated below, shows how these activities form a cycle of care. Over time, a patient's progress toward care goals can be tracked and measured.  Supporting the cycle of care, and the referral process, this IG defines FHIR profiles that are show in the figure below, proximate to the activity that they support.  The profiles are labeled with the vocabularies used to represent their content.  The icons for actors and FHIR-capability are defined [here].

The Gravity Project has identified [17 SDOH domains](ValueSet-SDOHCC-ValueSetSDOHCategory.html) that describe various types of social risk and has domain-specific valuesets for these domains that find expression in the relevant profiles of this IG. Work is ongoing.  A current list of the domains and the active terminology work effort can be found on the Gravity Project [Terminology Pages](https://confluence.hl7.org/display/GRAV/Terminology+Workstream+Dashboard) on Confluence.

{% include img.html img="AlternateScopeOfIG.svg" caption="Figure 1: Alternate Scope of IG" %}

### Scope of Intereactions

The scope of interactions is intended to cover all of the interactions shown with blue arrows below. THe focus of the current IG is interactions between a patiet, provider, and CBO, with possible intermediation by a CP. In the future, the IG will be expanded to support Payers and Government agencies, and referrals from non-health care providers.

<table><tr><td><img src="SDOHInteractionsDrawingexpandedV5.jpg" /></td></tr></table>

<br>
<br>
### Data Modeling Framework
The diagram below shows the data model for the assessment process including the creation of health concerns, goal setting (patient-centered goals), and creation of referrals using service request and procedure/intervention. The graphic represents relationships defined in this IG for the [Questionnaire] and  [QuestionnaireResponse] resources, as well as the [Observation], [SDOHCC Condition], [SDOHCC Goal], [SDOHCC Task], [SDOHCC ServiceRequest] and [SDOHCC Procedure] profiles.


{% include img.html img="FHIR_Modeling.svg" caption="Figure 2: Data Modeling Framework" %}

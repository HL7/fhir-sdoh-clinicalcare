###  SDOH Clinical Care Scope

The Gravity Project focus for this version of the IG is to standardize the exchange of SDOH information related to the following activities:

1)	assessment of social risk,

2)	establishing coded health concerns/problems,

3) 	creating patient driven goals, and

4)	defining a RESTful closed loop referral process to manage interventions.

<table><tr><td><img src="IGScope.png" /></td></tr></table>

Currently, the Gravity Project has identified a number of SDOH domains that describe various types of social risk.  Work is underway to identify value sets for the above activities related to each of the SDOH domains.  Information on the approach taken by this IG to support code systems and value sets for these SDOH domains can be found [here](support_for_multiple_domains.html).

A current list of the domains and the active terminology work effort can be found on the Gravity Project [Terminology Pages](https://confluence.hl7.org/display/GRAV/Terminology+Workstream+Dashboard) on Confluence.

The scope of interactions is intended to cover all of the interactions shown with blue arrows below.

<table><tr><td><img src="SDOHInteractionsDrawingexpandedV5.jpg" /></td></tr></table>

<br>

####  Out of Scope

The following items are out of scope for this version of the IG.

1) Providing guidance on the frequency of administering assessment (this is left up to the responsible organizations based on their standards of practice).

2) Standards for reporting quality measures to payers or quality organizations (this is left to the Data Exchange for Quality Measures Implementation Guide that was co-authored by NCQA).

3) Addressing Consent beyond the consent to share information between a HIPAA covered entity and entities that are not covered by HIPAA.

<br>
### Conceptual Framework

Coded SDOH content is captured across core health care activities: screening/assessment, establishing health concerns, goal setting, care planning, interventions, outcomes and reporting. The conceptual framework, illustrated below, shows how these activities form a cycle of care. Over time, a patient's progress toward care goals can be tracked and measured.


<table><tr><td><img src="ConceptualFramework2.jpg" /></td></tr></table>


<br>
### Data Modeling Framework
The diagram below shows the data model for the assessment process including the creation of health concerns, goal setting (patient-centered goals), and creation of referrals using service request and procedure/intervention. The graphic represents relationships defined in this IG for the Questionnaire, Questionnaire Response, Observation, Condition, Goal, Task, ServiceRequest and Procedure Resources. The following [link](fhir_artifacts_overview.html) will take you to a page that describes the FHIR resources and their uses as well as providing further links to each of the detailed profiles.

<table><tr><td><img src="FHIRModeling.jpg" /></td></tr></table>
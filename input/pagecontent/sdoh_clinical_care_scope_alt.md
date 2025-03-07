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
* Administrative activities such as eligibility checking, prior authorization, or billing for SDOH services. *** Do we want to explicitly cite other IGs?***

### Conceptual Framework

Coded SDOH content is captured across core health care activities: screening/assessment, establishing health concerns, goal setting, care planning, interventions, outcomes and reporting. The conceptual framework, illustrated below, shows how these activities form a cycle of care. Over time, a patient's progress toward care goals can be tracked and measured. The Gravity Project has identified [SDOH domains](ValueSet-SDOHCC-ValueSetSDOHCategory.html) that describe various types of social risk and has developed domain-specific value sets for these domains that find expression in the relevant profiles of this IG. Work is ongoing.  A current list of the domains and the active terminology work effort can be found on the Gravity Project [Terminology Pages](https://confluence.hl7.org/display/GRAV/Terminology+Workstream+Dashboard) on Confluence.

{% include img.html img="AlternateScopeOfIG.svg" caption="Figure 1: Scope of IG" %}

### Actors and Process Roles
** LM: Are the actors the people or the systems?  I had presumed they were systems, but if that's the case, the names should reflect that. **

** LM: SHould we break CP into its own row?. **

In the drawing above, each of the actors supports a set of roles that are described here:
<br>


<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
<tr>
<th>Actor</th>
<th>Process Roles</th>
<th>Relevant Profiles</th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Patient
<img src="Patient.png" height="35px" width="35px" class="figure-img img-responsive img-rounded center-block" alt="Patient}">
</td>
<td><ul><li>Responds to screening questions and is assessed based on the responses and interaction with a provider</li><li>Discusses with provider and agrees to establihsing concerns/problems (Conditions) Goals</li><li>Consents to the sharing of their information</li><li>Completes additional feedback questionnaire(s) for providers</li></ul></td>
<td><ul><li><a href="https://www.hl7.org/fhir/questionnaire.html">Questionnaire</a></li><li><a href="https://www.hl7.org/fhir/questionnaireresponse.html">QuestionnaireResponse</a></li><li>
<a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Condition</a></li><li> <a href="StructureDefinition-SDOHCC-ObservationAssessment.html">SDOHCC Observation Assessment</a></li><li><a href="StructureDefinition-SDOHCC-ObservationScreeningResponse.html">SDOHCC Observation Screening Response</a></li><li><a href="StructureDefinition-SDOHCC-TaskForPatient.html">SDOHCC Task for Patient</a></li></ul></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td>Provider
<img src="Provider.png" height="35px" width="35px" class="figure-img img-responsive img-rounded center-block" alt="Provider}"></td>
<td><ul><li>Assesses patient</li><li>Discusses with patient to establish and document concerns/problems (Conditions) and Goals</li><li>Obtains  consent to share information as appropriate</li><li>Creates referrals and solicits CBOs to fulfill them </li><li>Monitors status of referral</li><li>Provides review material or provides contact instructions to patient</li><li>Reviews feedback from patient</li></ul></td>
<td><ul><li><a href="StructureDefinition-SDOHCC-ObservationAssessment.html">SDOHCC Observation Assessment</a></li><li><a href="StructureDefinition-SDOHCC-ObservationScreeningResponse.html">SDOHCC Observation Screening Response</a></li><li><a href="StructureDefinition-SDOHCC-Condition.html">SDOHCC Condition</a></li><li><a href="StructureDefinition-SDOHCC-Goal.html">SDOHCC Goal</a></li><li><a href="StructureDefinition-SDOHCC-Consent.html">SDOHCC Consent</a></li><li> <a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a></li><li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task for Referral Management</a></li></ul></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Community Based Organization(CBO) -  possibly via Coordinating Platform (CP)
<img src="CBO.png" height="35px" width="35px" class="figure-img img-responsive img-rounded center-block" alt="Patient}">
<img src="CoordinationPlatform.png" height="35px" width="35px" class="figure-img img-responsive img-rounded center-block" alt="Patient}"></td>
<td><ul><li>Receives solicitation to complete referrals from provider</li><li>Retrieves referral and accepts or rejects solicitation</li><li>Delivers and records service requested by referral</li><li>Reports completion to referral source</li><li>Provides review material to patient</li><li>Solicits feedback from patient</li></ul></td>
<td><ul><li><a href="StructureDefinition-SDOHCC-TaskForReferralManagement.html">SDOHCC Task for Referral Management</a></li><li> <a href="StructureDefinition-SDOHCC-ServiceRequest.html">SDOHCC ServiceRequest</a></li><li><a href="StructureDefinition-SDOHCC-Procedure.html">Procedure</a></li><li><a href="StructureDefinition-SDOHCC-TaskForPatient.html">SDOHCC Task for Patient</a></li></ul></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
<tr>
<td>Aggregation</td>
<td><ul><li>Reports summary statistics on groups of patients with common SDOH conditions</li></ul></td>
<td><ul><li><a href="StructureDefinition-SDOHCC-Group.html">SDOHCC Group</a></li></ul></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

<br>


### Scope of Interactions

The scope of interactions is intended to cover all of the interactions shown in the drawing below. The focus of the current IG is interactions between a patient, provider, and CBO, with possible intermediation by a CP.  The IG supports interactions with CBOs that support either a FHIR-enabled application that can FHIR servers, or a FHIR-server based application that supports querying other FHIR servers, as well as being queried by other applications.  In the drawing below, bidirectional solid arrows reflect communication between two endpoints with FHIR servers, whereas unidirectional solid arrows reflect FHIR API calls by a FHIR-enabled application against a FHIR server.

{% include img.html img="SystemDiagram.svg" caption="Figure 2: System Interactions" %}
<br>
<br>
### Data Modeling Framework
The diagram below shows the data model for the assessment process including the creation of health concerns, goal setting (patient-centered goals), and creation of referrals using service request and procedure/intervention. The graphic represents key relationships defined in this IG for the [Questionnaire] and  [QuestionnaireResponse] resources, as well as the [Observation], [SDOHCC Condition], [SDOHCC Goal], [SDOHCC Referral Management Task], [SDOHCC ServiceRequest] and [SDOHCC Procedure] profiles.   For graphical clarity, only key references between profiles are shown (e.g., references to Patient profile are not shown). Clicking on the profiles in the drawing will link to the defining specification.

The [SDOHCC Patient Task](StructureDefinition-SDOHCC-TaskForPatient.html) provides the ability to direct the patient to seek service from a particular [SDOHCC HealthcareService](StructureDefinition-SDOHCC-HealthcareService.html), or to respond to a customer service questionnaire.

<object data="FHIRModeling.svg" type="image/svg+xml"></object>
<br/>
*Figure 3: Data Modeling Framework*

{% include markdown-link-references.md %}
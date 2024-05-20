This section describes standardized social risk assessment instruments, their benefits, and how to standardize their capture, coding and output leveraging work from the  [Regenstrief Institute](https://www.regenstrief.org/) and the [National Library of Medicine](https://www.nlm.nih.gov/) (NLM), [SDC Questionnaire], [SDC QuestionnaireResponse], and [StructureMap] to automate the creation of [SDOHCC Observation Screening Response] and [SDOHCC Condition] instances from [SDC QuestionnaireResponse].

### Introduction to Social Care Assessment Instruments
Social risk assessment instruments are used to gather information about social risks that can impact an individual’s health and well-being. The information collected through social risk assessment instruments can be used by providers, public health organizations, and policymakers to develop interventions and programs aimed at addressing the root causes of health disparities and improving health outcomes for individuals and communities.

Assessment instruments fit into the SDOH CC [Conceptual Framework](sdoh_clinical_care_scope.html) which illustrates how to: 1) incorporate screening into the care process to assess health concerns and problems.  2) use this information to help the provider and patient establish goals and identify social risk-related interventions to address those goals. 3) use responses from standardized assessment instruments to drive public health analysis of aggregated data from patient populations.

This IG builds on existing FHIR frameworks to generate Observations (e.g., [SDOHCC Observation Screening Response]) and Conditions (e.g., [SDOHCC Condition]) from LOINC-encoded assessment instruments for incorporation into the patient’s health record.

### Advantages of Standardized Social Care Assessment Instruments

The list of assessment instruments from which questions have been selected and vetted by the Gravity Project as [face-valid](https://mmshub.cms.gov/measure-lifecycle/measure-testing/evaluation-criteria/scientific-acceptability/validity#:~:text=correlation%20or%20equity-,Face%20Validity,measure%20score%20is%20not%20feasible) can be found in the [Social Determinants of Health Screening Assessments](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.126/expansion/Latest) Value Set.

Advantages of using a standardized social risk assessment instrument include:

* **Interoperability (structural and semantic)**: Standardization (e.g., using the same tested and validated questions and coding) will help to ensure that data is consistent and comparable across studies and populations.
* **Ease of use**: Standardized social risk assessment instruments are generally user-friendly and easy to administer.
* **Cost-effectiveness**: Developing (including testing and validation) custom assessment instruments is time-consuming and expensive.
* **Shared maintenance**: As research and best practices evolve, standardized assessments are more likely to keep up and reflect best current practice.

### Representing Assessment Instrument Data Using Standardized Code Systems

Gravity-authored, SDOH domain-specific value sets are hosted in the National Institutes of Health (NIH) [Value Set Authority Center (VSAC)] and used with the [SDOHCC Observation Screening Response], [SDOHCC Condition], [SDOHCC Procedure], [SDOHCC ServiceRequest] and [SDOHCC Goal] profiles.

As Gravity develops content for SDOH domains, Gravity evaluates domain-specific questions from nationally recognized assessment instruments. For assessment instrument coding, Gravity uses LOINC. The LOINC-encoded assessment instruments, from which Gravity has chosen one or more (but not necessarily all) questions, are included in the [Social Determinants of Health Screening Assessments](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.126/expansion/Latest) grouping value set in VSAC.

Questions from LOINC-encoded assessment instruments that meet Gravity’s vetting criteria are included domain-specific value sets (e.g., [Food Insecurity Screening Assessments Questions](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.3484/expansion/Latest) value set) that are used with the [SDOHCC Observation Screening Response] profile. All domain-specific value sets for assessment instrument questions are included in the [Social Determinants of Health Screening Assessments Questions](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.207/expansion/Latest) grouping value set in VSAC.

### Representing Assessment Instrument Data in a FHIR Format

Implementers should have a plan to present assessment instrument data in a computable FHIR format. The FHIR [QuestionnaireResponse] and [Observation] resources can each be used to present data captured in an assessment instrument.

#### Representing Assessment Instrument Data with QuestionnaireResponse and Observation

[QuestionnaireResponse] and [Observation] can present data from completed assessment instruments that has been captured in a structured, codified format (e.g., electronic forms). Best practice is to capture and share [QuestionnaireResponse] and [Observation]. However, decisions as to whether to use one or both resources may be influenced by the use case and the format of the structured data coming from the data sources (e.g., hospitals, health information exchanges (HIEs), social care networks (SCNs), and qualified health information organizations (QHIOs)). Gravity uses the [SDC QuestionnaireResponse] and [SDOHCC Observation Screening Response] profiles.

##### Benefits of using QuestionnaireResponse to represent assessment instrument data

Benefits of using [QuestionnaireResponse] to represent assessment instrument data include:

* QuestionnaireResponse is better suited to support use cases that require access to the format of the original assessment instrument.
* QuestionnaireResponse is always based on a FHIR [Questionnaire] and preserves the Questionnaire’s structure and complexity to provide a fully contextualized view of a completed Questionnaire. For example, QuestionnaireResponse allows the precise capture of the assessment instrument version, the exact text of the questions and answers, the order of presentation, multiple choice answer options, and whether questions were skipped. 
* Question-answer pairs in QuestionnaireResponse can be automatically transformed to FHIR Observations using [StructureMap](see section XXX below) and the [SDC Implementation Guide]).

##### Benefits of using Observation to represent assessment instrument data

Benefits of using [Observation] to represent individual question-answer pairs from an assessment instrument include:

* Observation is supported by most EMR systems and is one of the most mature FHIR resources.
* Observation is better suited than QuestionnaireResponse to support use cases that require querying the assessment instrument data. 
* A question-answer pair represented as an Observation can be retrieved and exchanged independently.  
* Observation has data elements to represent information that is not explicitly represented in QuestionnaireResponse. For example:
    * Observation.category can be used to tag Observations by SDOH domain (e.g., Food Insecurity, Housing Instability) 
    * Observation.interpretation can be used to flag Observations that might represent a health-related social need (HRSN). 
    * Observation can also indicate relationships (e.g., Observation.derivedFrom) to other artifacts. For example, an Observation may be calculated or determined based on other Observations. 
    * If assessment instrument context is needed, Observations generated from a QuestionnaireResponse can use Observation.derivedFrom to reference the QuestionnaireResponse. 

**Table 1**: Guidance on QuestionnaireResponse (QR) and Observation Screening Response (OSR) based on Usage Needs
<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
<tr>
<th>Usage Need</th>
<th>QR</th>
<th>OSR</th>
<th>Guidance Notes</th>
</tr>
</thead>
<tbody><tr>
<td><ol><li>Querying for discrete questions and answers</li> 
        <li>Computation of risk scores or inferencing rules for Conditions</li>
        <li>Original assessment instrument format is important</li></ol></td>
<td>Needed</td>
<td>Needed</td>
<td><ul><li>This is the most common scenario.</li>
        <li>Observations may not need to be created for all question-answer pairs.
        </li></ul></td>
</tr>
<tr>
<td><ol><li>Querying for discrete questions and answers</li>
        <li> Computation of risk scores or inferencing rules for creating Conditions</li>
        <li>Original assessment instrument format is not important</li></ol></td>
<td>Not Needed</td>
<td>Needed</td>
<td><ul><li>Querying and computation are much easier with Observation than QuestionnaireResponse.</li><li>It may be necessary to determine which question-answer pairs to represent as Observations (e.g., usefulness of representing a question-answer pair as an Observation may be determined by an implementer’s use case).
        </li></ul></td>
</tr>
<tr>
<td><ol><li>Original assessment instrument format is important             </li><li>No need for queries, computations, etc.
        </li></ol></td>
<td>Needed</td>
<td>Not Needed</td>
<td><ul><li>This is an unlikely usage need.</li>
        <li>It is highly likely that there will be a future need for queries or computations. Thus, it is advantageous to also create Observations, even if not currently needed.
        </li></ul></td>
</tr>
</tbody></table>


#### Additional Guidance on Questionnaire and QuestionnaireResponse

[Questionnaire] is a template (not specific to an individual) that, like [QuestionnaireResponse], is a precise representation of an assessment instrument. 

QuestionnaireResponse includes an individual’s responses and always references a [Questionnaire] via QuestionnaireResponse.questionnaire. This IG uses the [SDC QuestionnaireResponse] profile which references the [SDC Base Questionnaire].

Table 2 below provides guidance for Questionnaire.code and Questionnaire.item for several scenarios of ways in which implementers may compose assessment instruments. 

**Table 2**: Guidance on Questionnaire elements based on the composition of the assessment instrument

| Assesment Instrument Composition (what it compromises)    |  Example | Guidance for Questionnaire    |
| -------- | ---------- | -------- |
| **Standardized Assessment Instrument**: This is a single (LOINC-encoded) assessment instrument in its entirety. This assessment instrument is LOINC-encoded, and all questions and answers are LOINC-encoded. | AHC HRSN Screening Tool (Core Questions)| Questionnaire.code is the LOINC code (panel code) for the standardized assessment instrument. Questionnaire.item(s) are the LOINC codes for all questions on the standardized assessment instrument.|
|**Non-Standardized Assessment Instrument with Standardized Questions**: This assessment instrument combines questions from one or more Standardized Assessment Instruments. <u>This assessment instrument is not LOINC-encoded</u> but all its questions and answers are LOINC-encoded. | AHC HRSN Screening Tool (Core Questions) + selected questions from AHC HRSN Supplemental Questions | Questionnaire.code is a non-LOINC (e.g., local) code since the assessment instrument is not LOINC-encoded. Questionnaire.item(s) are the LOINC codes for the questions (from the standardized assessment instruments) that have been combined into a non-standardized instrument.|
|**Non-Standardized Assessment Instrument with Standardized and Non-standardized Questions**: This assessment instrument combines questions from a Standardized Assessment Instrument with some non-LOINC encoded questions. <u>This assessment instrument is not LOINC-encoded.</u> Some questions and answers are LOINC-encoded. <u>Some questions and answers are not LOINC-encoded.</u> | AHC HRSN Screening Tool (Core Questions) + selected non-LOINC encoded (e.g., local) questions | Questionnaire.code is a non-LOINC (e.g., local) code since the assessment instrument is not LOINC-encoded. Questionnaire.item(s) are the LOINC codes (for the questions from the standardized assessment instrument) and the non-LOINC (e.g., local) codes for questions that are not from a standardized, LOINC-encoded instrument.|

#### Additional Guidance on SDOHCC Observation Screening Response Elements

This section provides guidance on Observation.category and Observation.interpretation in the context of their use in the [SDOHCC Observation Screening Response] profile.

##### Categorizing Observations by SDOH domain(s) using Observation.category  

Observation.category has two, fixed category codes (survey and social-history) to indicate that a Q-A pair captured as an Observation represents an assessment (survey) related to social history. 

Additionally, Observation.category has a binding to [SDOHCC ValueSet SDOH Category] which has values to categorize an Observation by SDOH domain(s) (e.g., Food Insecurity. Housing Instability, etc.). The additional guidance and examples below are for Observation.category values from [SDOHCC ValueSet SDOH Category].

Additional guidance related to Observation.category for [SDOHCC Observation Screening Response] :

* “Observation.category: SDOH domain” (e.g., Food Insecurity) means that the Observation addresses a health-related social need (HRSN) in the specified SDOH domain.
* “Observation.category: SDOH domain” does not mean that the Observation confirms a HRSN in the specified SDOH domain. 
* Some Observations may be assigned only one value for Observation.category (from [SDOHCC ValueSet SDOH Category]) while others may be assigned more than one value. 
* When categorizing an Observation that represents a Q-A pair, Gravity recommends that the SDOH domain(s) be assigned based on the question <u>and its complete allowed set of answers</u> on an assessment instrument. 

Examples for using Observation.category to tag Observations by SDOH domain are provided below. The examples are based on the Accountable Health Communities Health-Related Social Needs Screening Tool (AHC HRSN Screening Tool).

**Example 1**: When a question and its complete answer set address only one SDOH domain, an Observation using the question for Observation.code should have only one value for Observation.category.


<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
<tr>
<th>AHC HRSN Question or Answer</th>
<th colspan="2">Observation Element</th>
</tr>
</thead>
<thead>
<tr>
<th>AHC HRSN Question</th>
<th>.code</th>
<th>.category</th>
</tr>
</thead>
<tbody><tr>
<td>Within the past 12 months, you worried that your food would run out before you got money to buy more</td>
<td>88122-7</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td></tr></tbody>
<thead>
<tr>
<th>AHC HRSN Answers</th>
<th>.value</th>
<th>.category</th>
</tr>
</thead>
<tbody><tr>
<td>Often true</td>
<td>LA28397-0</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td></tr>
<tr>
<td>Sometimes true</td>
<td>LA6729-3</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td></tr>
<tr>
<td>Never true</td>
<td>LA28398-8</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td></tr></tbody></table>

* The above question and the set of answer choices provides information about a possible HRSN related to Food Insecurity.
* Although Observation.value: LA28398-8 (Never true) does not indicate a HRSN, the Observation still provides information about Food Insecurity. 
* Therefore, regardless of the answer chosen, Gravity recommends using Observation.category: food-insecurity for an Observation from the AHC HRSC Screening Tool with Observation.code: 88122-7.

Example 2: When a question and its complete answer set address more than one SDOH domain, an Observation using the question for Observation.code may have more than one value for Observation.category.

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
<tr>
<th>AHC HRSN Question or Answer</th>
<th colspan="2">Observation Element</th>
</tr>
</thead>
<thead>
<tr>
<th>AHC HRSN Question</th>
<th>.code</th>
<th>.category</th>
</tr>
</thead>
<tbody><tr>
<td>What is your living situation today?</td>
<td>71802-3</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-homelessness">homelessness, </a><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-housing-instability">housing-instability</a></td></tr></tbody>
<thead>
<tr>
<th>AHC HRSN Answers</th>
<th>.value</th>
<th>.category</th>
</tr>
</thead>
<tbody><tr>
<td>I have a steady place to live</td>
<td>LA31993-1</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-homelessness">homelessness, </a><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-housing-instability">housing-instability</a></td></tr></tr>
<tr>
<td>I have a place to live today, but I am worried about losing it in the future</td>
<td>LA31994-9</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-homelessness">homelessness, </a><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-housing-instability">housing-instability</a></td></tr></tr>
<tr>
<td>I do not have a steady place to live (I am temporarily staying with others, in a hotel, in a shelter, living outside on the street, on a beach, in a car, abandoned building, bus or train station, or in a park</td>
<td>LA31995-6</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-homelessness">homelessness, </a><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-housing-instability">housing-instability</a></td></tr></tbody></table>

* The above question and the set of answer choices provides information about a possible HRSN related to Housing Instability or Homelessness. 
* Although Observation.value: LA31993-1 (I have a steady place to live) does not indicate a HRSN, the Observation still provides information about Homelessness and Housing Instability. 
* Observation.value: LA31994-9 (I have a place to live today, but I am worried about losing it in the future) provides information about [Housing Instability] but also shows that the individual is not experiencing [Homelessness].
* Regardless of the answer chosen, Gravity recommends using homelessness AND housing-instability for Observation.category for any Observation with Observation.code: 71802-3.

**Example 3**: Since Gravity Project terminology development for SDOH domains is an ongoing process, some domains may not yet be represented in the [SDOHCC ValueSet SDOH Category] value set. When a question and its complete answer set address an SDOH domain that is not represented in the Observation.category value set, use Observation.category: [sdoh-category-unspecified]. If desired, Observationcategory.text can be used to further specify the domain.

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
<tr>
<th>AHC HRSN Question or Answer</th>
<th colspan="3">Observation Element</th>
</tr>
</thead>
<thead>
<tr>
<th>AHC HRSN Question</th>
<th>.code</th>
<th>.category</th>
<th>.category.text</th>
</tr>
</thead>
<tbody><tr>
<td>In the past 12 months has the electric, gas, oil, or water company threatened to shut off services in your home?</td>
<td>96779-4</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-sdoh-category-unspecified">sdoh-category-unspecified</a></td>
<td>Utility Insecurity</td></tr></tbody>
<thead>
<tr>
<th>AHC HRSN Answers</th>
<th>.value</th>
<th>.category</th>
<th>.category.text</th>
</tr>
</thead>
<tbody><tr>
<td>I have a steady place to live</td>
<td>LA31993-1</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-sdoh-category-unspecified">sdoh-category-unspecified</a></td>
<td>Utility Insecurity</td></tr></tr>
<tr>
<td>I have a place to live today, but I am worried about losing it in the future</td>
<td>LA31994-9</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-sdoh-category-unspecified">sdoh-category-unspecified</a></td>
<td>Utility Insecurity</td></tr></tr>
<tr>
<td>I do not have a steady place to live (I am temporarily staying with others, in a hotel, in a shelter, living outside on the street, on a beach, in a car, abandoned building, bus or train station, or in a park</td>
<td>LA31995-6</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-sdoh-category-unspecified">sdoh-category-unspecified</a></td>
<td>Utility Insecurity</td></tr></tbody></table>

* The question and answer set above address Utility Insecurity.
* As of April 2024, Gravity Project is working on Utility Insecurity, but the domain is not fully developed. Therefore, ‘utility-insecurity’ is not in the value set for Observation.category.
* In this case, Gravity recommends using Observation.category: sdoh-category-unspecified for any Observation with Observation.code: 96779-4 and “category.text: Utility Insecurity” can be used to further specify the domain.

##### Flagging Observations for a possible HRSN need using Observation.interpretation

Observation.interpretation: POS (Positive) can be used to flag Observations for which the Q-A pair might represent a HRSN.

Additional guidance related to Observation.interpretation for SDOHCC Observation Screening Response: 

* The meaning of Observation.interpretation: POS should be evaluated in conjunction with “Observation.category: SDOH domain”. If the author of an assessment instrument provides guidance that a specific Q-A pair might represent a HRSN, Observation.interpretation: POS can be used to flag the need for follow-up by a provider or qualified health professional (QHP) to further evaluate for a HRSN in the SDOH domain(s) specified by Observation.category.
* Gravity does not advise using Observation.interpretation: NEG (Negative). Assessment instruments are generally designed so that certain answers indicate a possible HRSN. Assessment instrument authors generally do not state that certain Q-A pairs rule out a HRSN. 
* When an answer (Observation.value) does not indicate a possible HRSN, Observation.interpretation should be omitted.

Examples for using Observation.interpretation: POS and understanding its meaning in conjunction with Observation.category are provided below. The examples are based on the AHC HRSN Screening Tool which provides guidance that specific answers might indicate an unmet health-related social need.

**Example 4**: When Observation.category identifies only one SDOH domain, Observation.interpretation: POS can be used to flag that the Observation should be followed-up by a provider or QHP to confirm a HRSN or risk in that SDOH domain (e.g., Food Insecurity).

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
<tr>
<th>AHC HRSN Question or Answer</th>
<th colspan="3">Observation Element</th>
</tr>
</thead>
<thead>
<tr>
<th>AHC HRSN Question</th>
<th>.code</th>
<th>.category</th>
</tr>
</thead>
<tbody><tr>
<td>Within the past 12 months, you worried that your food would run out before you got money to buy more</td>
<td>88122-7</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td></tr></tbody>
<thead>
<tr>
<th>AHC HRSN Answers</th>
<th>.value</th>
<th>.category</th>
<th>.interpretation</th>
</tr>
</thead>
<tbody><tr>
<td>Often true</td>
<td>LA28397-0</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
<td>POS</td></tr>
<tr>
<td>Sometimes true</td>
<td>LA6729-3</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
<td>POS</td></tr></tr>
<tr>
<td>Never true</td>
<td>LA28398-8</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td></tr></tbody></table>

**Example 5**: When Observation.category identifies more than one SDOH domain, Observation.interpretation: POS can be used to flag the Observation as positive for a possible HRSN in at least one of the selected SDOH categories. However, in this case, determining which SDOH category is positive for the identified HRSN requires further evaluation of the answer (Observation.value).

In the example below, Observation.category has two SDOH codes because the question and its complete set of answers address Housing Instability and Homelessness. However, by definition, Housing Instability and Homelessness cannot exist concurrently. In this case, Observation.value: LA31995-6 indicates that the Observation is positive for a possible Housing Instability HRSN and Observation.value: LA31994-9 indicates that the Observation is positive for a possible Homelessness HRSN.

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
<tr>
<th>AHC HRSN Question or Answer</th>
<th colspan="3">Observation Element</th>
</tr>
</thead>
<thead>
<tr>
<th>AHC HRSN Question</th>
<th>.code</th>
<th>.category</th>
</tr>
</thead>
<tbody><tr>
<td>What is your living situation today?</td>
<td>71802-3</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-homelessness">homelessness, </a><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-housing-instability">housing-instability</a></td></tr></tbody>
<thead>
<tr>
<th>AHC HRSN Answers</th>
<th>.value</th>
<th>.category</th>
<th>.interpretation</th>
</tr>
</thead>
<tbody><tr>
<td>I have a steady place to live</td>
<td>LA31993-1</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-homelessness">homelessness, </a><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-housing-instability">housing-instability</a></td></tr></tr>
<tr>
<td>I have a place to live today, but I am worried about losing it in the future</td>
<td>LA31994-9</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-homelessness">homelessness, </a><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-housing-instability">housing-instability</a></td>
<td>POS</td></tr></tr>
<tr>
<td>I do not have a steady place to live (I am temporarily staying with others, in a hotel, in a shelter, living outside on the street, on a beach, in a car, abandoned building, bus or train station, or in a park</td>
<td>LA31995-6</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-homelessness">homelessness, </a><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-housing-instability">housing-instability</a></td>
<td>POS</td></tr></tbody></table>

**Example 6**: Gravity does not advise using Observation.interpretation: NEG (Negative) unless a provider or QHP has evaluated the individual and ruled out the HRSN. Regardless of SDOH Observation.category, when an answer (Observation.value) is provided that does not indicate a HRSN, Observation.interpretation should be omitted.

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
<thead>
<tr>
<th>AHC HRSN Question or Answer</th>
<th colspan="3">Observation Element</th>
</tr>
</thead>
<thead>
<tr>
<th>AHC HRSN Question</th>
<th>.code</th>
<th>.category</th>
</tr>
</thead>
<tbody><tr>
<td>Within the past 12 months, you worried that your food would run out before you got money to buy more</td>
<td>88122-7</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td></tr></tbody>
<thead>
<tr>
<th>AHC HRSN Answers</th>
<th>.value</th>
<th>.category</th>
<th>.interpretation</th>
</tr>
</thead>
<tbody><tr>
<td>Often true</td>
<td>LA28397-0</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td><td></td>
</tr>
<tr>
<td>Sometimes true</td>
<td>LA6729-3</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
<td></td></tr>
<tr>
<td>Never true</td>
<td>LA28398-8</td>
<td><a href= "https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
<td>OMIT</td></tr></tbody></table>

**Example 7**: When a question is presented to an individual and none of the answers are selected, use Observation.dataAbsentReason: unknown (or a subtype), and Observation.interpretation should be omitted.

<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:100%;">
    <thead>
        <tr>
            <th>AHC HRSN Question or Answer</th>
            <th colspan="3">Observation Element</th>
        </tr>
    </thead>
    <thead>
        <tr>
            <th>AHC HRSN Question</th>
            <th>.code</th>
            <th>.category</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Within the past 12 months, you worried that your food would run out before you got money to buy more</td>
            <td>88122-7</td>
            <td><a href="https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
        </tr>
    </tbody>
    <thead>
        <tr>
            <th>AHC HRSN Answers</th>
            <th>.value</th>
            <th>.category</th>
            <th>.interpretation</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Often true</td>
            <td>LA28397-0</td>
            <td><a href="https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
            <td></td>
        </tr>
        <tr>
            <td>Sometimes true</td>
            <td>LA6729-3</td>
            <td><a href="https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
            <td></td>
        </tr>
        <tr>
            <td>Never true</td>
            <td>LA28398-8</td>
            <td><a href="https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
            <td></td>
        </tr>
    </tbody>
    <thead>
        <tr>
            <th>AHC HRSN Answers</th>
            <th>.dataAbsentReason</th>
            <th>.category</th>
            <th>.interpretation</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>No Answer</td>
            <td>unknown (or subtype)</td>
            <td><a href="https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/CodeSystem-SDOHCC-CodeSystemTemporaryCodes.html#SDOHCC-CodeSystemTemporaryCodes-food-insecurity">food-insecurity</a></td>
            <td>OMIT</td>
        </tr>
    </tbody> 
</table>

#### Using Observation Screening Response to Group Observations

In addition to representing Observation instances, SDOHCC Observation Screening Response can be used as an Observation Grouping to reference (via Observation.member) the Observation Screening Response instances that result from an individual completing an assessment instrument.

If a QuestionnaireResponse has been created for the assessment instrument, Observation Grouping, while not prohibited, is generally redundant since the member Observations can directly reference QuestionnaireResponse (via derivedFrom) for assessment instrument context.

Observation Grouping is most useful when a QuestionnaireResponse has not been created. For an Observation Grouping example, see [SDOHCC Observation Response NHANES Grouping Example].

For several of the common ways in which implementors may compose assessment instruments, Table 3 provides guidance for Observation.code and Observation.member for an Observation Grouping.

**Table 3**: Guidance on Observation Grouping based on the composition of the assessment instrument

INSERT TABLE


### Using StructureMap to Generate Observations or Conditions from QuestionnaireResponse

This IG has adopted the map-based approach using the FHIR StructureMap resource to define and share rules for generating Observations Conditions (unconfirmed health concerns) from QuestionnaireResponse.

Ideally, in the future, a StructureMap instance could be provided by a Questionnaire steward for a standardized assessment instrument to ensure consistency in the Observations and Conditions (i.e., unconfirmed health concerns) generated from that assessment instrument. A repository of vetted, centrally maintained StructureMaps could significantly help to promote semantic and structural interoperability for standardized assessment instruments as well as reduce provider and implementer burden.

#### Using StructureMap to Generate Observations

This IG supports using SDC StructureMap to generate SDOHCC Observation Screening Response instances from QuestionnaireResponse. When using StructureMap to generate Observations from QuestionnaireResponse, rules to align Q-A pairs from a QuestionnaireResponse with Observation.code and Observation.value are generally straightforward. Additional rules, such as rules for assigning Observation.category or Observation.interpretation to a Q-A pair, may be more complex and would ideally be determined with input from assessment instrument authors. 

#### Using StructureMap to Generate Conditions

This IG also supports using SDC StructureMap to generate Conditions (unconfirmed health concerns) for some Q-A pairs from QuestionnaireResponse. Applying rules to Q-A pairs, or combinations of Q-A pairs, to generate Conditions may be complex.

Prior to using SDC StructureMap to generate Conditions from QuestionnaireResponse, implementers should define a clear process for 1) whether this will be done, 2) the rules for generating a Condition from a Q-A pair (or pairs) and 3) verification by a provider or qualified health professional.

**Note**: Regardless of whether Conditions  (unconfirmed health concerns) are generated based on guidance provided by assessment instrument authors, coding resources (e.g., Gravity Project’s Resource for the AHC HRSN Screening Tool) or ‘vetted’ StructureMaps, documentation of HRSNs based on assessment instruments should be verified by a care team member via personal interaction with the individual being screened.

#### Additional Detailed Technical Guidance for StructureMap

The StructureMap resource examples in this IG are generated using the FHIR Mapping Language. This language is then used to generate the StructureMap instances. Authoring the maps in a textual language is much simpler than attempting to craft the XML or JSON StructureMap instances directly. The mapping language also works regardless of the syntax used for the QuestionnaireResponse, i.e., it works the same for JSON, XML and RDF instances.

Instructions and tutorials on how to use the FHIR Mapping Language to convert and transform resources are found here. This page also includes references to existing open-source implementations that are capable of compiling mapping language instances into FHIR StructureMaps as well as being able to ‘execute’ maps - i.e., convert a QuestionnaireResponse into a transaction Bundle of other resources. Implementers are encouraged to leverage one of these existing community-developed implementations rather than creating their own. This will save work and minimize the likelihood of introducing implementation-specific errors into the transformation process.

Therefore, the overall process for supporting this transformation process is as follows:

1. Identify the Questionnaire that will be used to gather SDOH-related information.
2. Determine what Observation and Condition resources will need to be created to be searchable within the FHIR record.
3. Using the examples provided in this guide as a foundation, create a mapping language file that performs the necessary transformation.
4. Compile the mapping file into a StructureMap instance (e.g., using the FHIR Java validator tool).
5. Execute the map against a QuestionnaireResponse.
6. Execute the resulting transaction Bundle to create the relevant Observations and Conditions on the desired server.
7. Test the map through the completion of the Questionnaire and validate the resulting Observations and Conditions.

Note that the creation of the mapping file and compiled StructureMap only needs to be performed once per Questionnaire.

For more information on StructureMap (e.g., Designing Questionnaires to support data extraction) and the StructureMap-based extraction mechanism (considerations, error handling and other details) please refer to the Structured Data Capture Implementation Guide (SDC IG).

### Process for Implementing Assessment Instruments

In summary, the process followed by this IG for implementing assessment instruments vetted by Gravity is summarized below. The process can also be applied to other assessment instruments.

* **Use a LOINC-encoded assessment instrument**: LOINC Components and LOINC Answer Lists standardize the coding and facilitate leveraging the open-source NLM LHC-Forms Widget.
* **Convert the LOINC-encoded assessment instrument to an [SDC Questionnaire]**: The open-source NLM LHC-Forms Widget supports this step by rendering input forms based on FHIR Questionnaire for web-based applications and can be used to build and edit FHIR Questionnaires. For some assessment instruments, this step may include establishing calculation logic to define the result of some questions as a function of answers to other questions (e.g., where one or more question determines an answer to another “question” (not directly answered by the patient) as in Hunger Vital Sign Question 3).
* **Instantiate the [SDC Questionnaire]**: Using an appropriate application (e.g., the open-source NLM FHIR SDC SMART App) create an SDC QuestionnaireResponse
* **Develop translation logic to use StructureMap** (this logic should generally be provided by the assessment instrument steward) and a validation tool to generate the following resource instances from the SDC QuestionnaireResponse:
    * SDOHCC Observation Screening Response - to represent a question-answer pair(s) from the assessment instrument
    Any Observations that are produced SHALL include a derivation link (derivedFrom) to the QuestionnaireResponse. Some systems may opt to represent all question-answer pairs as Observations while others may not find this useful and may feel it creates ‘noise’ in the EHR. Key questions for deciding which question-answer pairs should be represented as Observations include but are not limited to:
        * Is it a score or other key measure which may determine whether a problem is recorded in the patient’s record?
        * Is it something a provider would likely search for or for which a provider might want to follow trends?
        * Is it needed as part of the calculation of a measure?
    * SDOHCC Condition - to represent any health concerns identified by the assessment instrument
    These are Conditions (unconfirmed health concerns) that should be verified by a care team member via personal interaction with the individual being screened.
    * SDOHCC Observation Screening Response Grouping - to group any Observations associated with the assessment instrument. Of note, for Observations that can reference a QuestionnaireResponse (as in this process), this is generally redundant but not prohibited.

### Assessment Instrument Examples

This IG provides examples of the FHIR artifacts mentioned above for the following assessment instruments.

#### Example: Hunger Vital Sign (HVS)

This IG includes a complete example of the Hunger Vital Sign (HVS) assessment instrument including:

* a SDC HVS Questionnaire
* a SDC HVS QuestionnaireResponse
* a StructureMap that takes the QuestionnaireResponse and creates the appropriate SDOHCC Observation Screening Response and SDOHCC Condition instances
* a SDOHCC Observation Screening Response instance used to record Question 3 on the assessment instrument (computed based on the answers to Questions 1 and 2)
* a SDOHCC Condition instance that could be used to record the health concern based on the assessment instrument results

#### Example: Protocol for Responding to and Assessing Patients’ Assets, Risks, and Experiences (PRAPARE)

This IG includes a partial example of the PRAPARE assessment instrument including:

* a SDC PRAPARE Questionnaire
* a SDC PRAPARE Questionnaire Response
* a StructureMap that takes the QuestionnaireResponse and creates the appropriate SDOHCC Observation Screening Response and SDOHCC Condition instances
* multiple SDOHCC Observation Screening Response instances used to record some of the question and answers on the assessment instrument (not all questions are provided in these examples)
    * Employment Status
    * Housing Status
    * Child Care Need
    * Clothing Need
* two SDOHCC Condition instances to record the health concerns based on the results of the assessment instrument
    * Unemployed
    * Homeless




 ----------------------------------------------------------------------------------------------------

<sup>1</sup> [Accountable Health Communities Health-Related Social Needs Screening Tool Citation and Notification Information](https://www.cms.gov/priorities/innovation/media/document/ahcm-screening-tool-citation)

<sup>2</sup> Hunger Vital Sign™ Hager, E. R., Quigg, A. M., Black, M. M., Coleman, S. M., Heeren, T., Rose-Jacobs, R., Cook, J. T., Ettinger de Cuba, S. A., Casey, P. H., Chilton, M., Cutts, D. B., Meyers A. F., Frank, D. A. (2010). Development and Validity of a 2-Item Screen to Identify Families at Risk for Food Insecurity. Pediatrics, 126(1), 26-32. doi:10.1542/peds.2009-3146.  

<sup>3</sup> Protocol for Responding to and Assessing Patients’ Assets, Risks and Experiences (PRAPARE®) and its resources are proprietary information of the National Association of Community Health Centers (NACHC). For more information, visit www.nachc.org/prapare. The example is included with permission.

 {% include markdown-link-references.md %}

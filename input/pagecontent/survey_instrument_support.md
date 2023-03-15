This section introduces Social Care Assessment instruments and describes how they fit into the overall process described by this IG.

Note: The concept of screening and assessments described in US Core Version 6.0.0 includes two ways to generate/record SDOH Observations.

Using screening and assessment tools and the FHIR Resource US Core Observation Screening Assessment Profile. These can be completed by anyone (as a self-report by the person of concern or by others who interact with the person).
Using a practitioner’s assertion about a person’s health status that in independent from an assessment/screening question (FHIR Resource US Core Simple Observation Profile)  The practitioner gathers input about a patient (including potential review of completed assessment tools) and documents an observation.

This IG section describes the first type above.

### Introduction to Social Care Assessment Instruments
Social care assessment instruments are survey tools used to gather information about the social and economic factors that can impact an individual's health and well-being. The information collected through a social care survey can be used by healthcare providers, public health organizations, and policymakers to develop interventions and programs aimed at addressing the root causes of health disparities and improving health outcomes for individuals and communities. This IG builds on existing FHIR frameworks to generate Observations, Conditions and Goals from the assessment instruments for incorporation into the Patient's health record. Although the Gravity Project has developed a curated collection of assessment instruments, it is possible to leverage the capabilities of this IG without using assessment instruments.

Using a standardized social care assessment instrument has several advantages:
* **Validity and reliability**: Standard social care assessment instruments have been validated and tested for reliability, meaning that they have been proven to provide accurate and consistent results.
* **Comparability**: Standard social care assessment instruments allow for comparability between different studies and populations, as they use the same questions and measurements.
* **Ease of use**: Standard social care assessment instruments are designed to be user-friendly and easy to administer.
* **Consistency**: Using standard social care assessment instruments helps to ensure that data collection is consistent, both within a study and across studies.
* **Cost-effective**: Developing a custom assessment instrument can be time-consuming and expensive, especially if you need to test and validate the instrument.

The Gravity Project has curated assessment instruments that cover a broad range of social risks.  See a description of these instruments [here][SDOHCCObservationScreeningResponse].

Assessment instruments fit into the [SDOH Clinical Care framework](sdoh_clinical_care_scope_alt.html#conceptual-framework). Providers incorporate screening into the care process to assess concerns and problems.  This information is used to help the Provider and Patient establish goals, and identify social risk-related interventions that would address those goals.  Responses to standard assessment instruments can also be used to drive public health analysis of aggregated data from patient populations, since both the answers to the questions, the questions, and the instrument from which they were drawn can be incorporated into the analysis.

### Standardization of Social Care Assessment Instruments
Another benefit to using standardized SDOH Assessment Instruments is to automate the conversion of the responses (values) to the questions (assessment items) into standardized terminology expressing the SDOH observation. We represent the instruments using [Questionnaire] for the item and [QuestionnaireResponse] for the value of the item. For each SDOH domain, we select [standard sets of questions][Assessment Instrument Spreadsheet Guidance]  leveraging existing validated assessment instruments selected [Regenstrief Institute](https://www.regenstrief.org/) and the  [National Library of Medicine](https://www.nlm.nih.gov/) (NLM) to standardize the capture, coding and output of social care assessment instruments.
We define common canonical URLs, linkIds and allowed answer codes.

LOINC codes are used to describe the results of the question and answer from the social care assessment instrument since they are the only terminology system that has the capability of fully encoding standard assessment tools.  While the output of the assessment process is an SDC QuestionnaireResponse, we convert the questions and answers to FHIR Observation and Condition resources to facilitate searching for specific survey results (something that is difficult to do with an SDC QuestionnaireResponse) and to identify the health concerns so they can be communicated and promoted to problems on the problem list.

An Observation is used to group all of the observations created by the QuestionnaireResponse using the Observation.hasMember reference to each of the individual observations. This approach is consistent with US Core and there are examples presented later in IG for both of the example Questionnaires.

### Developing a New Assessment Instrument
Note, most users of this guide will use standard assessment instruments.  This description is provided for those organizations that need to use different instruments, either because they are dealing with determinants for which this IG has not yet identified a standard instrument, or oganizational policy requires the use of specific instruments.

Developing a new assessment instrument for incorporation into the process described in this IG involves developing the assessment, calculation logic, and conversion logic:
* **Develop the assessment Instrument**:  The assessment is built from a set of survey as [LOINC Components](https://loinc.org/kb/faq/structure/) with associated [LOINC Answer Lists](https://loinc.org/forums/topic/answer-lists/).
* **Develop the [SDC FHIR Questionnaire]**:  The assessment question and answers are incorporated into an [SDC FHIR Questionnaire] which also includes calculation logic that defines the result of some questions as a function of the answers to other questions.  There are tools that support this step (e.g., the open source NLM [LHC-Forms Widget](https://lhcforms.nlm.nih.gov/lhcforms))
* **Develop the Conversion Logic**: The results of the instrument are captured in a [SDC QuestionnaireResponse], and this in turn can be converted to Observations and Conditions as using a [StructureMap].  The structure map logic needs to be developed.  See the [Mapping Instructions](mapping_instructions.html) page for more on FHIR structure maps. Executing the Structure Map on a QuestionaireResponse produces:
  * [Observation][SDOHCC Observation Screening Reponse] (each representing an assessment question-answer(s) pair),
  * An  [Observation][SDOHCC Observation Screening Reponse] that groups the Observations associated with a social care assessment together,
  * As many [Condition(s) resources](StructureDefinition-SDOHCC-Condition.html) indicating Health Concerns identified by the social care assessment instrument answers that should be coded with [US Core Condition codes](http://hl7.org/fhir/us/core/ValueSet/us-core-condition-code).


### How Assessment Instruments Are Incorporated Into the Clinical Workflow

To use an assessment instrument in practice, the artifacts produced in the previous section are used.
* **Patient Answers a Questionnaire**:  The Patient is sent a [SDC FHIR Questionnaire] and fills it out. The filled out questionnaire is returned as a [SDC QuestionnaireResponse]
* **QuestionnaireResponse is Processed Using a StructureMap**:  The resulting QuestionnaireResponse is processed by a StructureMap

Example output and [StructureMap] are available in this IG for the [Hunger Vital Signs](https://loinc.org/88121-9/) and [PRAPARE](https://loinc.org/93025-5/) social care assessment instruments.

#### Hunger Vital Sign (HVS) Survey Example

This implementation guide includes a complete example[^1] of the [Hunger Vital Sign (HVS) Survey](https://loinc.org/88121-9/) representation including:

* an [SDC Questionnaire](Questionnaire-SDOHCC-QuestionnaireHungerVitalSign.html)
* an [SDC QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html)
* a [StructureMap](StructureMap-SDOHCC-StructureMapHungerVitalSign.html) that takes the [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html) and creates the appropriate Observations and Condition resources
* an [Observation](Observation-SDOHCC-ObservationResponseHungerVitalSignGroupingExample.html) used to group the specific questions and answers from survey
* multiple Observations used to record the question and answers for each of the elements of the survey
  * [Question 1](Observation-SDOHCC-ObservationResponseHungerVitalSignQuestion1Example.html)
  * [Question 2](Observation-SDOHCC-ObservationResponseHungerVitalSignQuestion2Example.html)
  * [Question 3](Observation-SDOHCC-ObservationResponseHungerVitalSignQuestion3Example.html) (computed)
* a [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) resource to record the health concern based on the result of the survey

[^1]: The Hunger Vital Sign Survey is © 2010 Dr. Erin Hager and Dr. Anna Quigg and the Children’s HealthWatch research team, and the example is included with permission.

#### Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences (PRAPARE) Survey Example

This implementation guide includes a partial example of the [Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences ([PRAPARE](https://loinc.org/93025-5/)) Survey[^2] representation including:

* an [SDC Questionnaire](Questionnaire-SDOHCC-QuestionnairePRAPARE.html)
* an [SDC Questionnaire Response](QuestionnaireResponse-SDOHCC-QuestionnaireResponsePRAPAREExample.html)
* a [StructureMap](StructureMap-SDOHCC-StructureMapPRAPARE.html) that takes the [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponsePRAPAREExample.html) and creates the appropriate Observations and Condition resources
* multiple Observations used to record the question and answers for a select set of the survey elements (not all questions are provided in these examples)
  * [Employment Status](Observation-SDOHCC-ObservationResponsePRAPAREEmploymentStatusExample.html)
  * [Housing Status](Observation-SDOHCC-ObservationResponsePRAPAREHousingStatusExample.html)
  * [Child Care Need](Observation-SDOHCC-ObservationResponsePRAPAREChildCareNeedExample.html)
  * [Clothing Need](Observation-SDOHCC-ObservationResponsePRAPAREClothingNeedExample.html)
* two Condition resources to record the health concerns based on the results of the survey
  * [Unemployed](Condition-SDOHCC-ConditionUnemployedExample.html)
  *  [Homeless](Condition-SDOHCC-ConditionHomelessExample.html)

[^2]: This example comes from the national PRAPARE social determinants of health assessment protocol, developed and © 2019 by the National Association of Community Health Centers (NACHC), in partnership with the Association of Asian Pacific Community Health Organization (AAPCHO), the Oregon Primary Care Association (OPCA), and the Institute for Alternative Futures (IAF). For more information, visit [www.nachc.org/prapare](http://www.nachc.org/prapare). It is included witih permission.


 {% include markdown-link-references.md %}
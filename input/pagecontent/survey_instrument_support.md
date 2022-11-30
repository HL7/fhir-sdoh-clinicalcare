###  Enabling Survey Instruments

This Implementation Guide uses the work from both the [Regenstrief Institute](https://www.regenstrief.org/) and the  [National Library of Medicine](https://www.nlm.nih.gov/) (NLM) to standardize the capture, coding and output of SDOH risk surveys. The purpose is to use standardized risk surveys to identify health concerns that can be validated by the patient and provider and, where appropriate, promoted to problems on the problem list.  The process ensures that the health concerns and ultimately the problems have appropriate [US Core Condition codes](http://hl7.org/fhir/us/core/ValueSet/us-core-condition-code) consistent with the intent of the risk survey and consensus work by the Gravity Project. The alternative is to have each provider perform the specific coding.  While this method is supported in the exchange standard created by this IG, it introduces significant variability in the coding process.  LOINC codes are used to describe the results of the question and answer from the risk survey since they are the only terminology system that has the capability of fully encoding standard survey tools.  While the output of the survey process is an SDC QuestionnaireResponse, we convert the questions and answers to FHIR Observation and Condition resources to facilitate searching for specific survey results (something that is very hard to do with an SDC QuestionnaireResponse) and to identify the health concerns so they can be communicated and promoted to problems on the problem list. 

An Observation is used to group all of the observations created by the QuestionnnaireResponse using the Observation.hasMember Reference to each of the individual observations. This approach is consistent with US Core and there are examples presented later in IG for both of the example Questionnaires. 

The following diagram depicts the suggested approach to incorporating risk surveys into the overall information flow for SDOH.

1. Establish complete survey as [LOINC Components](https://loinc.org/kb/faq/structure/) with [LOINC Answer Lists](https://loinc.org/forums/topic/answer-lists/).  

2. Establish calculation logic for the [SDC FHIR Questionnaire](http://hl7.org/fhir/us/sdc/sdc-questionnaire.html) (e.g., where two questions determine the answer to another "question").

3. Conversion of the LOINC survey to an [SDC FHIR Questionnaire](http://hl7.org/fhir/us/sdc/sdc-questionnaire.html) using an appropriate conversion tool (Note: the reference implementation of this IG uses the open source NLM [LHC-Forms Widget](https://lhcforms.nlm.nih.gov/lhcforms)).

4. Execute the [SDC FHIR Questionnaire](http://hl7.org/fhir/us/sdc/sdc-questionnaire.html) using an appropriate application (Note: the reference implementation of this IG uses the open source NLM [SDC Questionnaire App](https://lhcforms.nlm.nih.gov/sdc)) and create an [SDC QuestionnaireResponse](http://hl7.org/fhir/us/sdc/sdc-questionnaireresponse.html).

5. Using a [StructureMap](http://www.hl7.org/fhir/structuremap.html) and an appropriate validation tool convert the [SDC Questionnaire Response](http://hl7.org/fhir/us/sdc/sdc-questionnaireresponse.html) to:

   - LOINC Coded [Observation resources](StructureDefinition-SDOHCC-ObservationScreeningResponse.html) (each representing a survey question-answer(s) pair), 

   - An  [Observation resource](StructureDefinition-SDOHCC-ObservationScreeningResponse.html) that groups the Observations associated with a risk assessment together,

   - and as many [Condition(s) resources](StructureDefinition-SDOHCC-Condition.html) indicating Health Concerns identified by the risk survey tool answers that should be coded with [US Core Condition codes](http://hl7.org/fhir/us/core/ValueSet/us-core-condition-code).

      Each of the above resources SHALL be compliant with the linked profiles in this IG.

6. Example output and [StructureMap](http://www.hl7.org/fhir/structuremap.html) are available in this IG for the [Hunger Vital Signs](https://loinc.org/88121-9/) and [PRAPARE](https://loinc.org/93025-5/) risk assessment surveys.

*see the [Mapping Instructions](mapping_instructions.html) page for instructions on FHIR structure maps.*

<table><tr><td><img src="enablingsurveyinstruments.jpg" /></td></tr></table>

#### [Hunger Vital Sign (HVS) Survey](https://loinc.org/88121-9/) Example

This implementation guide includes a complete example of the HVS Survey representation as:

1) an [SDC Questionnaire](Questionnaire-SDOHCC-QuestionnaireHungerVitalSign.html)

2) an [SDC QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html)

3) a [StructureMap](StructureMap-SDOHCC-StructureMapHungerVitalSign.html) that takes the [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponseHungerVitalSignExample.html) and creates the appropriate Observations and Condition resources

4) an [Observation](Observation-SDOHCC-ObservationResponseHungerVitalSignGroupingExample.html) used to group the specific questions and answers from survey

5) multiple Observations used to record the question and answers for each of the elements of the survey

- 	[Question 1](Observation-SDOHCC-ObservationResponseHungerVitalSignQuestion1Example.html)

- 	[Question 2](Observation-SDOHCC-ObservationResponseHungerVitalSignQuestion2Example.html)

- 	[Question 3](Observation-SDOHCC-ObservationResponseHungerVitalSignQuestion3Example.html) (computed)

6)  a [Condition](Condition-SDOHCC-ConditionFoodInsecurityExample.html) resource to record the health concern based on the result of the survey



The Hunger Vital Sign Survey is included as an example with permission 

© 2010 Dr. Erin Hager and Dr. Anna Quigg and the Children’s HealthWatch research team.



#### [Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences (PRAPARE) Survey](https://loinc.org/93025-5/) Example

This implementation guide includes a partial example of the PRAPARE Survey representation as:

1) an [SDC Questionnaire](Questionnaire-SDOHCC-QuestionnairePRAPARE.html)

2) an [SDC Questionnaire Response](QuestionnaireResponse-SDOHCC-QuestionnaireResponsePRAPAREExample.html)

3) a [StructureMap](StructureMap-SDOHCC-StructureMapPRAPARE.html) that takes the [QuestionnaireResponse](QuestionnaireResponse-SDOHCC-QuestionnaireResponsePRAPAREExample.html) and creates the appropriate Observations and Condition resources

4) multiple Observations used to record the question and answers for a select set of the survey elements (not all questions are provided in these examples)

- [Employment Status](Observation-SDOHCC-ObservationResponsePRAPAREEmploymentStatusExample.html)
- [Housing Status](Observation-SDOHCC-ObservationResponsePRAPAREHousingStatusExample.html)
- [Child Care Need](Observation-SDOHCC-ObservationResponsePRAPAREChildCareNeedExample.html)  
- [Clothing Need](Observation-SDOHCC-ObservationResponsePRAPAREClothingNeedExample.html) 

5)  two Condition resources to record the health concerns based on the results of the survey

- [Unemployed](Condition-SDOHCC-ConditionUnemployedExample.html)
- [Homeless](Condition-SDOHCC-ConditionHomelessExample.html)



Portions of the PRAPARE Survey are included as an example with permission 

 © 2019. This item comes from the national PRAPARE social determinants of health assessment protocol, developed and owned by the National Association of Community Health Centers (NACHC), in partnership with the Association of Asian Pacific Community Health Organization (AAPCHO), the Oregon Primary Care Association (OPCA), and the Institute for Alternative Futures (IAF). For more information, visit [www.nachc.org/prapare](http://www.nachc.org/prapare)
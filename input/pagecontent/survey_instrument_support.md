###  Enabling Survey Instruments

This Implementation Guide utilizes the work from both [Regenstrief](https://www.regenstrief.org/) and [National Libraries of Medicine](https://www.nlm.nih.gov/) (NLM) to utilize their capabilities to standardize the coding and output of SDOH risk surveys.

The following diagram depicts the suggested approach to incorporating risk surveys into the overall information flow for SDOH.

1. Establish complete survey as [LOINC Components](https://loinc.org/kb/faq/structure/) with [LOINC Answer Lists](https://loinc.org/forums/topic/answer-lists/).  

2. Establish calculation logic for the [SDC FHIR Questionnaire](http://hl7.org/fhir/us/sdc/sdc-questionnaire.html) (e.g., where two questions determine the answer to another "question").

3. Conversion of the LOINC survey to an S[DC FHIR Questionnaire](http://hl7.org/fhir/us/sdc/sdc-questionnaire.html) using an appropriate conversion tool (Note:the reference implementation of this IG use the open source NLM [LHC-Forms Widget](https://lhcforms.nlm.nih.gov/lhcforms)) .

4. Execute the [SDC FHIR Questionnaire]((http://hl7.org/fhir/us/sdc/sdc-questionnaire.html) using an appropriate application (Note: the reference implementation of this IG uses the open source NLM [SDC Questionnaire App](https://lhcforms.nlm.nih.gov/sdc)) and create an [SDC QuestionnaireResponse](http://hl7.org/fhir/us/sdc/sdc-questionnaireresponse.html).

5. Using a [StructureMap](http://www.hl7.org/fhir/structuremap.html) and an appropriate validation tool convert the [SDC Questionnaire Response](http://hl7.org/fhir/us/sdc/sdc-questionnaireresponse.html) to:

   1. LOINC Coded [Observation resources](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ObservationScreeningResponse.html) (each representing a survey question-answer(s) pair), 

   2. A group [Observation resource](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ObservationScreeningResponse.html) to group the Observations associated with a risk assessment together,

   3. and as many [Condition(s) resources](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-Condition.html) indicating Health Concerns identified by the risk survey tool answers that should be coded with both [SNOMED-CT](http://hl7.org/fhir/R4/valueset-condition-code.html) (required) and [ICD-10-CM](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetICD10CM.html) (if available) 

      Each of the above resources SHALL be compliant with the linked profiles in this IG.

      

6. Example output and [StructureMap](http://www.hl7.org/fhir/structuremap.html) are available in this IG for the [Hunger Vital Signs](https://loinc.org/88121-9/) and [PRAPARE](https://loinc.org/93025-5/) risk assessment surveys.

<table><tr><td><img src="enablingsurveyinstruments.jpg" /></td></tr></table>
Instance: SDOHCC-QuestionnaireResponseHungerVitalSignExample
InstanceOf: SDCQuestionnaireResponse
Title: "SDOHCC QuestionnaireResponse Hunger Vital Sign Example"
Description: "An example of an SDC QuestionnaireResponse that represents questions and selected answers from the LOINC Hunger Vital Sign [HVS] questionnaire (LOINC code 88121-9). The example is generated using the LHC-Forms SDC Questionnaire App."
Usage: #example
* questionnaire = "http://hl7.org/fhir/us/sdoh-clinicalcare/Questionnaire/SDOHCC-QuestionnaireHungerVitalSign"
* questionnaire.extension.url = "http://hl7.org/fhir/StructureDefinition/display"
* questionnaire.extension.valueString = "SDOHCC Questionnaire Hunger Vital Sign"
* status = #completed
* subject = Reference(pat-53234) "COLIN ABBAS"
* authored = "2020-09-10T21:56:54.671Z"
* source = Reference(pat-53234) "COLIN ABBAS"
* item[0].linkId = "/88122-7"
* item[=].text = "Within the past 12 months we worried whether our food would run out before we got money to buy more"
* item[=].answer.valueCoding = $loinc#LA28397-0 "Often true"
* item[+].linkId = "/88123-5"
* item[=].text = "Within the past 12 months the food we bought just didn't last and we didn't have money to get more"
* item[=].answer.valueCoding = $loinc#LA28397-0 "Often true"
* item[+].linkId = "/88124-3"
* item[=].text = "Food insecurity risk"
* item[=].answer.valueCoding = $loinc#LA19952-3 "At risk"
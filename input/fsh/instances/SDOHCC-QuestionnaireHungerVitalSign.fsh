Instance: SDOHCC-QuestionnaireHungerVitalSign
InstanceOf: SDCQuestionnaireExtractStructureMap
Title: "SDOHCC Questionnaire Hunger Vital Sign"
Description: "A Questionnaire instance that represents the questions and answers from the LOINC Hunger Vital Sign [HVS] questionnaire (LOINC code 88121-9)."
Usage: #example
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "worriedAnsCode"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%resource.item.where(linkId='/88122-7').answer.value.code"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "ranOutAnsCode"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%resource.item.where(linkId='/88123-5').answer.value.code"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "riskCodes"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "'LA28397-0'.combine('LA6729-3')"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "riskStatus"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%riskCodes contains %worriedAnsCode or %riskCodes contains %ranOutAnsCode"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "answeredEitherQ"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%worriedAnsCode.exists() or %ranOutAnsCode.exists()"
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap"
* extension[=].valueCanonical = "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureMap/SDOHCC-StructureMapHungerVitalSign"
* url = "http://hl7.org/fhir/us/sdoh-clinicalcare/Questionnaire/SDOHCC-QuestionnaireHungerVitalSign"
* name = "SDOHCCQuestionnaireHungerVitalSign"
* title = "SDOHCC Questionnaire Hunger Vital Sign"
* status = #draft
* subjectType = #Patient
* date = "2020-09-01T04:01:34+00:00"
* item[0].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item[=].extension.valueCodeableConcept.text = "Drop down"
* item[=].linkId = "/88122-7"
* item[=].code = $loinc#88122-7 "Within the past 12 months we worried whether our food would run out before we got money to buy more"
* item[=].text = "Within the past 12 months we worried whether our food would run out before we got money to buy more"
* item[=].type = #choice
* item[=].required = false
* item[=].answerOption[0].valueCoding = $loinc#LA28397-0 "Often true"
* item[=].answerOption[+].valueCoding = $loinc#LA6729-3 "Sometimes true"
* item[=].answerOption[+].valueCoding = $loinc#LA28398-8 "Never true"
* item[=].answerOption[+].valueCoding = $loinc#LA15775-2 "Don't know/refused"
* item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item[=].extension.valueCodeableConcept.text = "Drop down"
* item[=].linkId = "/88123-5"
* item[=].code = $loinc#88123-5 "Within the past 12 months the food we bought just didn't last and we didn't have money to get more"
* item[=].text = "Within the past 12 months the food we bought just didn't last and we didn't have money to get more"
* item[=].type = #choice
* item[=].required = false
* item[=].answerOption[0].valueCoding = $loinc#LA28397-0 "Often true"
* item[=].answerOption[+].valueCoding = $loinc#LA6729-3 "Sometimes true"
* item[=].answerOption[+].valueCoding = $loinc#LA28398-8 "Never true"
* item[=].answerOption[+].valueCoding = $loinc#LA15775-2 "Don't know/refused"
* item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item[=].extension[=].valueCodeableConcept.text = "Drop down"
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "thisItem"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "%questionnaire.item.where(linkId = '/88124-3')"
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "atRiskCoding"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "%thisItem.answerOption.value.where(code='LA19952-3')"
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "noRiskCoding"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "%thisItem.answerOption.value.where(code='LA19983-8')"
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].extension[=].valueExpression.description = "risk determination"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "iif(%answeredEitherQ, iif(%riskStatus, %atRiskCoding, %noRiskCoding), {})"
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].extension[=].valueExpression.description = "risk determination"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "iif(%answeredEitherQ, iif(%riskStatus, %atRiskCoding, %noRiskCoding), {})"
* item[=].linkId = "/88124-3"
* item[=].code = $loinc#88124-3 "Food insecurity risk [HVS]"
* item[=].text = "Food insecurity risk"
* item[=].type = #choice
* item[=].required = false
* item[=].answerOption[0].valueCoding = $loinc#LA19952-3 "At risk"
* item[=].answerOption[+].valueCoding = $loinc#LA19983-8 "No risk"
* item[=].item.extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item.extension.valueCodeableConcept = $questionnaire-item-control#help "Help-Button"
* item[=].item.extension.valueCodeableConcept.text = "Help-Button"
* item[=].item.linkId = "/88124-3-help"
* item[=].item.text = "An answer of \"often true\" or \"sometimes true\" to either or both of the Hunger Vital Sign™ questions identifies a patient as at risk for food insecurity (FI)."
* item[=].item.type = #display
Instance: SDOHCC-TaskPatientRiskQuestionnaireCompletedExample
InstanceOf: SDOHCCTaskForPatient
Title: "SDOHCC Task Patient Risk Questionnaire Completed Example"
Description: "An example of a completed Task For Patient where the task was to complete a Hunger Vital Signs questionnaire (a questionnaire of the category ‘risk questionnaire’)."
Usage: #example
* meta.versionId = "4"
* meta.lastUpdated = "2021-11-15T20:50:16.161+00:00"
* meta.source = "#zhym6ICuuWsKnaZo"
* status = #completed
* intent = #order
* priority = #routine
* code = $temp#complete-questionnaire "Complete Questionnaire"
* for.reference = "Patient/pat-53234"
* for.display = "COLIN ABBAS"
* authoredOn = "2020-09-01T21:56:54.671Z"
* requester.reference = "Organization/SDOHCC-OrganizationClinicExample"
* owner.reference = "Patient/pat-53234"
* owner.display = "COLIN ABBAS"
* input[0].type = $temp#questionnaire "Questionnaire"
* input[=].valueCanonical = "http://hl7.org/fhir/us/sdoh-clinicalcare/Questionnaire/SDOHCC-QuestionnaireHungerVitalSign"
* input[+].type = $SDOHCC-CodeSystemTemporaryCodes#questionnaire-category "Questionnaire Category"
* input[=].valueCodeableConcept = $SDOHCC-CodeSystemTemporaryCodes#risk-questionnaire "Risk Questionnaire"
* output.type = $temp#questionnaire-response "Questionnaire Response"
* output.valueReference.reference = "QuestionnaireResponse/SDOHCC-QuestionnaireResponseHungerVitalSignExample"
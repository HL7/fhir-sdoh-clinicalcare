Instance: SDOHCC-ConditionUnemployedExample
InstanceOf: SDOHCCCondition
Title: "SDOHCC Condition Unemployed Example"
Description: "An example of a Condition (a health concern) that is based on an Observation related to employment status that is derived from a QuestionnaireResponse to PRAPARE (represented in LOINC)."
Usage: #example
* clinicalStatus = $condition-clinical#active "Active"
* verificationStatus = $condition-ver-status#unconfirmed "Unconfirmed"
* category[screening-assessment] = $condition-category#health-concern "Health Concern"
* category[screening-assessment][sdoh] = $ScreeningAssessmentObservationCategory#sdoh "SDOH"
* category[SDOHCC] = $SDOHCC-CodeSystemTemporaryCodes#employment-status "Employment Status"
* code.coding[0] = $sct#73438004 "Unemployed"
* code.coding[+] = $icd-10-cm#Z56.0 "Unemployment, unspecified"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* onsetPeriod.start = "2021-04-26T13:56:33.747Z"
* asserter.reference = "Patient/pat-53234"
* asserter.display = "COLIN ABBAS"
* evidence.detail.reference = "Observation/SDOHCC-ObservationResponsePRAPAREEmploymentStatusExample"
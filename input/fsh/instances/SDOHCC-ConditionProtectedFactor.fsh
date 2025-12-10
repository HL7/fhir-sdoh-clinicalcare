Instance: SDOHCC-ConditionProtectiveFactor
InstanceOf: SDOHCCCondition
Title: "SDOHCC Condition Protective Factor Example"
Description: "An example of a Condition (a health concern) that is based on an Observation related to a protective factor."
Usage: #example
* clinicalStatus = $condition-clinical#active "Active"
* verificationStatus = $condition-ver-status#unconfirmed "Unconfirmed"
* category[screening-assessment][+] = $condition-category#health-concern "Health Concern"
* category[screening-assessment][+] = $ScreeningAssessmentObservationCategory#sdoh "SDOH"
* category[SDOHCC] = $SDOHCC-CodeSystemTemporaryCodes#protective-factor "Protective Factor"
* code.coding[0] = $sct#1137434003 "Has access to transportation (finding)"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* onsetPeriod.start = "2021-04-26T13:56:33.747Z"
* asserter.reference = "Patient/pat-53234"
* asserter.display = "COLIN ABBAS"
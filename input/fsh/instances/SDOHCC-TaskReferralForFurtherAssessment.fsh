Instance: SDOHCC-TaskReferralForFurtherAssessmentExample
InstanceOf: SDOHCCTaskForReferralManagement
Title: "SDOHCC Task For Referral For Further Assessment Example"
Description: "An example of a Task resource representing a referral for further assessment."
Usage: #example
* intent = #order
* code = $task-code#fulfill "Fulfill the focal request"
* status = #completed
* focus.reference = "ServiceRequest/SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample"
* for.reference = "Patient/pat-53234"
* for.display = "COLIN ABBAS"
* authoredOn = "2020-10-15T10:30:00.000Z"
* requester.reference = "PractitionerRole/SDOHCC-PractitionerRoleDrJanWaterExample"
* requester.display = "Dr Jan Water Family Medicine Physician"
* owner.reference = "HealthcareService/SDOHCC-HealthcareServiceSocialCareProgram"
* owner.display = "HACC"
* output[AdditionalContent].valueReference.reference = "Observation/SDOHCC-ObservationAssessmentInadequateFoodIntakeExample"
* output[AdditionalContent].valueReference.display = "Inadequate Food Intake Observation"
* output[AdditionalContent].valueReference.reference = "Condition/SDOHCC-ConditionFoodInsecurityExample"
* output[AdditionalContent].valueReference.display = "Food Insecurity Condition"
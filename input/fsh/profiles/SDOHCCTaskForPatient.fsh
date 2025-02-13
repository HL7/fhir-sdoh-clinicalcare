Profile: SDOHCCTaskForPatient
Parent: Task
Id: SDOHCC-TaskForPatient
Title: "SDOHCC Task For Patient"
Description: "Profile for SDOH-related tasks to be carried out by the patient or someone acting on their behalf."

* ^status = #active
* obeys SDOH-Task-1 and SDOH-Task-2 and SDOH-Task-3 and SDOH-Task-4 and SDOH-Task-5 and SDOH-Task-6 and SDOH-Task-7
* . ^short = "A request to fulfill an SDOH questionnaire or service request"
* insert OwningCommitteeExtension
* partOf ^slicing.discriminator.type = #profile
* partOf ^slicing.discriminator.path = "resolve()"
* partOf ^slicing.rules = #open
* partOf contains SupportedPartOf 0..* MS
* partOf[SupportedPartOf] only Reference(SDOHCCTaskForReferralManagement or SDOHCCTaskForPatient)
* partOf[SupportedPartOf] ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* partOf[SupportedPartOf] ^type[=].targetProfile[=].extension.valueBoolean = true
* partOf[SupportedPartOf] ^type[=].targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* partOf[SupportedPartOf] ^type[=].targetProfile[=].extension.valueBoolean = true


* status MS
* status from SDOHCCValueSetTaskStatus (required)
* status ^comment = "For further details on Task.status see [Checking Task Status](checking_task_status.html)."
* status ^requirements = "These states enable coordination of task status with off-the-shelf workflow solutions that support automation of tasks. "
* statusReason MS
* statusReason ^definition = "If the task is cancelled by the patient, an explanation as to why should be provided."
* statusReason ^comment = "This applies to the current status.  Look at the history of the task to see reasons for past statuses. If the Task.status is cancelled, then Task.statusReason.text should be included."
* statusReason.text 1.. MS
* intent = #order (exactly)
* intent ^short = "order"
* intent ^definition = "Indicates the \"level\" of actionability associated with the Task."
* intent ^comment = "Patient tasks will always be orders."
* priority 1.. MS
* priority from SDOHCCValueSetTaskPriority (required)
* priority ^short = "routine | urgent"
* priority ^definition = "Indicates how quickly the Task should be addressed by the patient."
* priority ^requirements = "Used to identify the level of priority assigned to this task. For tasks identified as urgent, the ability to deliver a related sevice may be dependent on task completion."
* code 1.. MS
* code from SDOHCCValueSetTaskCode (extensible)
* code.text MS
* description MS
* description ^comment = "If Task.code is \"general-information\", Task.description should be displayed to the user with no other computable expectation other than allowing the patient to update the Task.status and optionally capture a free text response for Task.output."
* description ^condition[0] = "SDOH-Task-2"
* description ^condition[+] = "SDOH-Task-7"
* focus MS
* focus ^condition[0] = "SDOH-Task-3"
* for 1.. MS
* for only Reference(USCorePatientProfile)
* authoredOn 1.. MS
* requester 1.. MS
* requester only Reference(USCorePractitionerRoleProfile or USCoreOrganizationProfile)
* owner 1.. MS
* owner only Reference(USCorePatientProfile or RelatedPerson)
* input ^slicing.discriminator.type = #pattern
* input ^slicing.discriminator.path = "type"
* input ^slicing.rules = #open
* input contains
    Questionnaire 0..1 MS and
    QuestionnairePDF 0..1 MS and
    QuestionnaireURL 0..1 MS and
    QuestionnaireCategory 0..1 MS and
    Contact 0..* MS
* input[Questionnaire] ^condition[0] = "SDOH-Task-1"
* input[Questionnaire].type = $temp#questionnaire
* input[Questionnaire].type ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* input[Questionnaire].type ^binding.extension.valueString = "TaskInputParameterType"
* input[Questionnaire].type ^binding.strength = #example
* input[Questionnaire].type ^binding.description = "Codes to identify types of input parameters. These will typically be specific to a particular workflow. The codes represent types of questionnaires that the patient might be asked to complete."
* input[Questionnaire].value[x] only canonical
* input[Questionnaire].value[x] ^comment = "This references the SDC Base Questionnaire profile to allow the use of questionnaires (e.g. a patient satisfaction questionnaire) that are not SDOH screening questionnaires. However, for questionnaires that are intended to produce FHIR resources (e.g., Observations or Conditions), the SDC Extractable Questionnaire - StructureMap should be used."
* input[Questionnaire].value[x] ^type.targetProfile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* input[QuestionnairePDF] ^condition[0] = "SDOH-Task-1"
* input[QuestionnairePDF].type = $SDOHCC-CodeSystemTemporaryCodes#questionnaire-pdf
* input[QuestionnairePDF].value[x] only Reference(USCoreDocumentReferenceProfile)
* input[QuestionnaireURL] ^condition[0] = "SDOH-Task-1"
* input[QuestionnaireURL].type = $SDOHCC-CodeSystemTemporaryCodes#questionnaire-url
* input[QuestionnaireURL].value[x] only url
* input[QuestionnaireCategory] ^condition[0] = "SDOH-Task-1"
* input[QuestionnaireCategory].type = $SDOHCC-CodeSystemTemporaryCodes#questionnaire-category
* input[QuestionnaireCategory].value[x] only CodeableConcept
* input[QuestionnaireCategory].value[x] from SDOHCCValueSetSDOHQuestionnaireCategory (required)
* input[QuestionnaireCategory].value[x] ^binding.description = "Types of Social Determinant of Health (SDOH) questionnaires that the patient might be asked to complete"
* input[Contact] ^comment = "If Task.code is \"make-contact\" and multiple Task.inputs are provided, the intent is that the task owner selects only one to contact. If more than one contact needs to be made, there should be separate Tasks."
* input[Contact] ^condition[0] = "SDOH-Task-4"
* input[Contact].type = $SDOHCC-CodeSystemTemporaryCodes#contact-entity
* input[Contact].type ^comment = "When Task.code is \"make-contact\", \"contact-entity\" is used for Task.input.type to indicate that the task owner should contact one of the healthcare services represented in Task.input.value."
* input[Contact].value[x] only Reference(SDOHCCHealthcareService or USCorePractitionerRoleProfile or USCorePractitionerProfile or USCoreOrganizationProfile)
* output ^slicing.discriminator.type = #pattern
* output ^slicing.discriminator.path = "type"
* output ^slicing.rules = #open
* output ^condition[0] = "SDOH-Task-2"
* output ^condition[+] = "SDOH-Task-5"
* output ^condition[+] = "SDOH-Task-6"
* output ^condition[+] = "SDOH-Task-7"
* output contains
    QuestionnaireResponse 0..1 MS and
    QuestionnairePDFCompleted 0..1 MS and
    GeneralInformationResponse 0..* MS and
    ChosenContact 0..1 MS
* output[QuestionnaireResponse] ^condition[0] = "SDOH-Task-5"
* output[QuestionnaireResponse] ^condition[+] = "SDOH-Task-5"
* output[QuestionnaireResponse] ^condition[+] = "SDOH-Task-6"
* output[QuestionnaireResponse] ^condition[+] = "SDOH-Task-7"
* output[QuestionnaireResponse].type = $temp#questionnaire-response
* output[QuestionnaireResponse].value[x] only Reference(SDCQuestionnaireResponse)
* output[QuestionnairePDFCompleted] ^condition[0] = "SDOH-Task-6"
* output[QuestionnairePDFCompleted] ^condition[+] = "SDOH-Task-5"
* output[QuestionnairePDFCompleted] ^condition[+] = "SDOH-Task-6"
* output[QuestionnairePDFCompleted] ^condition[+] = "SDOH-Task-7"
* output[QuestionnairePDFCompleted].type = $SDOHCC-CodeSystemTemporaryCodes#questionnaire-pdf-completed
* output[QuestionnairePDFCompleted].value[x] only Reference(USCoreDocumentReferenceProfile)
* output[GeneralInformationResponse] ^condition[0] = "SDOH-Task-2"
* output[GeneralInformationResponse] ^condition[+] = "SDOH-Task-7"
* output[GeneralInformationResponse] ^condition[+] = "SDOH-Task-6"
* output[GeneralInformationResponse] ^condition[+] = "SDOH-Task-7"
* output[GeneralInformationResponse].type = $SDOHCC-CodeSystemTemporaryCodes#general-information-response
* output[GeneralInformationResponse].value[x] only markdown
* output[ChosenContact] ^comment = "If Task.code is \"make-contact\" and multiple Task.inputs are provided, the intent is that the task owner selects only one to contact and can indicate the \"chosen-contact\"."
* output[ChosenContact] ^condition[0] = "SDOH-Task-7"
* output[ChosenContact] ^condition[+] = "SDOH-Task-5"
* output[ChosenContact] ^condition[+] = "SDOH-Task-6"
* output[ChosenContact] ^condition[+] = "SDOH-Task-7"
* output[ChosenContact].type = $SDOHCC-CodeSystemTemporaryCodes#chosen-contact
* output[ChosenContact].value[x] only markdown
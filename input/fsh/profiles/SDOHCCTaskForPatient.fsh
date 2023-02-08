Profile: SDOHCCTaskForPatient
Parent: Task
Id: SDOHCC-TaskForPatient
Title: "SDOHCC Task For Patient"
Description: "Profile for SDOH-related tasks to be carried out by the patient or someone acting on their behalf."
* ^meta.versionId = "25"
* ^meta.lastUpdated = "2022-07-12T13:19:11.898+00:00"
* ^meta.source = "#by29kGIgG5vNrqtQ"
* ^status = #draft
* obeys SDOH-Task-1 and SDOH-Task-2 and SDOH-Task-3 and SDOH-Task-4 and SDOH-Task-5 and SDOH-Task-6 and SDOH-Task-7
* . ^short = "A request to fulfill an SDOH questionnaire or service request"
* partOf ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "resolve()"
  * ^slicing.rules = #open
* partOf contains SupportedPartOf 0..* MS
* partOf[SupportedPartOf] only Reference(SDOHCCTaskForReferralManagement or SDOHCCTaskForPatient)
* status MS
* status from SDOHCCValueSetTaskStatus (required)
  * ^short = "ready | cancelled | completed | in progress | on hold"
  * ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size. For further details on Task.status see [Checking Task Status](checking_task_status.html)."
  * ^requirements = "These states enable coordination of task status with off-the-shelf workflow solutions that support automation of tasks. The values are constrained to ready | cancelled | completed | in progress | on hold. The task comes to the patient in the ready status and the patient can update status as appropriate."
* statusReason MS
  * ^definition = "If the task is cancelled by the patient, an explanation as to why should be provided."
  * ^comment = "This applies to the current status.  Look at the history of the task to see reasons for past statuses. If the Task.status is cancelled, then Task.statusReason.text should be included."
  * text 1.. MS
* intent = #order (exactly)
  * ^short = "order"
  * ^definition = "Indicates the \"level\" of actionability associated with the Task."
  * ^comment = "Patient tasks will always be orders."
* priority 1.. MS
* priority from SDOHCCValueSetTaskPriority (required)
  * ^short = "routine | urgent"
  * ^definition = "Indicates how quickly the Task should be addressed by the patient."
  * ^requirements = "Used to identify the level of priority assigned to this task. For tasks identified as urgent, the ability to deliver a related sevice may be dependent on task completion."
* code 1.. MS
* code from SDOHCCValueSetTaskCode (extensible)
  * text MS
* description MS
  * ^comment = "If Task.code is \"adhoc\", Task.description should be displayed to the user with no other computable expectation other than allowing the patient to update the Task.status and optionally capture a free text response for Task.output."
  * ^condition[0] = "SDOH-Task-2"
  * ^condition[+] = "SDOH-Task-7"
* focus MS
  * ^condition[0] = "SDOH-Task-3"
* for 1.. MS
* for only Reference(USCorePatientProfile)
* authoredOn 1.. MS
* requester 1.. MS
* requester only Reference(USCorePractitionerRoleProfile or USCoreOrganizationProfile)
* owner 1.. MS
* owner only Reference(USCorePatientProfile or RelatedPerson)
* input ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* input contains
    Questionnaire 0..1 MS and
    QuestionnairePDF 0..1 MS and
    QuestionnaireURL 0..1 MS and
    QuestionnaireCategory 0..1 MS and
    Contact 0..* MS
* input[Questionnaire] ^condition[0] = "SDOH-Task-1"
  * type = $temp#questionnaire
    * ^binding.strength = #example
    * ^binding.description = "Codes to identify types of input parameters.  These will typically be specific to a particular workflow.  The codes represent types of questionnaires that the patient might be asked to complete."
  * value[x] only canonical
    * ^comment = "This references the SDC Base Questionnaire profile to allow the use of questionnaires (e.g. a patient satisfaction questionnaire) that are not SDOH screening questionnaires. However, for questionnaires that are intended to produce FHIR resources (e.g., Observations or Conditions), the SDC Extractable Questionnaire - StructureMap should be used."
    * ^type.targetProfile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* input[QuestionnairePDF] ^condition[0] = "SDOH-Task-1"
  * type = $SDOHCC-CodeSystemTemporaryCodes#questionnaire-pdf
  * value[x] only Reference(USCoreDocumentReferenceProfile)
* input[QuestionnaireURL] ^condition[0] = "SDOH-Task-1"
  * type = $SDOHCC-CodeSystemTemporaryCodes#questionnaire-url
  * value[x] only url
* input[QuestionnaireCategory] ^condition[0] = "SDOH-Task-1"
  * type = $SDOHCC-CodeSystemTemporaryCodes#questionnaire-category
  * value[x] only CodeableConcept
  * value[x] from SDOHCCValueSetSDOHQuestionnaireCategory (required)
    * ^binding.description = "Types of Social Determinant of Health (SDOH) questionnaires that the patient might be asked to complete"
* input[Contact] ^comment = "If Task.code is \"make-contact\" and multiple Task.inputs are provided, the intent is that the task owner selects only one to contact. If more than one contact needs to be made, there should be separate Tasks."
  * ^condition[0] = "SDOH-Task-4"
  * type = $SDOHCC-CodeSystemTemporaryCodes#contact-entity
    * ^comment = "When Task.code is \"make-contact\", \"contact-service\" is used for Task.input.type to indicate that the task owner should contact one of the healthcare services represented in Task.input.value."
  * value[x] only Reference(SDOHCCHealthcareService or USCorePractitionerRoleProfile or USCorePractitionerProfile or USCoreOrganizationProfile)
* output ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
  * ^condition[0] = "SDOH-Task-2"
  * ^condition[+] = "SDOH-Task-5"
  * ^condition[+] = "SDOH-Task-6"
  * ^condition[+] = "SDOH-Task-7"
* output contains
    QuestionnaireResponse 0..1 MS and
    QuestionnairePDFCompleted 0..1 MS and
    GeneralInformationResponse 0..* MS and
    ChosenContact 0..1 MS
* output[QuestionnaireResponse] ^condition[0] = "SDOH-Task-5"
  * type = $temp#questionnaire-response
  * value[x] only Reference(SDCQuestionnaireResponse)
* output[QuestionnairePDFCompleted] ^condition[0] = "SDOH-Task-6"
  * type = $SDOHCC-CodeSystemTemporaryCodes#questionnaire-pdf-completed
  * value[x] only Reference(USCoreDocumentReferenceProfile)
* output[GeneralInformationResponse] ^condition[0] = "SDOH-Task-2"
  * ^condition[+] = "SDOH-Task-7"
  * type = $SDOHCC-CodeSystemTemporaryCodes#general-information-response
  * value[x] only markdown
* output[ChosenContact] ^comment = "If Task.code is \"make-contact\" and multiple Task.inputs are provided, the intent is that the task owner selects only one to contact and can indicate the \"chosen-contact\"."
  * ^condition[0] = "SDOH-Task-7"
  * type = $SDOHCC-CodeSystemTemporaryCodes#chosen-contact
  * value[x] only markdown
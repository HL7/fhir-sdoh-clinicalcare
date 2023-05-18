Instance: SDOHCC-TaskPatientReviewInformationCompletedExample
InstanceOf: SDOHCCTaskForPatient
Title: "SDOHCC Task Patient Review Information Completed Example"
Description: "An example of a completed Task For Patient where the task was to review material."
Usage: #example
* intent = #order
* status = #completed
* priority = #routine
* code = $SDOHCC-CodeSystemTemporaryCodes#review-material "Review Material"
* description = "Please review this information about diabetes."
* for.reference = "Patient/pat-53234"
* for.display = "COLIN ABBAS"
* authoredOn = "2020-09-12T21:56:54.671Z"
* requester.reference = "Organization/SDOHCC-OrganizationClinicExample"
* owner.reference = "Patient/pat-53234"
* owner.display = "COLIN ABBAS"
* focus = Reference(DocumentReferenceExample)

Instance: DocumentReferenceExample
InstanceOf: DocumentReference
Title: "SDOHCC DocumentReference Diabetes Handout Example"
Description: "Document Reference for a Diabetes Handout. An example of a DocumentReference for a diabetes handout. This example is used as the referenced document in other IG examples."
* content.attachment.url = "https://www.cdc.gov/diabetes/pdfs/managing/Managing-Diabetes_CMS-CDC_English-508.pdf"
* status = http://hl7.org/fhir/document-reference-status#current
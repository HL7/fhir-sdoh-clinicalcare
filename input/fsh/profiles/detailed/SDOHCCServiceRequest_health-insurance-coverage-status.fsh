Profile: SDOHCCServiceRequest-health-insurance-coverage-status
Parent: SDOHCCServiceRequest
Id: SDOHCC-ServiceRequest-health-insurance-coverage-status
Title: "SDOHCC ServiceRequest - Health Insurance Coverage Status"
Description: "Profile for Social Determinants of Health (SDOH) ServiceRequest for the Health Insurance Coverage Status domain meant for computational use. Review the [Base SDOHCCServiceRequest profile](StructureDefinition-SDOHCC-ServiceRequest.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category[SDOH] = SDOHCCCodeSystemTemporaryCodes#health-insurance-coverage-status
* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.124 (required)
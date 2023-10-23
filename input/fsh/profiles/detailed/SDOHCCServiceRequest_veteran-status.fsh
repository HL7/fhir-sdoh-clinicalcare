Profile: SDOHCCServiceRequest-veteran-status
Parent: SDOHCCServiceRequest
Id: SDOHCC-ServiceRequest-veteran-status
Title: "SDOHCC ServiceRequest - Veteran Status"
Description: "Profile for Social Determinants of Health (SDOH) ServiceRequest for the Veteran Status domain meant for computational use. Review the [Base SDOHCCServiceRequest profile](StructureDefinition-SDOHCC-ServiceRequest.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category[SDOH] = SDOHCCCodeSystemTemporaryCodes#veteran-status
* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.91 (required)
Profile: SDOHCCProcedure-health-insurance-coverage-status
Parent: SDOHCCProcedure
Id: SDOHCC-Procedure-health-insurance-coverage-status
Title: "SDOHCC Procedure - Health Insurance Coverage Status"
Description: "Profile for Social Determinants of Health (SDOH) Procedure for the Health Insurance Coverage Status domain meant for computational use. Review the [Base SDOHCCProcedure profile](StructureDefinition-SDOHCC-Procedure.html) for the general requirements that explain usage of the profile with the domain."
* insert OwningCommitteeExtension
* category.coding[SDOH] = SDOHCCCodeSystemTemporaryCodes#health-insurance-coverage-status
* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.125 (required)
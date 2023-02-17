Instance: SDOHCC-GroupSDOHPatientsForPayerExample
InstanceOf: SDOHCCGroup
Title: "SDOHCC Group SDOH Patients For Payer Example"
Description: "An example of Group for patients that have any SDOH condition and are members of a specific payer organization."
Usage: #example
* meta.versionId = "2"
* meta.lastUpdated = "2021-06-03T15:53:44.616+00:00"
* meta.source = "#qYsuXFQNsfBd11Fx"
* active = true
* type = #person
* actual = true
* characteristic[0].code = $SDOHCC-CodeSystemTemporaryCodes#sdoh-condition-category "Current Condition Category From SDOH Category"
* characteristic[=].valueReference.reference = "http://hl7.org/fhir/us/sdoh-clinicalcare/ValueSet/SDOHCC-ValueSetSDOHCategory"
* characteristic[=].exclude = false
* characteristic[+].code = $SDOHCC-CodeSystemTemporaryCodes#payer-coverage "Coverage By Payer Organization"
* characteristic[=].exclude = false
* characteristic[=].valueReference.reference = "Organization/SDOHCC-OrganizationPayerExample"
* name = "CDE payer's SDOH condition patients"
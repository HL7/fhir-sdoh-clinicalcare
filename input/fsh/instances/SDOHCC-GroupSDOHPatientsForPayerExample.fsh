Instance: SDOHCC-GroupSDOHPatientsForPayerExample
InstanceOf: SDOHCCGroup
Title: "SDOHCC Group SDOH Patients For Payer Example"
Description: "An example of Group for patients that have any SDOH condition and are members of a specific payer organization."
Usage: #example
* active = true
* type = #person
* actual = true
//* characteristic[category].code = $SDOHCC-CodeSystemTemporaryCodes#sdoh-condition-category "Current Condition Category From SDOH Category"
//* characteristic[HasSDOHCondition].valueReference.reference = "http://hl7.org/fhir/us/sdoh-clinicalcare/ValueSet/SDOHCC-ValueSetSDOHCategory"
* characteristic[HasSDOHCondition].valueReference.reference = Canonical(SDOHCCValueSetSDOHCategory)
* characteristic[HasSDOHCondition].exclude = false
//* characteristic[+].code = $SDOHCC-CodeSystemTemporaryCodes#payer-coverage "Coverage By Payer Organization"
* characteristic[HasPayer].exclude = false
* characteristic[HasPayer].valueReference.reference = "Organization/SDOHCC-OrganizationPayerExample"
* name = "CDE payer's SDOH condition patients"
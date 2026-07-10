Instance: SDOHCC-GroupSDOHPatientsForPayerExample
InstanceOf: SDOHCCGroup
Title: "SDOHCC Group Food Insecurity Patients For Payer Example"
Description: "An example Group of patients who have an active food insecurity condition and are members of a specific payer organization."
Usage: #example

* active = true
* type = #person
* actual = true
* name = "CDE payer's food insecurity patients"

// Required SDOHCCGroup characteristic identifying the SDOH condition category.
// This CodeableConcept is searchable through the R4 characteristic-value composite.
* characteristic[HasSDOHCondition].code = $SDOHCC-CodeSystemTemporaryCodes#sdoh-condition-category "Current Condition Category From SDOH Category"
* characteristic[HasSDOHCondition].valueCodeableConcept = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* characteristic[HasSDOHCondition].exclude = false

// Required SDOHCCGroup characteristic identifying the payer Organization.
// This Reference is searchable through the IG-defined characteristic-reference parameter.
* characteristic[HasPayer].code = $SDOHCC-CodeSystemTemporaryCodes#payer-coverage "Coverage By Payer Organization"
* characteristic[HasPayer].valueReference.reference = "Organization/SDOHCC-OrganizationPayerExample"
* characteristic[HasPayer].exclude = false

// This patient has the active food-insecurity Condition used by the example set.
* member[0].entity.reference = "Patient/pat-53234"
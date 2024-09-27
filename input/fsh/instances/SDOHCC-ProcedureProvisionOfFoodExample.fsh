Instance: SDOHCC-ProcedureProvisionOfFoodExample
InstanceOf: SDOHCCProcedure
Title: "SDOHCC Procedure Provision Of Food Example"
Description: "An example of a completed Procedure for provision of food."
Usage: #example
* status = #completed
* category.coding[0] = $sct#410606002 "Social service procedure"
* category.coding[+] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* code = $sct#710925007 "Provision of food"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* performedDateTime = "2020-11-16"
* reasonReference.reference = "Condition/SDOHCC-ConditionFoodInsecurityExample"
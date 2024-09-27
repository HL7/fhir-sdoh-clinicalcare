Instance: SDOHCC-ProcedureFoodPantryApplicationAssistanceExample
InstanceOf: SDOHCCProcedure
Title: "SDOHCC Procedure Food Pantry Application Assistance Example"
Description: "An example of a completed Procedure for assistance with applying to a food pantry that is based on a ServiceRequest and references as its reason a food insecurity Condition."
Usage: #example
* basedOn.reference = "ServiceRequest/SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample"
* status = #completed
* category.coding[0] = $sct#410606002 "Social service procedure"
* category.coding[+] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* code = $sct#467771000124109 "Assistance with application for food pantry program"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* performedDateTime = "2020-09-16"
* reasonReference.reference = "Condition/SDOHCC-ConditionFoodInsecurityExample"
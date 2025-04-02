Instance: SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample
InstanceOf: SDOHCCServiceRequest
Title: "SDOHCC ServiceRequest Active Food Pantry Application Assist Example"
Description: "An example of an active ServiceRequest for assistance with applying to a food pantry that references as its reason a food insecurity Condition."
Usage: #example
* status = #active
* intent = #order
* category[0] = $sct#410606002 "Social service procedure"
* category[+] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* code = $sct#467771000124109 "Assistance with application for food pantry program"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* reasonReference.reference = "Condition/SDOHCC-ConditionFoodInsecurityExample"
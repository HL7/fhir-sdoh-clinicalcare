Instance: SDOHCC-ServiceRequestSubreferralGardenProgramExample
InstanceOf: SDOHCCServiceRequest
Title: "SDOHCC ServiceRequest Subreferral Garden Program Example"
Description: "An example of a completed, original-order ServiceRequest (i.e., SDOHCC Service Request Active Food Pantry Application Assist Example) that is based on a Service Request to an intermediary organization (e.g., a Coordination Platform) that then created this Service Request (i.e., Assistance with application for garden program) to be fulfilled by a Community Based Organization."
Usage: #example
* basedOn.reference = "ServiceRequest/SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample"
* status = #completed
* intent = #original-order
* category[0] = $sct#410606002 "Social service procedure"
* category[+] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* code = $sct#467751000124104 "Assistance with application for garden program"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* reasonReference.reference = "Condition/SDOHCC-ConditionFoodInsecurityExample"
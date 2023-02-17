Instance: SDOHCC-ServiceRequestSubreferralSummerFoodProgramExample
InstanceOf: SDOHCCServiceRequest
Title: "SDOHCC ServiceRequest Subreferral Summer Food Program Example"
Description: "An example of a completed, original-order ServiceRequest (i.e., SDOHCC Service Request Active Food Pantry Application Assist Example) that is based on a Service Request to an intermediary organization (e.g., a Coordination Platform) that then created this Service Request (i.e., Assistance with application for Summer Food Service Program) to be fulfilled by a Community Based Organization."
Usage: #example
* meta.versionId = "5"
* meta.lastUpdated = "2022-07-18T14:03:27.489+00:00"
* meta.source = "#leaEyZrSH5P84RO6"
* basedOn.reference = "ServiceRequest/SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample"
* status = #completed
* intent = #original-order
* category[0] = $sct#410606002 "Social service procedure"
* category[+] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* code = $sct#467681000124101 "Assistance with application for Summer Food Service Program"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* reasonReference.reference = "Condition/SDOHCC-ConditionFoodInsecurityExample"
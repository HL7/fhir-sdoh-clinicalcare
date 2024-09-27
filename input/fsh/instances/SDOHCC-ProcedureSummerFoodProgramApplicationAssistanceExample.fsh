Instance: SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample
InstanceOf: SDOHCCProcedure
Title: "SDOHCC Procedure Summer Food Program Application Assistance Example"
Description: "An example of a completed Procedure for assistance with applying to a summer food program that is based on a ServiceRequest and references as its reason a food insecurity Condition."
Usage: #example
* basedOn.reference = "ServiceRequest/SDOHCC-ServiceRequestSubreferralSummerFoodProgramExample"
* status = #completed
* category.coding[0] = $sct#410606002 "Social service procedure"
* category.coding[+] = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* code = $sct#467681000124101 "Assistance with application for Summer Food Service Program"
* subject.reference = "Patient/pat-53234"
//* subject.display = "COLIN ABBAS"
* performedDateTime = "2020-09-22"
* reasonReference.reference = "Condition/SDOHCC-ConditionFoodInsecurityExample"
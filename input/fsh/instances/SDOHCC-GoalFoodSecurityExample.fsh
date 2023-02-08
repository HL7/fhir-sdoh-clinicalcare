Instance: SDOHCC-GoalFoodSecurityExample
InstanceOf: SDOHCCGoal
Title: "SDOHCC Goal Food Security Example"
Description: "An example of a food security Goal that addresses a food insecurity Condition."
Usage: #example
* meta.versionId = "2"
* meta.lastUpdated = "2021-11-15T20:50:16.089+00:00"
* meta.source = "#orOiNvQwbfO6pINw"
* lifecycleStatus = #active
* achievementStatus = $goal-achievement#improving "Improving"
* category = $SDOHCC-CodeSystemTemporaryCodes#food-insecurity "Food Insecurity"
* description = $sct#1078229009 "Food security"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* target.measure = $loinc#88124-3 "Food insecurity risk [HVS]"
* target.detailCodeableConcept = $loinc#LA19983-8 "No risk"
* target.dueDate = "2020-12-10"
* statusDate = "2020-10-21"
* addresses.reference = "Condition/SDOHCC-ConditionFoodInsecurityExample"
Extension: SDOHCCExtensionConditionAsserter
Id: SDOHCC-ExtensionConditionAsserter
Title: "SDOHCC Extension Condition Asserter"
Description: "Extension for allowing the asserter of a condition to be Device (that was used to perform an operation to arrive at the condition)."
* ^status = #active
* ^context.type = #element
* ^context.expression = "Condition"
* value[x] 1..1
* value[x] only Reference 
* valueReference only Reference(Device)

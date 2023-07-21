Invariant: SDOH-Ethnicity-1
Description: "Must have either a dataAbsentReason or at least one of the defined ethnicity components but not both"
Severity: #error
Expression: "dataAbsentReason.exists() xor component.where(code.coding.exists(system='http://loinc.org' and code='69490-1')).exists()"
XPath: "true()"
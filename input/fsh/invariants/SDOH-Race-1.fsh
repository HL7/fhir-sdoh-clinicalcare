Invariant: SDOH-Race-1
Description: "Must have either a dataAbsentReason or at least one of the defined race components but not both"
Severity: #error
Expression: "dataAbsentReason.exists() xor component.where(code.coding.exists(system='http://loinc.org' and code='72826-1')).exists()"
XPath: "true()"
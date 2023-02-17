Invariant: SDOH-Task-3
Description: "If Task.code is \"review-material\", then Task.focus of DocumentReference is required."
Severity: #error
Expression: "code.coding.where(system='http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes' and code='review-material').exists() implies focus.resolve() is DocumentReference"
XPath: "true()"
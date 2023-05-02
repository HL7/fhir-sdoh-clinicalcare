Invariant: SDOH-Task-2
Description: "If Task.code is “general-information”, then Task.description is required and Task.output, if present, must be “general-information-response”."
Severity: #error
Expression: "code.coding.where(system='http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes' and code='general-information').exists() implies (description.exists() and (output.empty() or output.type.coding.all(system='http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes' and code='general-information-response').exists()))"
XPath: "true()"
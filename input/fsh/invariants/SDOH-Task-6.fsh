Invariant: SDOH-Task-6
Description: "If Task.input is \"questionnaire-pdf\", then Task.output, if present, must be \"questionnaire-pdf-completed\"."
Severity: #error
Expression: "input.type.coding.where(system='http://hl7.org/fhir/uv/sdc/CodeSystem/temp' and code='questionnaire-pdf').exists() implies (output.type.coding.where(system='http://hl7.org/fhir/uv/sdc/CodeSystem/temp' and code='questionnaire-pdf-completed').exists() or output.empty())"
XPath: "true()"
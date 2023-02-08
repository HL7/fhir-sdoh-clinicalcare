Invariant: SDOH-Task-5
Description: "If Task.input is \"questionnaire\", then Task.output, if present, must be \"questionnaire-response\"."
Severity: #error
Expression: "input.type.coding.where(system='http://hl7.org/fhir/uv/sdc/CodeSystem/temp' and code='questionnaire').exists() implies (output.type.coding.where(system='http://hl7.org/fhir/uv/sdc/CodeSystem/temp' and code='questionnaire-response').exists() or output.empty())"
XPath: "true()"
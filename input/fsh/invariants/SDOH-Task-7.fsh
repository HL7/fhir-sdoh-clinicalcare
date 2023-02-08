Invariant: SDOH-Task-7
Description: "If Task.code is “make-contact”, then Task.description is required and either Task.output is absent or Task.output must be “chosen-contact”."
Severity: #error
Expression: "code.coding.where(system='http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes' and code='make-contact').exists() implies (description.exists() and (output.empty() or output.type.coding.all(system='http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes' and code='chosen-contact').exists()))"
XPath: "true()"
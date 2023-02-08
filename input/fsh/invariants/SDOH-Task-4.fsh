Invariant: SDOH-Task-4
Description: "If Task.code is \"make-contact\", then Task.input of at least one \"contact-entity\" is required."
Severity: #error
Expression: "code.coding.where(system='http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes' and code='make-contact').exists() implies input.type.coding.where(system='http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes' and code='contact-entity').exists()"
XPath: "true()"
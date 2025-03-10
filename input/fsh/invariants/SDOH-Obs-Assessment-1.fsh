Invariant: SDOH-Obs-4
Description: "SHALL have the category SDOH present."
Severity: #error
Expression: "category.where(coding.where(system = 'http://hl7.org/fhir/us/core/CodeSystem/us-core-category' and code='sdoh').exists()).exists()"

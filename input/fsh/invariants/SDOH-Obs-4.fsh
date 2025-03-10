Invariant: SDOH-Obs-4
Description: "At least one Observation.category SHALL be sdoh"
Severity: #error
Expression: "category.where(coding.where(system = 'http://hl7.org/fhir/us/core/CodeSystem/us-core-category' and code='sdoh').exists()).exists()"

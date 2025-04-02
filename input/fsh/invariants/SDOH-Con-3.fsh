Invariant: SDOH-Con-3
Description: "At least one Condition.category SHALL be sdoh"
Severity: #error
Expression: "category.where(coding.where(system = 'http://hl7.org/fhir/us/core/CodeSystem/us-core-category' and code='sdoh').exists()).exists()"

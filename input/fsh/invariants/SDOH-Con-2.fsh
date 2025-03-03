Invariant: SDOH-Con-2
Description: "At least one Condition.category SHALL be encounter-diagnosis, problem-list-item, or health-concern"
Severity: #error
Expression: "category.where(coding.where(system = 'http://terminology.hl7.org/CodeSystem/condition-category' and code='encounter-diagnosis').exists()).exists() or category.where(coding.memberOf('http://hl7.org/fhir/us/core/ValueSet/us-core-problem-or-health-concern')).exists()"
XPath: "true()"
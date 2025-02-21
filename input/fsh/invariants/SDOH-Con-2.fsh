Invariant: SDOH-Con-2
Description: "SHALL have at least one category from US Core condition category codes (encounter diagnosis or a US Core Problem or Health Concern)"
Severity: #error
Expression: "category.where(coding.where(system = 'http://terminology.hl7.org/CodeSystem/condition-category' and code='encounter-diagnosis').exists()).exists() or category.where(coding.memberOf('http://hl7.org/fhir/us/core/ValueSet/us-core-problem-or-health-concern')).exists()"
XPath: "true()"
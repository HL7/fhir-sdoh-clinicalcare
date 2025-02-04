Invariant: SDOH-Con-2
Description: "SHALL have at least one category from US Core condition category codes (encounter diagnosis or a US Core Problem or Health Concern)"
Severity: #error
Expression: "category.where(coding.system = 'http://terminology.hl7.org/CodeSystem/condition-category' and coding.code='encounter-diagnosis').exists() or category.where(coding.memberOf('http://hl7.org/fhir/us/core/ValueSet/us-core-problem-or-health-concern')).exists()"
XPath: "true()"
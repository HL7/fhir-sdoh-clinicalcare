Invariant: SDOH-Con-2
Description: "SHALL have at least of category from US Core Condition Category codes (encounter diagnosis or a Healtcare Concern Category code)"
Severity: #error
Expression: "category.where(coding.memberOf('http://hl7.org/fhir/us/core/ValueSet/us-core-problem-or-health-concern') or coding.memberOf('http://hl7.org/fhir/us/core/ValueSet/us-core-problem-or-health-concern')).exists()"
XPath: "true()"
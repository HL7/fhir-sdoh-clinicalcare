Invariant: SDOH-Con-1
Description: "Can only have a max of one asserter."
Severity: #error
Expression: "extension('http://hl7.org/fhir/us/sdoh-clinicalcare/extension-Condition.asserter').count()+asserter.count()<=1"
XPath: "true()"
Invariant: SDOH-Obs-1
Description: "Either subject or extension-Observation.subject must exist but not both"
Severity: #error
Expression: "subject.exists() xor extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.subject').exists()"
XPath: "true()"
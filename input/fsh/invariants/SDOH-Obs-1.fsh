Invariant: SDOH-Obs-1
Description: "Either subject or extension-Observation.subject must exist but not both"
Severity: #error
Expression: "reference.exists() xor extension('http://hl7.org/fhir/StructureDefinition/alternate-reference').exists()"
//XPath: "true()"
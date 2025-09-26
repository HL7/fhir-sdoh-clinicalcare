Invariant: SDOH-HCS-2
Description: "If HealthcareService.code is \"program-support\", then one of HealthcareService.program or HealthcareService.characteristic is required."
Severity: #error
Expression: "code.coding.where(system='http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes' and code='program-support').exists() implies ((program.exists()) or (characteristic.exists()))"
XPath: "true()"
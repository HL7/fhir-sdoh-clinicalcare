Instance: SDOHCC-PractitionerRolePatWilliamsMSWExample
InstanceOf: SDOHCCPractitionerRole
Title: "SDOHCC Practitioner Role Pat Williams, MSW Example"
Description: "An example of a social worker PractitionerRole. This example is used as the referenced practitioner role in other IG examples. Note that this example supports both US Core 3.1.1 and US Core 6.1.0 by providing a `code.coding` with an NUCC code (for US Core 3.1.1) and a SNOMED CT code (for US Core 6.1.0). This is the preferred approach to ensure maximum compliance and usability across systems that may support different versions of US Core."
Usage: #example
* identifier.system = "http://www.deerland.org/practitioners"
* identifier.value = "24243"
* active = true
* practitioner = Reference(SDOHCC-PractitionerPatWilliamsMSWExample) "Pat Williams"
* organization = Reference(SDOHCC-OrganizationClinicExample) "Better Health Clinic"
* code[+].coding[+] = $provider-taxonomy#104100000X "Social Worker"
* code[=].coding[+] = $sct#224598009 "Trained Social Worker Counsellor"
* telecom[0].system = #phone
* telecom[=].value = "639 442 6719"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "pat.williams@deerland.org"
* telecom[=].use = #work
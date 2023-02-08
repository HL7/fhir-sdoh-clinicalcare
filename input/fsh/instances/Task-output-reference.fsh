Instance: Task-output-reference
InstanceOf: SearchParameter
Title: "TaskOutputReference"
Description: "The value of any outputs of type 'Reference'"
Usage: #definition
* meta.versionId = "2"
* meta.lastUpdated = "2021-11-19T04:18:52.778+00:00"
* meta.source = "#euF2X6YJgs01eKBr"
* url = "http://hl7.org/fhir/us/sdoh-clinicalcare/SearchParameter/Task-output-reference"
* version = "1.0.0"
* name = "TaskOutputReference"
* status = #draft
* experimental = false
* date = "2021-07"
* publisher = "HL7 International - Patient Care WG"
* contact.name = "HL7 International - Patient Care"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/patientcare"
* description = "The value of any outputs of type 'Reference'"
* jurisdiction = urn:iso:std:iso:3166#US
* code = #output
* base = #Task
* type = #reference
* expression = "(Task.output.value as Reference)"
* xpath = "f:Task/f:output/f:valueReference"
* xpathUsage = #normal
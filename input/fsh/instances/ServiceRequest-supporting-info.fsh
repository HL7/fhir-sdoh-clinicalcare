Instance: ServiceRequest-supporting-info
InstanceOf: SearchParameter
Title: "ServiceRequestSupportingInfo"
Description: "Any resources referenced by ServiceRequest.supportingInfo"
Usage: #definition
* meta.versionId = "2"
* meta.lastUpdated = "2021-11-19T04:12:56.592+00:00"
* meta.source = "#burpFh4Jg6KP31k5"
* url = "http://hl7.org/fhir/us/sdoh-clinicalcare/SearchParameter/ServiceRequest-supporting-info"
* version = "1.0.0"
* name = "ServiceRequestSupportingInfo"
* status = #draft
* experimental = false
* date = "2021-07"
* publisher = "HL7 International - Patient Care WG"
* contact.name = "HL7 International - Patient Care"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/patientcare"
* description = "Any resources referenced by ServiceRequest.supportingInfo"
* jurisdiction = urn:iso:std:iso:3166#US
* code = #supporting-info
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.supportingInfo"
* xpath = "f:ServiceRequest/f:supportingInfo"
* xpathUsage = #normal
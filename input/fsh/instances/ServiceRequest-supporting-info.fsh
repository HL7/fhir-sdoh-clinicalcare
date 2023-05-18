Instance: ServiceRequest-supporting-info
InstanceOf: SearchParameter
Title: "ServiceRequestSupportingInfo"
Description: "Any resources referenced by ServiceRequest.supportingInfo"
Usage: #example
* url = "http://hl7.org/fhir/us/sdoh-clinicalcare/SearchParameter/ServiceRequest-supporting-info"
* name = "ServiceRequestSupportingInfo"
* status = #draft
* experimental = false
* contact.telecom.system = #url
* description = "Any resources referenced by ServiceRequest.supportingInfo"
* code = #supporting-info
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.supportingInfo"
* xpath = "f:ServiceRequest/f:supportingInfo"
* xpathUsage = #normal
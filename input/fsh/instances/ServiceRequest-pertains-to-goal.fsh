Instance: ServiceRequest-pertains-to-goal
InstanceOf: SearchParameter
Title: "ServiceRequestPertainsToGoal"
Description: "Allows searching ServiceRequest resources by the Goal referenced by the resource-pertainsToGoal extension. It also supports _include=ServiceRequest:pertains-to-goal when retrieving ServiceRequest resources."
Usage: #definition

* url = "http://hl7.org/fhir/us/sdoh-clinicalcare/SearchParameter/ServiceRequest-pertains-to-goal"
* name = "ServiceRequestPertainsToGoal"
* status = #active
* experimental = false
* description = "A Goal referenced by the ServiceRequest resource-pertainsToGoal extension"
* purpose = "Supports finding ServiceRequest resources associated with a particular Goal and including those Goal resources in ServiceRequest search results."
* code = #pertains-to-goal
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/resource-pertainsToGoal').value.ofType(Reference)"
* xpath = "f:ServiceRequest/f:extension[@url='http://hl7.org/fhir/StructureDefinition/resource-pertainsToGoal']/f:valueReference"
* xpathUsage = #normal
* target = #Goal
* multipleOr = true
* multipleAnd = true
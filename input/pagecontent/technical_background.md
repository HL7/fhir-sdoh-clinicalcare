###  Underlying Technologies
This guide is based on the [HL7 FHIR](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=491) standard. Therefore, Implementers of this specification need to understand some basic information about the FHIR specification.


This Implementation Guide uses terminology, notations and design principles that are specific to FHIR. Before reading this IG, it’s important to be familiar with some of the basic principles of FHIR as well as general guidance on how to read FHIR specifications. Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following prior to reading the rest of this IG.

* 	[FHIR overview](http://www.hl7.org/fhir/R4/overview.html)
* 	[Developer's introduction (or Clinical introduction)](http://www.hl7.org/fhir/R4/overview-dev.html)
* 	[FHIR data types](http://www.hl7.org/fhir/R4/datatypes.html)
* 	[Using codes](http://www.hl7.org/fhir/R4/codesystem.html)
* 	[References between resources](http://www.hl7.org/fhir/R4/references.html)
* 	How to read [resource](http://www.hl7.org/fhir/R4/resourcelist.html) & [profile](http://www.hl7.org/fhir/R4/profiling.html) definitions
*   [RESTful API](http://www.hl7.org/fhir/R4/http.html)
*   [Search](http://www.hl7.org/fhir/R4/search.html)
*   [Base resource definitions](http://www.hl7.org/fhir/R4/resource.html)
  * [Condition](http://www.hl7.org/fhir/R4/condition.html)
  * [Consent](http://www.hl7.org/fhir/R4/consent.html)
  * [Goal](http://www.hl7.org/fhir/R4/goal.html)
  * [Group](http://www.hl7.org/fhir/R4/group.html)
  * [Healthcare Service](http://www.hl7.org/fhir/R4/healthcareservice.html)
  * [Location](http://www.hl7.org/fhir/R4/location.html)
  * [Observation](http://www.hl7.org/fhir/R4/observation.html)
  * [Procedure](http://www.hl7.org/fhir/R4/procedure.html)
  * [ServiceRequest](http://www.hl7.org/fhir/R4/servicerequest.html)
  * [Task](http://www.hl7.org/fhir/R4/task.html)

Implementers should also be familiar with the following Implementation Guides used by this specification:

* [US Core]({{site.data.fhir.ver.uscore}}/index.html)
* [Structured Data Capture]({{site.data.fhir.ver.sdc}}/index.html) 
  * [extraction]({{site.data.fhir.ver.sdc}}/extraction.html#map-extract)
  * [rendering]({{site.data.fhir.ver.sdc}}/rendering.html)
  * [behavior]({{site.data.fhir.ver.sdc}}/behavior.html)

This IG supports the [R4 version](http://hl7.org/fhir/R4) of the FHIR standard. 
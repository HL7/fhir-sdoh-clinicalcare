### Overview

|IG Characteristic  |     Value |
|------------------------------------------------------|--------------------------------------------|
|**FHIR Version:** |    FHIR R4 |
|**IG Realm:** |    US |
|**IG Type:** |    STU |
|**Exchange Methods:** |    RESTful Query, Messages, Transactions, Documents, Tasks |
|**IG Dependencies:** |    The SDOH-CC IG utilizes and adopts guidance developed in several other FHIR&reg; Implementation Guides. |





|IG Dependencies         |  IG Code         | Version                      |
|----------------------------------|-------------------------|---------------|
| HL7 FHIR US Core               |  [US Core](http://hl7.org/fhir/us/core/STU3.1)                | Version 3.1.0     |
| Structured Data Capture                         |   [SDC](http://hl7.org/fhir/uv/sdc/2019May)        | Version 2.7.0                     |





###  Purpose

This HL7&reg; IG defines FHIR R4 profiles, extensions and value sets needed to exchange SDOH content defined by the Gravity Project. It defines how to represent coded content used to support the following care activities: screening, clinical assessment/diagnosis, goal setting, and the planning and performing of interventions. It addresses the need to gather SDOH information in the context of clinical encounters and describes how to share SDOH information and other relevant information with outside organizations for the purpose of coordinating services and support to address SDOH related needs. It also demonstrates how to share clinical data to support secondary purposes such as population health, quality, and research. It supports the following use cases:
1.	Document SDOH data in conjunction with the patient encounter,
2.	Document and track SDOH related interventions to completion,
3.	Gather and aggregate SDOH data for uses beyond the point of care (e.g. public health, population health, quality measurement, risk adjustment, quality improvement, and research.)


### How to Use This Guide

A FHIR IG address the needs of multiple audiences. It provides technical artifacts that assist programmers when implementing standards-based FHIR application program interfaces (APIs) for specific purposes. It provides instructive material that explains how FHIR is used to accomplish specific uses cases. It also provides general information that helps business analysts and technology decision-makers understand the use cases and benefits associated with acheiving specific data exchange capabilities. A FHIR IG is as much a business planning tool as it is an educational resource and a technical specification.



### Notes to Reviewers and Balloters

Feedback on V0.0.1 of the IG should be sent to gravityproject@emiadvisors.net. 


### History of Document Changes

| Number         | Description                                                                                                                                                   |
|---------------|----------------------------------------------------------------------------------------------------|
| 2         |         |
| 1             | Redesigned scope of this IG                                         |



### Acknowledgements
*This section is still under development*

We would like to thank the Agency for Healthcare Research and Quality (AHRQ), SIREN UCSF, UV Larner and Yale Nursing for their support for developing this IG and all [Gravity Project sponsors](https://confluence.hl7.org/display/GRAV/Gravity+Project+Sponsors) for their contributions to make rapid progress on the standardization of social determinants of health data.

Reserve this area to included acknowledgements for the people and organizations involved in developing and maintaining this Implementation Guide.

There may also be some required copyright acknowledgements for certain Code Systems or other acknowledgements required by HL7 and FHIR.


|**Name**         | **Organization**                                        |
|--------------------------|--------------------------------------------|
| Robert Dieterle         | EnableCare                                         |
| Corey Smith        | AMA                                   |
| Monique van Berkum       | AMA                                 |
| Lisa Nelson           | MaxMD                                         |
| Matt Elrod        | MaxMD                                   |
| Matt Menning        |  AMA                                  |
| Mohit Saigal        | AMA                                   |
| Becky Gradl          | Academy of Nutrition and Dietetics                                 |
| Sarah DeSilvey        |  Larner College of Medicine at the University of Vermont, SIREN                                  |
| Donna Pertel         |  Academy of Nutrition and Dietetics                                  |
| Evelyn Gallego        |  EMI Advisors, LLC                                  |
| Linda Hyde        |   EMI Advisors, LLC                                 |
| Lynette Elliott| EMI Advisors, LLC |
| Rob Hausam |        |
| Cheng Liu | MaxMD|
| Natasha Kreisle | MaxMD|
{:class="table table-bordered"}
{:.table-striped}



### Authors

<table>
<thead>
<tr>
<th>Name</th>
<th>Email/URL</th>
</tr>
</thead>
<tbody>
<tr>
<td>HL7 International - Patient Care</td>
<td><a href="http://www.hl7.org/Special/committees/patientare" target="_new">http://www.hl7.org/Special/committees/patientare</a></td>
</tr>
</tbody>
</table>




[Next Page - Test Narrative Page](test_narrative_page.html)
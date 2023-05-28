
Systems claiming to conform to a profile SHALL support the elements in a profile as defined below: This guide adopts the following definitions of MustSupport for all direct transactions between the Sending and Receiving Systems

**All Sending Systems**

Sending Systems are defined as: 1) Provider Systems, 2) Payer Systems, and 3) Coordination Platforms
* The Sending System **SHALL** provide the capability for the user to enter, select, or otherwise cause to be populated all elements marked as MustSupport.
* The Sending System **SHALL** populate all elements with a MustSupport flag if the information exists and patient consent and receiver permissions allow.  A system SHALL be able to demonstrate transmission of all MustSupport elements.
* The Sending System **SHALL NOT** include a data element in the resource instance if the cardinality is 0..n and the information for that particular data element is not present.
* Where elements have a lower cardinality of one or more, instances complying with those profiles **SHALL** include the element. Where the profile includes explicit support for an extension, such as [dataAbsentReason], then the extension may be sent without providing a value or child elements.  If no extension is explicitly defined in the profile then, unless the profile is derived from US Core (which has laxer rules), the expectation in this IG is that the element **SHALL** have a value or standard child elements and sending an extension instead is not compliant.

**All Receiving Systems**

Receiving Systems are defined as 1) Payer Systems, 2) Provider Systems, 3) Coordination Platforms, 4) CBO applications and 5) consumer applications when receiving transactions from the Sending System.
* The Receiving System **SHALL** be capable of processing resource instances containing required and allowed data elements without generating an error or causing the application to fail.
* The Receiving System **SHALL** be capable of processing (display, store, etc) all required elements (cardinality 1 or greater) and **SHOULD** be capable of processing (display, store, etc) all MustSupport elements.
* Note: the expectation is that this requirement will be tightened (**SHOULD** going to **SHALL**) for at least a subset of the MustSupport elements in future versions of the IG.
* The Receiving System **SHALL** interpret missing data elements within resource instances as data not present in the Senders systems or where transmission of the data is prohibited by access control rules.
* The Receiving System **SHALL** be able to process resource instances containing data elements asserting missing information without generating an error or causing the application to fail.

**Conformance to US Core Profile**

Where this IG does not additionally constrain a US Core profile, the actors shall follow the US Core definition of [Must Support](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#must-support) and [Missing Data](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#missing-data).

This IG recognizes that patients may wish to only send a portion of the MustSupport elements to another entity.  However, there is currently no guidance on how to implement this as part of the FHIR R4 release.  When HL7 develops standards for fine line consent, this IG will consider their applicability to the sharing of SDOH information and adopt the standards that are relevant.  In the meantime, it may be possible to provide patients the ability to determine what to share by implementing [SMART on FHIR](http://docs.smarthealthit.org/) applications that allow them to restrict the exchange of information that is not required to interpret the intent of a specific resource (e.g., remove address and/or telephone number from the patient resource prior to making it available to a community organization).

{% include markdown-link-references.md %}
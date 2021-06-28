###  MustSupport and Missing Data

Systems claiming to conform to a profile SHALL support the elements in a profile as defined below: This guide adopts the following definitions of MustSupport for all direct transactions between the Sending and Receiving Systems

**All Sending Systems**

Sending Systems are defined as: 1) Provider Systems, 2) Payer Systems, and 3) Coordination Platforms
* The Sending System **SHALL** provide the capabilty for the user to include all elements that have a MustSupport flag.
* The Sending System **SHALL** populate all elements with a MustSupport flag if the information exists.
* The Sending System **SHALL NOT** include a data element in the resource instance if the cardinality is 0..n and the information for that particular data element is not present.
* The Sending System **SHALL** provide the capability for elements with cardinality >=1..* when the information does not exist to send the reason that information is missing using values from the value set indicating the absent reason or, if a missing information reason does not exist in the defined value set, use the dataAbsentReason extension where it is defined.
Note: populating the element with the value set absent reason or using the dataAbsent Reason **SHOULD** be handled by the Sending System and not require provider action. 

**All Receiving Systems** 

Receiving Systems are defined as 1) Payer Systems, 2) Provider Systems, 3)Coordination Platforms, 4) CBO applications and 5) consumer applications when receiving transactions from the Sending System.
* The Receiving System **SHALL** be capable of processing resource instances containing required and allowed data elements without generating an error or causing the application to fail. 
* The Receiving System **SHALL** be capable of processing (display, store, etc) all required elements (cardinality 1 or greater) and **SHOULD** be capable of processing (display, store, etc) all MustSupport elements.
* Note: the expectation is that this requirement will be tightened (**SHOULD** going to **SHALL** ) for at least a subset of the MustSupport elements in future versions of the IG.
* The Receiving System **SHALL** interpret missing data elements within resource instances as data not present in the Senders systems.
* The Receiving System **SHALL** be able to process resource instances containing data elements asserting missing information without generating an error or causing the application to fail.

**Conformance to US Core Profile** 

Where this IG does not additionally constrain a US Core profile, the actors shall follow the US Core definition of [Must Support and Missing Data](http://hl7.org/fhir/us/core/general-guidance.html).

This IG recognizes that patients may wish to only send a portion of the MustSupport elements to another entity.  However, there is currently no guidance on how to implement this as part of the FHIR R4 release.  When HL7 develops standards for fineline consent, this IG will consider their applicablity to the sharing of SDOH information and adopt the standards that are relevant.  In the meantime, it may be possible to provide patients the ability to determine what to share by implementing [SMART on FHIR](http://docs.smarthealthit.org/) applications that allow them to restrict the exchange of information that is not required to interpret the intent of a specific resource (e.g., remove address and/or telephone number from the patient resource prior to making it available to a community organization).

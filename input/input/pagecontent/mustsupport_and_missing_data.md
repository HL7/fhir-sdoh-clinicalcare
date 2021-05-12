[Previous Page - Privacy and Security](privacy_and_security.html)

###  Must Support and Missing Data

Systems claiming to conform to a profile SHALL support the elements in a profile as defined below: This guide adopts the following definitions of MustSupport for all direct transactions between the Sending and Receiving Systems

**All Sending Systems**

Sending Systems are defined as: 1) Provider Systems 
* As part of the SDOH ClinicalCare transaction as specified by the SDOH ClinicalCare IG, the Sender SHALL be capable of including all elements defined in the SDOH ClincialCare profiles that have a MustSupport flag and
 	SHALL populate all elements with a MustSupport flag if the information exists.
* In situations where information on a particular data element is not present, the Sender SHALL NOT include the data element in the resource instance if the cardinality is 0..n.
* If the information does not exist and the cardinality of the element is >= 1..*, the Sender SHALL send the reason for the missing information using values from the value set indicating the absent reason or, if a missing information reason does not exist in the defined value set, use the dataAbsentReason extension where it is defined. 
Note: populating the element with the value set absent reason or using the dataAbsent Reason SHOULD be handled by the Sending System and not require provider action. 

**All Receiving Systems** 

Receiving Systems are defined as 1) Community Based Organizations (CBO) Systems, 2) community social services platforms, 3) responsible payer Systems, 4) CBO applications and 5) consumer applications when receiving transaction from the Sending System.
* The Receiving System SHALL be capable of processing resource instances containing required and allowed data elements without generating an error or causing the application to fail. 
* Receiving Systems SHOULD be capable of processing (display, store, etc) the data elements based on the utility of the specific element to the receiver.
* When receiving a SDOH transaction from the Sender, the Receiving System SHALL interpret missing data elements within resource instances as data not present in the Senders systems.
* Receiving Systems SHALL be able to process resource instances containing data elements asserting missing information without generating an error or causing the application to fail.

**Conformance to US Core Profile** 

Where this IG does not additionally constrain a US Core profile, the actors shall follow the US Core definition of [Must Support and Missing Data](http://hl7.org/fhir/us/core/general-guidance.html).


[Next Page - Downloads](downloads.html)
### Use of Task Status

Task.status enables the exchange of information related to the request for and progress related to addressing a ServiceRequest. The value sets for the Referral Task status and the Patient Task status are different due to the purpose of the exchange between the requesting entity and the intermediary or performing entity (Referral Task) vs the exchange with the patient (Patient Task).

#### Referral Task Status

The [referral task status](http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-TaskForReferralManagement) utilizes the full set of values defined by the base resource as enumerated in the table below:

<table><tr><td><img src="ReferralTaskStatus.jpg" /></td></tr></table>

The status values allow for a complete flow of the task in both the requesting and performing systems.

The allowed state transitions are defined graphically in the state diagram below.

<table><tr><td><img src="ReferralTaskStateDiagram.jpg" /></td></tr></table>

#### Patient Task Status

The [patient task status](http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-TaskForPatient) utilizes a subset of the values defined by the base resource as enumerated in the table below:

<table><tr><td><img src="PatientTaskStatus.jpg" /></td></tr></table>

The status values constrain the task to specific states that are required to support communication with a patient application.

The allowed state transitions are defined graphically in the state diagram below.

<table><tr><td><img src="PatientTaskStateDiagram.jpg" /></td></tr></table>

In addition to a limited set of status values, the patient application is only permitted to modify a specific set of elements in responding to the task request.  These elements include: .Status, .StatusReason, and .Output.  All other elements are outside of the scope of this IG. The patient application cannot modify the status of the referral task, that can only be done by the requester and the performing or intermediary entity.

### Checking Task Status

The Gravity workflow around referrals involves all parties being aware of when relevant Tasks and associated ServiceRequests have been created and/or updated. In most cases, the Tasks will reside within the EHR system of the initiating practitioner.  In this case, the EHR will always be aware when the Task is updated, so the challenge of monitoring Tasks will fall solely on the service delivery organization.  However, the Gravity workflow also supports Tasks being posted to a CBO's FHIR server or an intermediary organization that is responsible for managing the referral fulfillment process.  In these circumstances, both EHR and service delivery organizations will need to monitor for changes to Tasks.

The specific types of events to be monitored for include:
**Service Delivery Organizations**

* A new Task has been assigned to the organization
* A new Task that is unassigned - but which is seeking action within the organization's purview has been created
* A ServiceRequest associated with a Task assigned to the organization has been modified
* A ServiceRequest associated with a Task assigned to the organization has been cancelled

**EHR systems**

* An assigned Task has been accepted or rejected
* An unassigned Task has now been assigned
* Outputs have been added to a Task
* A Task has been marked as complete


There are two mechanisms for detecting the above changes - polling and subscriptions.

#### Polling

In this mode, the system needing information (the 'client') occasionally queries the system maintaining the relevant Tasks and/or ServiceRequests to see if there is anything 'new'.  Clients may need to perform queries against multiple clients if not all relevant Tasks and ServiceRequests will be maintained on the same server. To poll, the client will perform a [search]({{site.data.fhir.path}}search.html) for Tasks that are filtered to those either owned by or requested by the searching organization. The search would also filter to only include those Tasks that had been created or changed since the server last looked.
E.g.

```[base]/Task?owner=Organization/123&_lastupdated=gt2021-05-03T17:23:18.1732-04:00```
or
```[base]/Task?owner=Organization/456&_lastupdated=gt2021-05-03T17:23:18.1732-04:00```

The time-stamp specified would be the search result returned from the last search.  

OPEN ISSUE: Are the organizations in question going to have RESTful ids on the server that holds the tasks or do we need to change this to:
```[base]/Task?owner:identifier=http%3A%2F%2Fsomeorganization%2Fsome%2Fidentifier%2Fsystem|123&_lastupdated=2021-05-03T17:23:18.1732-04:00```

If unassigned Tasks are possible - i.e. where the organization to perform the service isn't pre-identified and is open to whoever wishes to claim the Task and perform it - organizations interested in examining Tasks available to claim would poll as follows:

```[base]/Task?owner:missing=true&status=requested&_lastupdated=gt2021-05-03T17:23:18.1732-04:00```

The frequency of polling needs to be often enough to allow for timely response to changes, while not imposing too high a requirement on system performance. For Gravity, systems that use polling SHALL check for new/updated information at least once per business day and SHOULD check for information at least once per hour during normal hours of operation.  Systems SHOULD NOT query more often than every 15 minutes unless there is an urgent change they are monitoring for.
#### Subscription
In the subscription mechanism, instead of the client system regularly querying the server to see if there are new Tasks or changes to existing Tasks, the client creates a
Subscription instance on the server that indicates that it wants to be notified about changes to Tasks and, in the Subscription, provides filters that describe what
subset of Tasks it is interested in.  The server will then push notifications when there are new Tasks and the client can then query for the specific Tasks that have changed.

This Gravity functionality is based on the [R4 Subscription backport](http://hl7.org/fhir/uv/subscriptions-backport) implementation guide.  This implementation guide 
allows pre-adoption of the FHIR R5 topic-based subscription approach in R4 implementations and is the subscription approach that most U.S. EHR vendors have agreed to 
support.  Implementers of this Gravity IG who choose to support Subscription must comply with the Subscription Backport IG for the purpose of monitoring Tasks and, if
necessary, ServiceRequests.

For the purposes of this IG, there will be no need for 'topic discovery' as there are only two topics of interest - one for [monitoring Task](#task-topic) and one for [monitoring
ServiceRequest](#servicerequest-topic).  While neither of these topics are unique to the Gravity IG, because no standard topics have yet been defined for US Core, this IG will define the needed
topics here.  In the future, these topics may be subsumed into general-purpose topics defined by US Core and/or the FHIR core specification.

Systems supporting subscription SHALL support the rest-hook channel mechanism, though they may choose to support other channel approaches.  Servers SHALL support both
JSON and XML and clients SHALL support at least one of these.  Client and server SHALL support id-only, though they may  also support other content approaches.  The
id-only approach means that the id of the Task or ServiceRequest that was updated or created will be provided.  The client will then perform a read or a query to
retrieve the specified record(s) specified in the subscription notification. E.g.

<code>[base]/Task?_id=1234,5678</code>

If search is used, the client MAY use _include=Task:focus to retrieve the referenced ServiceRequest as well.  E.g.
<code>[base]/Task?_id=1234m5678&_include=Task:focus</code>

##### Task topic
This topic allows for monitoring for newly created tasks as well as updates to assigned or requested tasks.

<table class="grid">
  <thead>
    <tr>
      <th>Property</th>
      <th>Value</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>URL</td>
      <td>http://hl7.org/fhir/us/sdoh-clinicalcare/SubscriptionTopic/Task</td>
      <td>This is what will appear in <i>backport-topic-canonical</i> extension</td>
    </tr>
    <tr>
      <td>resourceTrigger.resourceType</td>
      <td>Task</td>
      <td/>
    </tr>
    <tr>
      <td>resourceTrigger.methodCriteria</td>
      <td>create, update, delete</td>
      <td>'delete' is not an expected action within the scope of this IG</td>
    </tr>
    <tr>
      <td>resourceTrigger.queryCriteria</td>
      <td>create, update, delete</td>
      <td>'delete' is not an expected action within the scope of this IG</td>
    </tr>
    <tr>
      <td>resourceTrigger.queryCriteria.current</td>
      <td>status:not=draft&amp;intent=order</td>
      <td/>
    </tr>
    <tr>
      <td>resourceTrigger.queryCriteria.current</td>
      <td>status:not=draft&amp;intent=order</td>
      <td/>
    </tr>
    <tr>
      <td>resourceTrigger.queryCriteria.resultForDelete</td>
      <td>test-passes</td>
      <td/>
    </tr>
    <tr>
      <td>resourceTrigger.canFilterBy</td>
      <td>_lastUpdated<br/>
        code<br/>
        owner<br/>
        requester<br/>
        status</td>
      <td>owner or requester will almost always be used.  code and status can be used to further filter if desired</td>
    </tr>
  </tbody>
</table>

##### ServiceRequest topic
This topic allows for monitoring for changes to a ServiceRequest when an organization is involved in fulfilling that request.  (E.g. to be
aware if the request is suspended, cancelled or otherwise modified.  The intent with this subscription is that the filter criteria will be
updated regularly to refer to the specific ServiceRequest ids the organization is fulfilling.  Once fulfillment is complete, the ServiceRequest
will no longer need to be monitored.

<table class="grid">
  <thead>
    <tr>
      <th>Property</th>
      <th>Value</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>URL</td>
      <td>http://hl7.org/fhir/us/sdoh-clinicalcare/SubscriptionTopic/Servicerequest</td>
      <td>This is what will appear in <i>backport-topic-canonical</i> extension</td>
    </tr>
    <tr>
      <td>resourceTrigger.resourceType</td>
      <td>ServiceRequest</td>
      <td/>
    </tr>
    <tr>
      <td>resourceTrigger.methodCriteria</td>
      <td>update, delete</td>
      <td>'delete' is not an expected action within the scope of this IG</td>
    </tr>
    <tr>
      <td>resourceTrigger.canFilterBy</td>
      <td>_lastUpdated<br/>
        _id</td>
      <td/>
    </tr>
  </tbody>
</table>
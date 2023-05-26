### Use of Task Status

Task.status is the communication mechanism that indicates the status of the fulfillment of a referral or patient-assigned 'to-do' (e.g. requested, accepted, in progress or completed).
Setting the status allows the initiator of the task to understand how (and if) it is progressing. The value sets for the [Referral Task](StructureDefinition-SDOHCC-TaskForReferralManagement.html) status and the [Patient Task](StructureDefinition-SDOHCC-TaskForPatient.html) status are different due to the purpose of the exchange between the requesting entity and the intermediary or performing entity [Referral Task](StructureDefinition-SDOHCC-TaskForReferralManagement.html) vs the exchange with the patient [Patient Task](StructureDefinition-SDOHCC-TaskForPatient.html).  See those profile pages for details.

The guidance on this page details important concepts for implementation. See [Referral Workflow](referral_workflow.html)  to learn how the concepts fit into the overarching guidance.

### Checking Task Status

The Gravity workflow around referrals involves all parties being aware of when relevant Tasks and any associated ServiceRequests (for referrals) have been created and/or updated. In most cases, the Tasks will reside within the EHR system of the initiating provider.  In this case, the EHR will always be aware when the Task is updated, so the challenge of monitoring Tasks will fall solely on the service delivery organization.  However, the Gravity workflow also supports Tasks being posted to a Community Based Organization's (CBO's) FHIR server or an intermediary organization like a Coordination Platform (CP) that is responsible for managing the referral fulfillment process.  In these circumstances, the EHR will need to monitor for changes to Tasks in addition to or instead of the Service Provider.

The types of task occurrences that may be of interest include:
<br>
**Service Delivery Organizations (CBO or CP)**
<br>
* A new Task has been assigned to the organization
* A ServiceRequest associated with a Task assigned to the organization has been modified
* A ServiceRequest associated with a Task assigned to the organization has been canceled

**EHR systems (Provider)**
<br>
* An assigned Task has been accepted or rejected
* Outputs have been added to a Task
* A Task has been marked as complete

There are two mechanisms for detecting the above changes - polling and subscriptions.

#### Polling

In this mode, the system needing information (the 'client') occasionally queries the system maintaining the relevant Tasks and/or ServiceRequests to see if there is anything 'new'.  Clients may need to perform queries against multiple clients if relevant Tasks and ServiceRequests will not be maintained on the same server. To poll, the client will perform a [search]({{site.data.fhir.path}}search.html) for Tasks that are filtered to those either owned or requested by the searching organization. The search would also filter to only include those Tasks that had been created or changed since the server last looked.
E.g.

```[base]/Task?owner=https://example.com/fhir/Organization/123&_lastupdated=gt2021-05-03T17:23:18.1732-04:00```
or
```[base]/Task?owner=https://example.com/fhir/Organization/456&_lastupdated=gt2021-05-03T17:23:18.1732-04:00```

The time-stamp specified would be the search result returned from the last search.

If unassigned Tasks are possible - i.e., where the organization to perform the service isn't pre-identified and the Task is open to whoever wishes to claim and perform it - organizations interested in examining Tasks available to claim would poll as follows:

```[base]/Task?owner:missing=true&status=requested&_lastupdated=gt2021-05-03T17:23:18.1732-04:00```

The frequency of polling needs to be often enough to allow for timely response to changes, while not imposing too high a requirement on system performance. For Gravity, systems that use polling SHALL check for new/updated information at least once per business day and SHOULD check for information at least once per hour during normal hours of operation.  Systems SHOULD NOT query more often than every 15 minutes unless there is an urgent change they are monitoring for.
#### Subscription
In the subscription mechanism, instead of the client system regularly querying the server to see if there are new Tasks or changes to existing Tasks, the client creates a
Subscription instance on the server that indicates that it wants to be notified about changes to Tasks and, in the Subscription, provides filters that describe what
subset of Tasks it is interested in.  The server will then push notifications when there are new Tasks and the client can then query for the specific Tasks that have changed.

This Gravity functionality is based on the [R5 Subscription backport](http://hl7.org/fhir/uv/subscriptions-backport) implementation guide.  This implementation guide
allows pre-adoption of the FHIR R5 topic-based subscription approach in R4 implementations and is the subscription approach that most U.S. EHR vendors have agreed to
support.  Implementers of this Gravity IG who choose to support Subscription must comply with the Subscription Backport IG for the purpose of monitoring Tasks and, if
necessary, ServiceRequests.

For the purposes of this IG, there will be no need for 'topic discovery' as there are only two topics of interest - one for [monitoring Task](#task-topic) and one for [monitoring
ServiceRequest](#servicerequest-topic).  While neither of these topics are unique to the Gravity IG, because no standard topics have yet been defined for US Core, this IG will define the needed
topics here.  In the future, these topics may be subsumed into general-purpose topics defined by US Core and/or the FHIR core specification.

Servers supporting subscription SHALL support the rest-hook and e-mail channel mechanism.  They MAY support the SMS channel mechanism.  When acting as subscription clients, EHRs, CPs and FHIR Server-enabled CBOs SHALL support rest-hook.  Patient and FHIR-Application Enabled CBOs will typically receive notifications via e-mail or SMS.  In this case, the notification goes to a user rather than to the system and the user triggers their system to retrieve the records by opening their application.  Servers SHALL support both JSON and XML and clients SHALL support at least one of these.  Client and server SHALL support id-only, though they may  also support other content approaches.  The id-only approach means that the id of the Task or ServiceRequest that was updated or created will be provided.  The client will then perform a read or a query to
retrieve the specified record(s) specified in the subscription notification. E.g.

<code>[base]/Task?_id=1234,5678</code>

If search is used, the client MAY use _include=Task:focus to retrieve the referenced ServiceRequest as well.  E.g.
<code>[base]/Task?_id=1234,5678&_include=Task:focus</code>

##### Task topic
This topic allows for monitoring for newly created Tasks as well as updates to assigned or requested Tasks.

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
This topic allows for monitoring for changes to a ServiceRequest when an organization is involved in fulfilling that request (e.g. to be aware if the request is suspended, canceled or otherwise modified).  The intent with this subscription is that the filter criteria will be updated regularly to refer to the specific ServiceRequest ids the organization is fulfilling.  Once fulfillment is complete, the ServiceRequest will no longer need to be monitored.

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

{% include markdown-link-references.md %}
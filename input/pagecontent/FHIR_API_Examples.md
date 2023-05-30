The FHIR API Examples section is being provided as a foundation that will continue to be built upon and is not currently validated.

### Direct Referral Workflow

#### Post Referral Task

**Request**

POST `https://FHIR_SERVER_BASE_URL/Task`

Request Headers
~~~
Accept: application/fhir+json
Content-Type: application/fhir+json
~~~
Request Body
---
{
  "resourceType" : "Task",
  "text" : {
    "status" : "generated",
    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Omitted for this example</div>"
  },
  "status" : "requested",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/CodeSystem/task-code",
      "code" : "fulfill",
      "display" : "Fulfill the focal request"
    }]
  },
  "focus" : {
    "reference" : "ServiceRequest/SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample"
  },
  "for" : {
    "reference" : "Patient/pat-53234",
    "display" : "COLIN ABBAS"
  },
  "authoredOn" : "2020-09-11T21:56:54.671Z",
  "requester" : {
    "reference" : "PractitionerRole/SDOHCC-PractitionerRoleDrJanWaterExample",
    "display" : "Dr Jan Water Family Medicine Physician"
  },
  "owner" : {
    "reference" : "Organization/SDOHCC-OrganizationCoordinationPlatformExample",
    "display" : "ABC Coordination Platform"
  }
}
---

**Response**

201 Created

Response Headers
~~~
Location: https://FHIR_SERVER_BASE_URL/Task/SDOHCC-TaskReferralManagementOrderFulfillmentAcceptedExample/_history/TASK_VERSION
~~~

#### Post Subscription

**Request**

POST `https://FHIR_SERVER_BASE_URL/Subscription`

Request Headers
~~~
Accept: application/fhir+json
Content-Type: application/fhir+json
~~~

**Response**

201 Created

Response Headers
~~~
Location: https://FHIR_SERVER_BASE_URL/Subscription/SUBSCRIPTION_ID/_history/SUBSCRIPTION_VERSION
~~~
Response Body
~~~
~~~

#### Get ServiceRequest & referenced resources

**Request**

GET `https://OTHER_FHIR_SERVER_BASE_URL/ServiceRequest/SERVICE_REQUEST_ID`

Request Headers
~~~
Accept: application/fhir+json
~~~

**Response**

200 OK

Response Headers
~~~
Content-Type: application/fhir+json
~~~
Response Body
~~~
{
  "resourceType" : "ServiceRequest",
  "id" : "SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample",
  "text" : {
    "status" : "generated",
    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Omitted for this example</div>"
  },
  "status" : "active",
  "intent" : "order",
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "410606002",
      "display" : "Social service procedure"
    }]
  },
  {
    "coding" : [{
      "system" : "http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes",
      "code" : "food-insecurity",
      "display" : "Food Insecurity"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "467771000124109",
      "display" : "Assistance with application for food pantry program"
    }]
  },
  "subject" : {
    "reference" : "Patient/pat-53234",
    "display" : "COLIN ABBAS"
  },
  "reasonReference" : [{
    "reference" : "Condition/SDOHCC-ConditionFoodInsecurityExample"
  }]
}
~~~

#### Send notification

**Request**

POST `https://NOTIFICATION_SERVER_URL/endpoint`

Request Headers
~~~
Accept: application/fhir+json
Content-Type: application/fhir+json
~~~

**Response**

201 Created

Response Headers
~~~
~~~
Response Body
~~~
~~~

#### Get Task

**Request**

GET `https://FHIR_SERVER_BASE_URL/Task/TASK_ID`

Request Headers
~~~
Accept: application/fhir+json
~~~

**Response**

200 OK

Response Headers
~~~
Content-Type: application/fhir+json
~~~
Response Body
~~~
{
  "resourceType" : "Task",
  "id" : "SDOHCC-TaskReferralManagementOrderFulfillmentAcceptedExample",
  "text" : {
    "status" : "generated",
    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Omitted for this example</div>"
  },
  "status" : "accepted",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/CodeSystem/task-code",
      "code" : "fulfill",
      "display" : "Fulfill the focal request"
    }]
  },
  "focus" : {
    "reference" : "ServiceRequest/SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample"
  },
  "for" : {
    "reference" : "Patient/pat-53234",
    "display" : "COLIN ABBAS"
  },
  "authoredOn" : "2020-09-11T21:56:54.671Z",
  "requester" : {
    "reference" : "PractitionerRole/SDOHCC-PractitionerRoleDrJanWaterExample",
    "display" : "Dr Jan Water Family Medicine Physician"
  },
  "owner" : {
    "reference" : "Organization/SDOHCC-OrganizationCoordinationPlatformExample",
    "display" : "ABC Coordination Platform"
  }
}
~~~

#### Send notification

**Request**

POST `https://NOTIFICATION_SERVER_URL/endpoint`

Request Headers
~~~
Accept: application/fhir+json
Content-Type: application/fhir+json
~~~

**Response**

201 Created

Response Headers
~~~
~~~
Response Body
~~~
~~~

#### Get Task

**Request**

GET `https://FHIR_SERVER_BASE_URL/Task/TASK_ID`

Request Headers
~~~
Accept: application/fhir+json
~~~

**Response**

200 OK

Response Headers
~~~
Content-Type: application/fhir+json
~~~
Response Body
~~~
{
  "resourceType" : "Task",
  "id" : "SDOHCC-TaskReferralManagementOrderFulfillmentAcceptedExample",
  "text" : {
    "status" : "generated",
    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Omitted for this example</div>"
  },
  "status" : "in-progress",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/CodeSystem/task-code",
      "code" : "fulfill",
      "display" : "Fulfill the focal request"
    }]
  },
  "focus" : {
    "reference" : "ServiceRequest/SDOHCC-ServiceRequestActiveFoodPantryApplicationAssistExample"
  },
  "for" : {
    "reference" : "Patient/pat-53234",
    "display" : "COLIN ABBAS"
  },
  "authoredOn" : "2020-09-11T21:56:54.671Z",
  "requester" : {
    "reference" : "PractitionerRole/SDOHCC-PractitionerRoleDrJanWaterExample",
    "display" : "Dr Jan Water Family Medicine Physician"
  },
  "owner" : {
    "reference" : "Organization/SDOHCC-OrganizationCoordinationPlatformExample",
    "display" : "ABC Coordination Platform"
  }
}
~~~

#### Send notification

**Request**

POST `https://NOTIFICATION_SERVER_URL/endpoint`

Request Headers
~~~
Accept: application/fhir+json
Content-Type: application/fhir+json
~~~

**Response**

201 Created

Response Headers
~~~
~~~
Response Body
~~~
~~~

#### Get Task

**Request**

GET `https://FHIR_SERVER_BASE_URL/Task/TASK_ID`

Request Headers
~~~
Accept: application/fhir+json
~~~

**Response**

200 OK

Response Headers
~~~
Content-Type: application/fhir+json
~~~
Response Body
~~~
{
  "resourceType" : "Task",
  "id" : "SDOHCC-TaskReferralManagementOrderFulfillmentAcceptedExample",
  "text" : {
    "status" : "generated",
    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Omitted for this example</div>"
  },
  "partOf" : [{
    "reference" : "Task/SDOHCC-TaskReferralManagementOrderFulfillmentCompletedExample"
  }],
  "status" : "completed",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/CodeSystem/task-code",
      "code" : "fulfill",
      "display" : "Fulfill the focal request"
    }]
  },
  "focus" : {
    "reference" : "ServiceRequest/SDOHCC-ServiceRequestSubreferralSummerFoodProgramExample"
  },
  "for" : {
    "reference" : "Patient/pat-53234",
    "display" : "COLIN ABBAS"
  },
  "authoredOn" : "2019-09-12T21:56:54.671Z",
  "requester" : {
    "reference" : "Organization/SDOHCC-OrganizationCoordinationPlatformExample",
    "display" : "ABC Coordination Platform"
  },
  "owner" : {
    "reference" : "Organization/SDOHCC-OrganizationClinicExample",
    "display" : "Better Health Clinic"
  },
  "output" : [{
    "type" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes",
        "code" : "resulting-activity",
        "display" : "Resulting Activity"
      }]
    },
    "valueReference" : {
      "reference" : "Procedure/SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample"
    }
  }]
}
~~~

#### Get Procedures

**Request**

GET `https://FHIR_SERVER_BASE_URL/Procedure/SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample`

Request Headers
~~~
Accept: application/fhir+json
~~~

**Response**

200 OK

Response Headers
~~~
Content-Type: application/fhir+json
~~~
Response Body
~~~
{
  "resourceType" : "Procedure",
  "id" : "SDOHCC-ProcedureSummerFoodProgramApplicationAssistanceExample",
  "text" : {
    "status" : "generated",
    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Omitted for this example</div>"
  },
  "basedOn" : [{
    "reference" : "ServiceRequest/SDOHCC-ServiceRequestSubreferralSummerFoodProgramExample"
  }],
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "410606002",
      "display" : "Social service procedure"
    },
    {
      "system" : "http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/SDOHCC-CodeSystemTemporaryCodes",
      "code" : "food-insecurity",
      "display" : "Food Insecurity"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "467681000124101",
      "display" : "Assistance with application for Summer Food Service Program"
    }]
  },
  "subject" : {
    "reference" : "Patient/pat-53234",
    "display" : "COLIN ABBAS"
  },
  "performedDateTime" : "2020-09-22",
  "reasonReference" : [{
    "reference" : "Condition/SDOHCC-ConditionFoodInsecurityExample"
  }]
}
~~~

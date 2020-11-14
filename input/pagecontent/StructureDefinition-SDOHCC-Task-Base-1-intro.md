### Additional Guidance

The SDOHCC\_Task\_1 profile allows the representation of Tasks for the purpose of enabling a task owner to provide status feedback and details with respect to a placed order (i.e., ServiceRequest).

The sections that follow provide additional guidance for some elements in the SDOHCC\_Task\_Base\_1 profile.

#### Task.focus

Task.focus references the SDOHCC\_ServiceRequest\_Base\_1 that is to be fulfilled by the task owner (e.g., a Community Based Organization task owner).

#### Task.output

Task.output output specifies activities (e.g., Procedure) performed to fulfill an order (i.e., ServiceRequest).

Task.output is sliced to allow a PerformedActivityReference slice and a PerformedActivityCode slice.

Task.output.type for PerformedActivityReference slice and the PerformedActivityCode slice is bound to the &quot;resulting-activity&quot; code from the &quot;SDOHCC CodeSystem Temporary Codes&quot;.
<div markdown="1" class="note-to-balloters">
**NOTE: WE ARE ACTIVELY SEEKING FEEDBACK ON THE FHIR STRUCTURES AND NARRATIVE GUIDANCE SURROUNDING THE ENROLLMENT STATUS ([FHIR-53446](https://jira.hl7.org/browse/FHIR-53446)) USE CASE. WE ENCOURAGE READERS TO REVIEW THE PROPOSED CHANGES AND SUBMIT BALLOT COMMENTS AGAINST THEM.**
</div>

The SDOHCC Observation Program Enrollment Status profile is the primary resource used to convey an individual's enrollment status.

- Observation.code: This will point to a CodeableConcept representing the specific program (e.g. SNAP, WIC, etc.).
- Observation.subject: This will reference the Patient resource for the individual.
- Observation.effective[x]: This will capture the date and time information relevant to the status.
- Observation.value[x]: This CodeableConcept will contain the specific status, with potential values including:
    - Enrolled
    - Not enrolled
    - Not enrolled, on waitlist
- Observation.note:  Used to capture additional information about the enrollment status such as information about the waitlist (e.g. “The waitlist is currently 2 months long.  We will notify the individual when they are ready to be enrolled.”).
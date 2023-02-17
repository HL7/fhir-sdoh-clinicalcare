Instance: SDOHCC-ObservationResponsePRAPAREUnmetNeedsMultiselectExample
InstanceOf: SDOHCCObservationScreeningResponse
Title: "SDOHCC-ObservationResponsePRAPAREUnmetNeedsMultiselectExample"
Usage: #example
* meta.versionId = "3"
* meta.lastUpdated = "2021-06-17T19:18:41.399+00:00"
* meta.source = "#Ts3pB9m4EHd7rJet"
* category[0] = $observation-category#social-history "Social History"
* category[+] = $observation-category#survey "Survey"
* category[+] = $SDOHCC-CodeSystemTemporaryCodes#sdoh-category-unspecified "SDOH Category Unspecified"
* status = #final
* code = $loinc#93031-3 "Have you or any family members you live with been unable to get any of the following when it was really needed in past 1 year [PRAPARE]"
* subject.reference = "Patient/pat-53234"
* subject.display = "COLIN ABBAS"
* effectiveDateTime = "2021-04-26T13:56:33.747Z"
* issued = "2021-04-26T13:56:33.747Z"
* performer.reference = "Patient/pat-53234"
* performer.display = "COLIN ABBAS"
* derivedFrom.reference = "QuestionnaireResponse/SDOHCC-QuestionnaireResponsePRAPAREExample"
* component[0].code = $loinc#93031-3 "Have you or any family members you live with been unable to get any of the following when it was really needed in past 1 year [PRAPARE]"
* component[=].valueCodeableConcept = $loinc#LA30126-9 "Clothing"
* component[+].code = $loinc#93031-3 "Have you or any family members you live with been unable to get any of the following when it was really needed in past 1 year [PRAPARE]"
* component[=].valueCodeableConcept = $loinc#LA30127-7 "Child care"
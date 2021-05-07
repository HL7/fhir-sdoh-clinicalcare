[Previous Page - Mapping Instructions HVS Questionnaire](mapping_instructions_hvs_questionnaire.html)

The following is an example of a map that is used to generate a StructureMap to extract a Bundle of Observations and Conditions from a PRAPARE QuestionnaireResponse. 

```
/// name = "SDOHCC_StructureMap_PRAPAREMapper"
/// status = draft

map "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureMap/SDOHCC-StructureMap-PRAPAREMapper" = "SDOHCC StructureMap PRAPARE Mapper"

uses "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse" alias questionnaireResponse as source
uses "http://hl7.org/fhir/StructureDefinition/Bundle" as target
uses "http://hl7.org/fhir/StructureDefinition/Observation" as target
uses "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Condition-Base-1" alias sdohccCondition as target
uses "http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Observation-ScreeningResponseBase-1" alias sdohccObservation as target

group sdohMapping(source src : questionnaireResponse, target bundle : Bundle) {
  //temporarily set id to human-readable id as example
  //src -> bundle.id = uuid();
  src -> bundle.id = 'SDOHCC-Bundle-PRAPARE-Example';
  src -> bundle.type = 'transaction';
  
  //for each answer item in the questionnareResponse, create an Observation and add it to the groupObservation
  src.item as rootItem -> bundle.entry as entry then 
    rootContent(src, rootItem, bundle);

  //create group observation containing all observations as hasMember
  src -> bundle.entry as entry, entry.resource = create('sdohccObservation') as groupObservation then 
    TransformGroupObservation(src, bundle, groupObservation, entry);
}

group rootContent(source qResponse: questionnaireResponse, source rootItem, target bundle) {
  rootItem.item as groupItem -> bundle.entry as entry then 
    groupContent(qResponse, groupItem, bundle);
}

group groupContent(source qResponse: questionnaireResponse, source groupItem, target bundle) {
  groupItem.item as questionItem -> bundle.entry as entry, entry.resource = create('sdohccObservation') as observation then
    TransformObservation(qResponse, questionItem, bundle, observation, entry, bundle);
}

group TransformObservation(source src: questionnaireResponse, source answerItem, source bundle, target observation: sdohccObservation, target entry, target bundle)
{
  src -> observation.id = uuid() then
  	SetObservationFullUrl(observation, entry);
  src -> observation.status = 'final';
  src -> observation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'social-history', 'Social History');
  src -> observation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'survey', 'Survey');
 
  //set dates
  src.authored as authored -> observation.issued = authored, observation.effective = authored;
  
  src.subject as qSubject -> observation.subject = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };
  src.subject as qSubject -> observation.performer = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };  

  src.id as id -> observation.derivedFrom = create('Reference') as newReference then {
    id -> newReference.reference = append('QuestionnaireResponse/', id);
  };

  answerItem.answer as answer -> observation.value = create('CodeableConcept') as newCC then {
    answer.valueCoding as coding -> newCC.coding = coding as newCoding;
  };

  //Set observation.code mapping for each corresponding answer

  // 1. Ethnicity
  answerItem where "linkId = '/93043-8/56051-6'" -> observation.code = cc('http://loinc.org', '56051-6') as code;
  answerItem where "linkId = '/93043-8/56051-6'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  //TBD: How to handle multiple answers for this question?
  // 2. Race
  answerItem where "linkId = '/93043-8/32624-9'" -> observation.code = cc('http://loinc.org', '32624-9') as code;
  answerItem where "linkId = '/93043-8/32624-9'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  // 3. Farm Worker Status
  answerItem where "linkId = '/93043-8/93035-4'" -> observation.code = cc('http://loinc.org', '93035-4') as code;
  answerItem where "linkId = '/93043-8/93035-4'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  // 4. Veteran Status
  answerItem where "linkId = '/93043-8/93034-7'" -> observation.code = cc('http://loinc.org', '93034-7') as code;
  answerItem where "linkId = '/93043-8/93034-7'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'veteran-status';
        src -> newCoding.display = 'Veteran Status';
    };
  };  
  
  // 5. English Proficiency
  answerItem where "linkId = '/93043-8/54899-0'" -> observation.code = cc('http://loinc.org', '54899-0') as code;
  answerItem where "linkId = '/93043-8/54899-0'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  }; 

  // 6. Household Size
  answerItem where "linkId = '/93042-0/63512-8'" -> observation.code = cc('http://loinc.org', '63512-8') as code;
  answerItem where "linkId = '/93042-0/63512-8'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'housing-instability-homelessness';
        src -> newCoding.display = 'Housing Instability Homelessness';
    };
  };
  //TODO: TBD: Observation profile should allow number as type for value.

  // 7. Housing
  answerItem where "linkId = '/93042-0/71802-3'" -> observation.code = cc('http://loinc.org', '71802-3') as code;
  answerItem where "linkId = '/93042-0/71802-3'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'housing-instability-homelessness';
        src -> newCoding.display = 'Housing Instability Homelessness';
    };
  };

  // 8. Housing Status
  answerItem where "linkId = '/93042-0/93033-9'" -> observation.code = cc('http://loinc.org', '93033-9') as code;
  answerItem where "linkId = '/93042-0/93033-9'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'housing-instability-homelessness';
        src -> newCoding.display = 'Housing Instability Homelessness';
    };
  };  

  // 9. Neighborhood
  //Note: Answers to this question will not be converted to Observations

  // 10. Education
  answerItem where "linkId = '/93041-2/82589-3'" -> observation.code = cc('http://loinc.org', '82589-3') as code;
  answerItem where "linkId = '/93041-2/82589-3'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'educational-attainment';
        src -> newCoding.display = 'Educational attainment';
    };
  }; 

  // 11. Employment
  answerItem where "linkId = '/93041-2/67875-5'" -> observation.code = cc('http://loinc.org', '67875-5') as code;
  answerItem where "linkId = '/93041-2/67875-5'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'employment-status';
        src -> newCoding.display = 'Employment Status';
    };
  };

  // 12. Insurance
  answerItem where "linkId = '/93041-2/76437-3'" -> observation.code = cc('http://loinc.org', '76437-3') as code;
  answerItem where "linkId = '/93041-2/76437-3'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };

  // 13. Household Income
  answerItem where "linkId = '/93041-2/63586-2'" -> observation.code = cc('http://loinc.org', '63586-2') as code;
  answerItem where "linkId = '/93041-2/63586-2'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'financial-insecurity';
        src -> newCoding.display = 'Financial Insecurity';
    };
  };
  //TODO: TBD: Observation profile should allow decimal as type for value.

  // 14. Material Security
  answerItem where "linkId = '/93041-2/93031-3'" -> observation.code = cc('http://loinc.org', '93031-3') as code;
  // answer: Food
  answerItem where "linkId = '/93041-2/93031-3' and answer.valueCoding.code ='LA30125-1'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'food-insecurity';
        src -> newCoding.display = 'Food insecurity';
    };
  };
  //TODO: TBD: Observation profile should allow string as type for value.

  // 15. Transportation
  answerItem where "linkId = '/93041-2/93030-5'" -> observation.code = cc('http://loinc.org', '93030-5') as code;
  answerItem where "linkId = '/93041-2/93030-5'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'transportation-insecurity';
        src -> newCoding.display = 'Transportation Insecurity';
    };
  };

  // 16. Social Integration
  answerItem where "linkId = '/93040-4/93029-7'" -> observation.code = cc('http://loinc.org', '93029-7') as code;
  answerItem where "linkId = '/93040-4/93029-7'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };

  // 17. Stress
  answerItem where "linkId = '/93040-4/93038-8'" -> observation.code = cc('http://loinc.org', '93038-8') as code;
  answerItem where "linkId = '/93040-4/93038-8'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };

  // 18. Incarceration
  answerItem where "linkId = '/93039-6/93028-9'" -> observation.code = cc('http://loinc.org', '93028-9') as code;
  answerItem where "linkId = '/93039-6/93028-9'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  // 19. Refugee
  answerItem where "linkId = '/93039-6/93027-1'" -> observation.code = cc('http://loinc.org', '93027-1') as code;
  answerItem where "linkId = '/93039-6/93027-1'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  // 20. Safety
  answerItem where "linkId = '/93040-4/93038-8'" -> observation.code = cc('http://loinc.org', '93038-8') as code;
  answerItem where "linkId = '/93040-4/93038-8'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };

  // 21. Domestic Violence
  answerItem where "linkId = '/93039-6/93026-3'" -> observation.code = cc('http://loinc.org', '93026-3') as code;
  answerItem where "linkId = '/93039-6/93026-3'" -> observation.category = create('CodeableConcept') as newCC then {
      src -> newCC.coding = create('Coding') as newCoding then {
        src -> newCoding.system = 'http://hl7.org/fhir/us/sdoh-clinicalcare/CodeSystem/sdohcc-temporary-codes';
        src -> newCoding.code = 'sdoh-category-unspecified';
        src -> newCoding.display = 'SDOH Category Unspecified';
    };
  };  

  //create a Condition if homeless
  answerItem where "linkId = '/93042-0/71802-3' and answer.valueCoding.code ='LA30190-5'" -> bundle.entry as entry, entry.resource = create('Condition') as condition then
    TransformCondition(src, bundle, condition, entry), SetConditionCodeAndEvidence1(bundle, condition);

  //create a Condition if unemployed
  answerItem where "linkId = '/93041-2/67875-5' and answer.valueCoding.code ='LA17956-6'" -> bundle.entry as entry, entry.resource = create('Condition') as condition then
    TransformCondition(src, bundle, condition, entry), SetConditionCodeAndEvidence2(bundle, condition);
}

group SetObservationFullUrl(source observation: Observation, target entry)
{
  observation.id as id -> entry.fullUrl = append('http://hl7.org/fhir/us/sdoh-clinicalcare/Observation/', id);
}

group TransformCondition(source src: questionnaireResponse, source bundle, target condition: sdohccCondition, target entry)
{
  src -> condition.id = uuid() then
    SetConditionFullUrl(condition, entry);

  src -> condition.id = uuid() then
    SetConditionFullUrl(condition, entry);

  src -> condition.clinicalStatus = cc('http://terminology.hl7.org/CodeSystem/condition-clinical', 'active', 'Active');
  src -> condition.verificationStatus = cc('http://terminology.hl7.org/CodeSystem/condition-ver-status', 'unconfirmed', 'Unconfirmed');

  src -> condition.category = cc('http://hl7.org/fhir/us/core/CodeSystem/condition-category', 'health-concern', 'Health Concern') as category;
    
  src.authored as authored -> condition.onset = create('Period') as period,
    period.start = authored;

  src.subject as qSubject -> condition.subject = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };

  src.subject as qSubject -> condition.asserter = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };
}

group SetConditionFullUrl(source condition: sdohccCondition, target entry)
{
  condition.id as id -> entry.fullUrl = append('http://hl7.org/fhir/us/sdoh-clinicalcare/Condition/', id);
}

group SetConditionCodeAndEvidence1(source bundle, target condition)
{
  bundle -> condition.code = cc('http://snomed.info/sct', '32911000') as code;
  bundle.entry as entries -> condition.evidence as evidence, evidence.detail = create('Reference') as detailReference then {
  	entries.resource as obs where "code.coding.code = '71802-3'"-> detailReference.reference = reference(obs); 
  };
}

group SetConditionCodeAndEvidence2(source bundle, target condition)
{
  bundle -> condition.code = cc('http://snomed.info/sct', '73438004') as code;
  bundle.entry as entries -> condition.evidence as evidence, evidence.detail = create('Reference') as detailReference then {
  	entries.resource as obs where "code.coding.code = '67875-5'"-> detailReference.reference = reference(obs); 
  };
}

group TransformGroupObservation(source src: questionnaireResponse, source bundle:Bundle, target groupObservation: Observation, target entry)
{
  src -> groupObservation.id = uuid() then
    SetObservationFullUrl(groupObservation, entry);  
  src -> groupObservation.status = 'final';
  src -> groupObservation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'social-history', 'Social History');
  src -> groupObservation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'survey', 'Survey');

  src.authored as authored -> groupObservation.effective = authored;
  src.subject as qSubject -> groupObservation.subject = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };  

  src -> groupObservation.code = cc('http://loinc.org', '93025-5');   

  //only add observations that are derived from the answers
  bundle.entry as entries -> groupObservation.hasMember = create('Reference') as df then {
    entries.resource as obs where "status.exists() and hasMember.exists().not()"-> df.reference = reference(obs); 
  };
}

```


[Next Page - Support for Multiple Domains](support_for_multiple_domains.html)
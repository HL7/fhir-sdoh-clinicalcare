[Previous Page - Patient Story 1](patient_story_1.html)

Below is an example of a map that is used to extract a Bundle of Observations and Conditions from a Hunger Vital Sign [HVS] QuestionnaireResponse.

```
map "http://hl7.org/fhir/us/sdoh-cc/StructureMap/SDOHCC-StructureMap-HungerVitalSignMapper-1" = "SDOHCC StructureMap HungerVitalSignMapper 1"

uses "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse" alias questionnaireResponse as source
uses "http://hl7.org/fhir/StructureDefinition/Bundle" as target
uses "http://hl7.org/fhir/StructureDefinition/Observation" as target
uses "http://hl7.org/fhir/us/sdoh-cc/StructureDefinition/SDOHCC-Condition-Base-1" alias sdohccCondition as target
uses "http://hl7.org/fhir/us/sdoh-cc/StructureDefinition/SDOHCC-Observation-ScreeningResponseBase-1" alias sdohccObservation as target

group sdohMapping(source src : questionnaireResponse, target bundle : Bundle) {
  src -> bundle.id = uuid();
  src -> bundle.type = 'transaction';
  
  //for each answer item in the questionnareResponse, create an Observation and add it to the groupObservation
  src.item as answerItem1 where "linkId = '/88122-7'" -> bundle.entry as entry, entry.resource = create('Observation') as observation1 then
    TransformObservation(src, answerItem1, observation1, entry), TransformObservation1(src, answerItem1, observation1);

  src.item as answerItem2 where "linkId = '/88123-5'" -> bundle.entry as entry, entry.resource = create('Observation') as observation2 then 
    TransformObservation(src, answerItem2, observation2, entry), TransformObservation2(src, answerItem2, observation2);

  src.item as answerItem3 where "linkId = '/88124-3'" -> bundle.entry as entry, entry.resource = create('Observation') as observation3 then 
    TransformObservation(src, answerItem3, observation3, entry), TransformObservation3(src, answerItem3, bundle, observation3); 

  //create group observation containing 3 observations as hasMember
  src -> bundle.entry as entry, entry.resource = create('Observation') as groupObservation then 
	TransformGroupObservation(src, bundle, groupObservation, entry);
  
  //create sample condition
  src -> bundle.entry as entry, entry.resource = create('sdohccCondition') as condition then
    TransformCondition(src, bundle, condition, entry);
}

group TransformObservation(source src: questionnaireResponse, source answerItem, target observation: sdohccObservation, target entry)
{
   src -> observation.id = uuid() then
    	SetObservationFullUrl(observation, entry);
   src -> observation.status = 'final';
   src -> observation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'social-history', 'Social History');
   src -> observation.category = cc('http://terminology.hl7.org/CodeSystem/observation-category', 'survey', 'Survey');
   
   //set fake dates
   src -> observation.issued = '2020-08-18T15:31:38.111Z';
   src -> observation.effective = create('Period') as period,
      period.start = '2019-08-18T12:31:35.123Z',
      period.end = '2020-08-18T14:31:36.456Z';
   
   answerItem.answer as answer -> observation.value = create('CodeableConcept') as newCC then {
     answer.valueCoding as coding -> newCC.coding = coding as newCoding then {
       coding.display as display -> newCC.text = display;
     };
   };

   src.subject as qSubject -> observation.subject = create('Reference') as newReference then {
     qSubject.reference as qReference -> newReference.reference = qReference;
     qSubject.display as qDisplay -> newReference.display = qDisplay;
   };
   src.id as srcId -> observation.derivedFrom = create('Reference') as df,
      df.reference = reference(src);
}

group TransformObservation1(source src: questionnaireResponse, source item, target observation: sdohccObservation)
{
   item as i -> observation.code = cc('http://loinc.org', '88122-7', 'Within the past 12Mo we worried whether our food would run out before we got money to buy more') as code,
      code.text = '(I/We) worried whether (my/our) food would run out before (I/we) got money to buy more.';

   src."source" as qSource -> observation.performer = create('Reference') as newReference then {
     qSource.reference as qReference -> newReference.reference = qReference;
     qSource.display as qDisplay -> newReference.display = qDisplay;
   };   
}

group TransformObservation2(source src: questionnaireResponse, source item, target observation: sdohccObservation)
{
   item as i -> observation.code = cc('http://loinc.org', '88123-5', 'Within the past 12Mo the food we bought just didn\'t last and we didn\'t have money to get more') as code,
     code.text = 'The food that (I/we) bought just didn&#39t last, and (I/we) didn&#39t have money to get more.';
   
   src."source" as qSource -> observation.performer = create('Reference') as newReference then {
     qSource.reference as qReference -> newReference.reference = qReference;
     qSource.display as qDisplay -> newReference.display = qDisplay;
   };   
}

group TransformObservation3(source src: questionnaireResponse, source item, source bundle, target observation: sdohccObservation)
{
   item as i -> observation.code = cc('http://loinc.org', '88124-3', 'Food insecurity risk') as code,
     code.text = 'Food insecurity risk';
     
   bundle.entry as entries -> observation.derivedFrom = create('Reference') as df then 
     TransformObservationDerived(entries, df);
}

group TransformObservationDerived(source entries, target df) {
	entries.resource as obs1 where "code.coding.code = '88122-7'"-> df.reference = reference(obs1); 
	entries.resource as obs2 where "code.coding.code = '88123-5'" -> df.reference = reference(obs2); 
}
group TransformGroupObservation(source src: questionnaireResponse, source bundle:Bundle, target groupObservation: Observation, target entry)
{
  src -> groupObservation.id = uuid() then
       SetObservationFullUrl(groupObservation, entry);  
  src -> groupObservation.status = 'final';
  src -> groupObservation.code = cc('http://loinc.org', '88121-9', 'Hunger Vital Sign [HVS]');   
  
  bundle.entry as entries -> groupObservation.hasMember = create('Reference') as df then {
  	entries.resource as obs1 where "code.coding.code = '88122-7'"-> df.reference = reference(obs1); 
	entries.resource as obs2 where "code.coding.code = '88123-5'" -> df.reference = reference(obs2); 
	entries.resource as obs3 where "code.coding.code = '88124-3'" -> df.reference = reference(obs3); 
  };
}

group SetObservationFullUrl(source observation: Observation, target entry)
{
   observation.id as id -> entry.fullUrl = append('http://hl7.org/fhir/us/sdoh-cc/Observation/', id);
}

group TransformCondition(source src: questionnaireResponse, source bundle, target condition: sdohccCondition, target entry)
{
  src -> condition.id = uuid() then
       SetConditionFullUrl(condition, entry);
       
  src -> condition.clinicalStatus = cc('http://terminology.hl7.org/CodeSystem/condition-clinical', 'active', 'Active');
  src -> condition.verificationStatus = cc('http://terminology.hl7.org/CodeSystem/condition-ver-status', 'confirmed', 'Confirmed');
  src -> condition.category = cc('http://hl7.org/fhir/us/core/CodeSystem/condition-category', 'health-concern', 'Health Concern');
  src -> condition.code = cc('http://snomed.info/sct', '733423003', 'Testing Food insecurity (finding)') as code,
    code.text = 'Food insecurity';
  src -> condition.verificationStatus = cc('http://terminology.hl7.org/CodeSystem/condition-ver-status', 'confirmed', 'Confirmed');
    
  bundle.entry as entries -> condition.evidence as evidence, evidence.detail = create('Reference') as detailReference then {
  	entries.resource as obs3 where "code.coding.code = '88124-3'"-> detailReference.reference = reference(obs3); 
  };

  src.subject as qSubject -> condition.subject = create('Reference') as newReference then {
    qSubject.reference as qReference -> newReference.reference = qReference;
    qSubject.display as qDisplay -> newReference.display = qDisplay;
  };
}

group SetConditionFullUrl(source condition: sdohccCondition, target entry)
{
   condition.id as id -> entry.fullUrl = append('http://hl7.org/fhir/us/sdoh-cc/Condition/', id);
}

```


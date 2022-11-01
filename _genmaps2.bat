@ECHO OFF

java -Dfile.encoding=UTF-8 -jar input-cache\validator_cli.jar input/resources/questionnaireresponse/SDOHCC-QuestionnaireResponseHungerVitalSignExample.xml -output "input/resources/bundle/SDOHCC-BundleHungerVitalSignExample.xml" -transform http://hl7.org/fhir/us/sdoh-clinicalcare/StructureMap/SDOHCC-StructureMapHungerVitalSign -version 4.0 -ig output/package.tgz -ig input/resources/structuremap/SDOHCC-StructureMapHungerVitalSign.xml
java -Dfile.encoding=UTF-8 -jar input-cache\validator_cli.jar input/resources/questionnaireresponse/SDOHCC-QuestionnaireResponsePRAPAREExample.xml -output "input/resources/bundle/SDOHCC-BundlePRAPAREExample.xml" -transform http://hl7.org/fhir/us/sdoh-clinicalcare/StructureMap/SDOHCC-StructureMapPRAPARE -version 4.0 -ig output/package.tgz -ig input/resources/structuremap/SDOHCC-StructureMapPRAPARE.xml

pause
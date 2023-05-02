@ECHO OFF

SETLOCAL
SET dlurl=https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar
SET jarlocation=input-cache\validator_cli.jar

rem ECHO Downloading most recent publisher to %jarlocation% - it's ~150 MB, so this may take a bit
rem CALL POWERSHELL -command if ('System.Net.WebClient' -as [type]) {(new-object System.Net.WebClient).DownloadFile(\"%dlurl%\",\"%jarlocation%\") } else { Invoke-WebRequest -Uri "%dlurl%" -Outfile "%jarlocation%" }

java -Dfile.encoding=UTF-8 -jar input-cache\validator_cli.jar -ig map-source/SDOHCC-Hunger-Vital-Sign-Map.map -compile http://hl7.org/fhir/us/sdoh-clinicalcare/StructureMap/SDOHCC-StructureMapHungerVitalSign -version 4.0 -output input/resources/SDOHCC-StructureMapHungerVitalSign.xml
java -Dfile.encoding=UTF-8 -jar input-cache\validator_cli.jar -ig map-source/SDOHCC-PRAPARE-Map.map -compile http://hl7.org/fhir/us/sdoh-clinicalcare/StructureMap/SDOHCC-StructureMapPRAPARE -version 4.0 -output input/resources/SDOHCC-StructureMapPRAPARE.xml

pause
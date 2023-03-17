#!/bin/bash
FILES="../fsh-generated/resources/CapabilityStatement*.json"
for cap in $FILES
do
    narrcap="${cap##*/}"
    capname="${narrcap%.*}"
    prefix="CapabilityStatement-"
    id=${capname#"$prefix"}
    echo "Processing $cap file ==> $narrcap file;   id = $id"
    cp ${cap} ./${narrcap}
    echo "R4CapStatement_NarrativeMaker.py ${narrcap}"
    python3 R4CapStatement_NarrativeMaker.py ${narrcap}
    narrcap="Narrative-${narrcap}"
    echo "transferdiv.rb ${narrcap} ../input/fsh/instances/${id}.fsh ${id}.fsh"
    ruby transferdiv.rb ${narrcap} ../input/fsh/instances/${id}.fsh ${id}.fsh
done

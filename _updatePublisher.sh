#!/bin/bash
dlurl=https://fhir.github.io/latest-ig-publisher/org.hl7.fhir.publisher.jar
publisher_jar=org.hl7.fhir.publisher.jar
input_cache_path=./input-cache/
scriptdlroot="https://raw.githubusercontent.com/costateixeira/ig-publisher-scripts/main"
build_bat_url="${scriptdlroot}/_build.bat"
build_sh_url="${scriptdlroot}/_build.sh"
update_bat_url=${scriptdlroot}/_updatePublisher.bat
update_sh_url=${scriptdlroot}/_updatePublisher.sh
gen_bat_url=${scriptdlroot}/_genonce.bat
gen_sh_url=${scriptdlroot}/_genonce.sh
gencont_bat_url=${scriptdlroot}/_gencontinuous.bat
gencont_sh_url=${scriptdlroot}/_gencontinuous.sh


set -e
if ! type "curl" > /dev/null; then
	echo "ERROR: Script needs curl to download latest IG Publisher. Please install curl."
	exit 1
fi

FORCE=false

while :; do
    case $1 in
        -f|--force) FORCE=true ;;
        --)
            shift
            break
            ;;
        *) break
    esac
    shift
done

function update_scripts_prompt() {
  read -p "Update scripts? (Y/N): " update_confirm
  if [[ "$update_confirm" =~ ^[Yy]$ ]]; then
    echo "Updating scripts..."
    curl -L "$build_bat_url" -o "_build.new.bat" && mv "_build.new.bat" "_build.bat"
    curl -L "$build_sh_url" -o "_build.new.sh" && mv "_build.new.sh" "_build.sh"
    curl -L "$update_bat_url" -o "_updatePublisher.new.bat" && mv "_updatePublisher.new.bat" "_updatePublisher.bat"
    curl -L "$update_sh_url" -o "_updatePublisher.new.sh" && mv "_updatePublisher.new.sh" "_updatePublisher.sh"
    curl -L "$gen_bat_url" -o "_genonce.new.bat" && mv "_genonce.new.bat" "_genonce.bat"
    curl -L "$gen_sh_url" -o "_genonce.new.sh" && mv "_genonce.new.sh" "_genonce.sh"
    curl -L "$gencont_bat_url" -o "_gencontinuous.new.bat" && mv "_gencontinuous.new.bat" "_gencontinuous.bat"
    curl -L "$gencont_sh_url" -o "_gencontinuous.new.sh" && mv "_gencontinuous.new.sh" "_gencontinuous.sh"
    echo "Scripts updated."
  else
    echo "Skipped updating scripts."
  fi
}

publisher="$input_cache_path$publisher_jar"
if test -f "$publisher"; then
	echo "IG Publisher FOUND in input-cache"
	jarlocation="$publisher"
	jarlocationname="Input Cache"
	upgrade=true
else
	publisher="../$publisher_jar"
	upgrade=true
	if test -f "$publisher"; then
		echo "IG Publisher FOUND in parent folder"
		jarlocation="$publisher"
		jarlocationname="Parent Folder"
		upgrade=true
	else
		echo IG Publisher NOT FOUND in input-cache or parent folder...
		jarlocation=$input_cache_path$publisher_jar
		jarlocationname="Input Cache"
		upgrade=false
	fi
fi

if [[ "$FORCE" != true ]]; then
  if "$upgrade"; then
    message="Overwrite $jarlocation? (Y/N) "
  else
    echo Will place publisher jar here: "$jarlocation"
    message="Ok (enter 'y' or 'Y' to continue, any other key to cancel)?"
  fi
  read -r -p "$message" response
fi

if [[ "$FORCE" ]] || [[ "$response" =~ ^([yY])$ ]]; then
	echo "Downloading most recent publisher to $jarlocationname - it's ~100 MB, so this may take a bit"
#	wget "https://fhir.github.io/latest-ig-publisher/org.hl7.fhir.publisher.jar" -O "$jarlocation" 
	curl $dlurl -o "$jarlocation" --create-dirs
	update_scripts_prompt	
else
	echo cancel...
fi


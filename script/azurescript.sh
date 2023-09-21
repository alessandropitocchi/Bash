#!/bin/bash

# Clear

clear_screen () {
	clear
}

# Setup cli for az connection

setup() {
	# install az cli
	# curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
	# Login
	az login --use-device-code
	echo -e "\nYou are logged in\n"
}

# Print recommended regions

print_regions() {
	regions=($( az account list-locations --query "[?metadata.regionCategory=='Recommended'].name" -o tsv ))
	for r in "${regions[@]}"
	do 
		echo $r
	done
}

# Check regions selected

check_regions() {
	echo -e "Recommended regions: \n"
	local region_exist=false
	while [[ "$region_exist" = false ]]; do
		print_regions
		echo -e "\n"
		read -p "Select a region: " region_selected
		for r in "${regions[@]}"
		do
			if [[ "$r" == "$region_selected" ]];
			then
				echo -e "\nRegion exist\n"
				region_exist=true
				break
			else
				continue	
			fi
		done
	done
}

# Check resource group name

check_resource_group () {
	while true; do
		read -p "Enter a name for the resource group: " resource_group
		if [ $(az group exists --name $resource_group) = true ]; then
			echo "The name $resource_group already exists!"	
		else
			break
		fi
	done
}

# Create resource group

create_resource_group () {
	echo -e "\nCreating Resource Group $resource_group in $region_selected\n"
	az group create --name $resource_group --location $region_selected
}

# List resource group

list_resource_group () {
	az group list -o Table
}

# Delete resource group

delete_resource_group () {
	echo -e "\n"
	read -p "Inserire nome resource group da eliminare: " resource_group_del
	echo -e "\n"
	az group delete --name $resource_group_del --no-wait --yes --verbose
}

# setup
# check_regions
# check_resource_group
# create_resource_group
# list_resource_group

while true; do
	echo -e "\n1) Login Azure Cli"
	echo "2) Visualizzare Resource group"
	echo "3) Creare Resource Group"
	echo "4) Eliminare Resource Group"
	echo "5) Esci"
	read -p "Cosa vuoi fare: " scelta

	case $scelta in
		1)
			clear_screen
			setup
			;;
		2)
			clear_screen
			list_resource_group
			;;
		3)
			clear_screen
			check_regions
			check_resource_group
			create_resource_group
			;;
		4)	
			clear_screen
			list_resource_group	
			delete_resource_group
			;;
		5)
			break
			;;
		*)
			echo "scelta non valida"
	esac
done


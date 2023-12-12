#!/bin/bash

# Output file
output_file="stress-ng-report.log"

# Function to print a separator line
print_separator() {
  echo "-------------------------" >> "$output_file"
}

# Loop through all nodes
for index in $(oc get nodes -o 'jsonpath={.items[*].metadata.name}'); do
  # Print Node details
  echo "Node: $index" >> "$output_file"

  # Print pods details in Stability Namespace on the Node and display top resources
  oc get pods -A -o wide | awk -v zindex="$index" '/stability/ && $8 == zindex {print $0; system("oc adm top pod -n " $1 " " $2)}' >> "$output_file"
  
  # Print the number of stress-ng Pods on the Node
  count=$(oc get pods -A -o wide | awk -v zindex="$index" '/stability/ && $8 == zindex {print $0}' | wc -l)
  echo "Number of stress-ng Pods on Node $index: $count" >> "$output_file"
  
  # Print a separator line
  print_separator

  # Display node-wise resource consumption
  oc adm top nodes $index >> "$output_file"
done 

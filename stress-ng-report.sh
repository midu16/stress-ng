#!/bin/bash

# Function to print a separator line
print_separator() {
  echo "-------------------------"
}

# Loop through all nodes
for index in $(oc get nodes -o 'jsonpath={.items[*].metadata.name}'); do
  # Print Node details
  echo "Node: $index"

  # Print pods details in Stability Namespace on the Node and display top resources
  oc get pods -A -o wide | awk -v zindex="$index" '/stability/ && $8 == zindex {print $0; system("oc adm top pod -n " $1 " " $2)}'
  
  # Print the number of stress-ng Pods on the Node
  count=$(oc get pods -A -o wide | awk -v zindex="$index" '/stability/ && $8 == zindex {print $0}' | wc -l)
  echo "Number of stress-ng Pods on Node $index: $count"
  
  # Print a separator line
  print_separator

  # Display node-wise resource consumption
  oc adm top nodes $index
done

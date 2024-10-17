#!/bin/sh -l

# Get the input argument
WHO_TO_GREET=${1}

# Get the current time
CURRENT_TIME=$(date)

# Print the greeting message
echo "Hello, ${WHO_TO_GREET}!"

# Print the current time
echo "Greeting recorded at: ${CURRENT_TIME}"

# Write output to a file in the GitHub Actions environment
echo "time=${CURRENT_TIME}" >> $GITHUB_OUTPUT

# If any output or file creation is needed, do it here
echo "Action completed successfully!"
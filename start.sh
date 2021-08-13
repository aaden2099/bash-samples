#!/bin/bash
# Use bash command to run this setup script, not sh
# For starting Flask API and testing with tox

################################################################################
# Help function
################################################################################
Help()
{
   # Display Help
   printf "\nSyntax: bash start.sh [-d | -development | -h | -t | -testing ]"
   printf "\noptions:\n\n"
   printf " -d               Run server in development mode.\n"
   printf " -development     Run server in development mode.\n"
   printf " -h               Print this Help.\n"
   printf " -t               Run server in testing mode.\n"
   printf " -testing         Run server in testing mode.\n\n"

   printf "Ex: bash start.sh -t  (Run script in testing mode)\n\n"
}

# Get the options for help function
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

printf "\n***********************************************************************\n"
printf "Step 1: Checking installed path for Python 3"
printf "\n***********************************************************************\n"

# Checking if in correct environment (For debugging purposes)
printf "Install path that python3 command invokes:\n"

if [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$OSTYPE" == "darwin"* ]]; then
        # Linux or MacOS
        which python3
else
        # Windows
        where python3
fi

printf "\n\n\n***********************************************************************\n"
printf "Step 2: Activating Python 3 virtual environment"
printf "\n***********************************************************************\n"

# Activating virtual environment if not already inside of it
printf "Activating virtual environment for: "

# Detecting OS of system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux or Mac OSX based OS
        # Activating virtual environment if not already inside of it
        printf "Linux-GNU\n"
        . env/bin/activate

        # Checking if in correct environment (For debugging purposes)
        printf "\nInstall path that python3 command invokes:\n"
        which python3

elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Linux or Mac OSX based OS
        printf "Mac OSX\n"
        . env/bin/activate

        # Checking if in correct environment (For debugging purposes)
        printf "\nInstall path that python3 command invokes:\n"
        which python3

else
    # Windows
    printf "Windows\n"
    source ./env/Scripts/activate

    # Checking if in correct environment (For debugging purposes)
    printf "\nInstall path that python3 command invokes:\n"
    where python3
fi

# Run app based on environment specified
if [ "$1" == "-development" ] || [ "$1" == "-d" ]; then
        printf "\n\n\n***********************************************************************\n"
        printf "Step 3: Formatting code with Black"
        printf "\n***********************************************************************\n"
        black .

        printf "\n\n\n***********************************************************************\n"
        printf "Step 4: Running Flask app in development mode..."
        printf "\n***********************************************************************"

        # Set flask environment variables
        printf "\nSetting flask environment variables in development mode context.\n"
        export FLASK_APP=insert_app_name/app.py
        export FLASK_ENV=development

        # Run Flask app in development mode
        flask run

elif [ "$1" == "-testing" ] || [ "$1" == "-t" ]; then
        printf "\n\n***********************************************************************\n"
        printf "Step 3: Formatting code with Black"
        printf "\n***********************************************************************\n"
        black .

        printf "\n\n\n***********************************************************************\n"
        printf "Step 4: Testing Flask app..."
        printf "\n***********************************************************************"

        # Set flask environment to testing
        printf "\nSetting flask environment variables in testing mode context.\n"
        export FLASK_APP=insert_app_name/app.py
        export FLASK_ENV=testing

        # Run tox.
        printf "\nTesting app with tox and pytest-cov:\n\n\n"
        tox
        printf "\nFinished testing Flask app.\n\n"

else
    # Wrong argument entered
    printf "\nIncorrect argument provided for environment. For help: ./start.sh -h\n\n"
fi
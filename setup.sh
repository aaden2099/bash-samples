#!/bin/bash
# Use bash command to run this setup script, not sh

################################################################################
# Help function
################################################################################
Help()
{
   # Display Help
   printf "\nSyntax: bash setup.sh"
   printf "\noptions:\n\n"
   printf " -h               Print this Help.\n\n"

   printf "Make sure to run this file as a bash script: bash setup.sh\n\n"
}

# Get the options for help function
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

# Detecting OS of system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux based OS
        printf "\nInitiating setup for Linux based OS...\n"

        # Checking installed versions of Python for debugging purposes
        printf "\n***********************************************************************\n"
        printf "Step 1: Checking which versions of Python are installed on this system"
        printf "\n***********************************************************************\n\n"
        printf "Output of python -V is:\n"
        python -V
        printf "\nOutput of python3 -V is:\n"
        python3 -V
        printf "\nPath that python3 command defaults to:\n"
        which python3

        # Creating and activating a python3 virtual environment
        printf "\n\n***********************************************************************\n"
        printf "Step 2: Creating a python3 virtual environment..."
        printf "\n***********************************************************************\n"
        python3 -m venv env
        printf "\nActivating the python3 virtual environment...\n"
        . env/bin/activate

        # Confirming that we are inside the correct environment before installing project requirements
        printf "\nPath that python3 command defaults to:\n"
        which python3

        # Installing Project Requirements
        printf "\n\n***********************************************************************\n"
        printf "Step 3: Installing project requirements from requirements.txt:"
        printf "\n***********************************************************************\n\n"
        pip3 install -r requirements.txt

        # Final instructions
        printf "\n\n***********************************************************************\n"
        printf "Step 4: Start Flask and Tox"
        printf "\n***********************************************************************\n\n"
        printf "If all requirements successfully installed, then start Flask and Tox from the file start.sh\n"
        printf "Instructions contained within README file of this repo for how to do this.\n"
        printf "Or, execute the following command for help/info: ./start.sh -h\n\n"

elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        printf "\nInitiating setup for Mac OSX...\n"

        # Checking installed versions of Python for debugging purposes
        printf "\n***********************************************************************\n"
        printf "Step 1: Checking which versions of Python are installed on this system"
        printf "\n***********************************************************************\n\n"
        printf "Output of python -V is:\n"
        python -V
        printf "\nOutput of python3 -V is:\n"
        python3 -V
        printf "\nPath that python3 command defaults to:\n"
        which python3

        # Creating and activating a python3 virtual environment
        printf "\n\n***********************************************************************\n"
        printf "Step 2: Creating a python3 virtual environment..."
        printf "\n***********************************************************************\n"
        python3 -m venv env
        printf "\nActivating the python3 virtual environment...\n"
        . env/bin/activate

        # Confirming that we are inside the correct environment before installing project requirements
        printf "\nPath that python3 command defaults to:\n"
        which python3

        # Installing Project Requirements
        printf "\n\n***********************************************************************\n"
        printf "Step 3: Installing project requirements from requirements.txt:"
        printf "\n***********************************************************************\n\n"
        pip3 install -r requirements.txt

        # Final instructions
        printf "\n\n***********************************************************************\n"
        printf "Step 4: Start Flask and Tox"
        printf "\n***********************************************************************\n\n"
        printf "If all requirements successfully installed, then start Flask and Tox from the file start.sh\n"
        printf "Instructions contained within README file of this repo for how to do this.\n"
        printf "Or, execute the following command for help/info: ./start.sh -h\n\n"

elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
        printf "\nInitiating setup for Linux environment emulator on Windows\n"

        # Checking installed versions of Python for debugging purposes
        printf "\n***********************************************************************\n"
        printf "Step 1: Checking which versions of Python are installed on this system"
        printf "\n***********************************************************************\n\n"
        printf "Output of python -V is:\n"
        python -V
        printf "\nOutput of python3 -V is:\n"
        python3 -V
        printf "\nPath that python3 command defaults to:\n"
        which python3

        # Creating and activating a python3 virtual environment
        printf "\n\n***********************************************************************\n"
        printf "Step 2: Creating a python3 virtual environment..."
        printf "\n***********************************************************************\n"
        python3 -m venv env
        printf "\nActivating the python3 virtual environment...\n"
        . env/bin/activate

        # Confirming that we are inside the correct environment before installing project requirements
        printf "\nPath that python3 command defaults to:\n"
        which python3

        # Installing Project Requirements
        printf "\n\n***********************************************************************\n"
        printf "Step 3: Installing project requirements from requirements.txt:"
        printf "\n***********************************************************************\n\n"
        pip3 install -r requirements.txt

        # Final instructions
        printf "\n\n***********************************************************************\n"
        printf "Step 4: Start Flask and Tox"
        printf "\n***********************************************************************\n\n"
        printf "If all requirements successfully installed, then start Flask and Tox from the file start.sh\n"
        printf "Instructions contained within README file of this repo for how to do this.\n"
        printf "Or, execute the following command for help/info: ./start.sh -h\n\n"

elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
        printf "\nInitiating setup for MinGW\n"

        # Checking installed versions of Python for debugging purposes
        printf "\n***********************************************************************\n"
        printf "Step 1: Checking which versions of Python are installed on this system"
        printf "\n***********************************************************************\n\n"
        printf "Output of python -V is:\n"
        py -V
        printf "\nPath that python command defaults to:\n"
        where python3

        # Creating and activating a python3 virtual environment
        printf "\n\n***********************************************************************\n"
        printf "Step 2: Creating a python3 virtual environment..."
        printf "\n***********************************************************************\n"
        py -m venv env

        activate ()
        {
                printf "\nActivating the python3 virtual environment...\n"
                #source .\env\Scripts\activate
                source ./env/Scripts/activate

                # Confirming that we are inside the correct environment before installing project requirements
                printf "\nPath that python3 command defaults to:\n"
                where python3

                # Upgrading pip
                printf "\nUpgrading pip:\n"
                py -m pip install --upgrade pip

                # Installing Project Requirements
                printf "\n\n***********************************************************************\n"
                printf "Step 3: Installing project requirements from requirements.txt:"
                printf "\n***********************************************************************\n\n"
                py -m pip install -r requirements.txt
        }

        activate

        # Final instructions
        printf "\n\n***********************************************************************\n"
        printf "Step 4: Start Flask and Tox"
        printf "\n***********************************************************************\n\n"
        printf "If all requirements successfully installed, then start Flask and Tox from the file start.sh\n"
        printf "Instructions contained within README file of this repo for how to do this.\n"
        printf "Or, execute the following command for help/info: ./start.sh -h\n\n"

elif [ "$OSTYPE" == "win32" ] || [ "$OSTYPE" == "win64" ]; then
        # Windows 32-bit and 64-bit based OS
        printf "\nInitiating setup for Windows 32-bit or 64-bit based OS...\n"

         # Checking installed versions of Python for debugging purposes
        printf "\n***********************************************************************\n"
        printf "Step 1: Checking which versions of Python are installed on this system"
        printf "\n***********************************************************************\n\n"
        printf "Output of python -V is:\n"
        py -V
        printf "\nPath that python command defaults to:\n"
        where python3

        # Creating and activating a python3 virtual environment
        printf "\n\n***********************************************************************\n"
        printf "Step 2: Creating a python3 virtual environment..."
        printf "\n***********************************************************************\n"
        py -m venv env

        activate ()
        {
                printf "\nActivating the python3 virtual environment...\n"
                #source .\env\Scripts\activate
                source ./env/Scripts/activate

                # Confirming that we are inside the correct environment before installing project requirements
                printf "\nPath that python command defaults to:\n"
                where python3

                # Upgrading pip
                printf "\nUpgrading pip:\n"
                py -m pip install --upgrade pip

                # Installing Project Requirements
                printf "\n\n***********************************************************************\n"
                printf "Step 3: Installing project requirements from requirements.txt:"
                printf "\n***********************************************************************\n\n"
                py -m pip install -r requirements.txt
        }

        activate

        # Final instructions
        printf "\n\n***********************************************************************\n"
        printf "Step 4: Start Flask and Tox"
        printf "\n***********************************************************************\n\n"
        printf "If all requirements successfully installed, then start Flask and Tox from the file start.sh\n"
        printf "Instructions contained within README file of this repo for how to do this.\n"
        printf "Or, execute the following command for help/info: ./start.sh -h\n\n"


else
        printf "OS is unknown. Python virtual environnment has not been created."
fi
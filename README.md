# bash-samples
Here you will find two sample bash scripts that I've written to automate tasks for a Flask project. Although comments are included in both files, a summary of what each script does is provided below.


### setup.sh

1. Detects the operating system that the user is using so that corresponding commands can be used based on the OS in use:
   - Linux environment
   - Mac environment
   - Linux emulation environment for Windows
   - Standard 32-bit and 64-bit versions of Windows
2. Checks installed version of Python for debugging purposes
3. Creates and activates a Python 3 virtual environment.
4. Checks the install path for python
5. Installs project requirements within the virtual environment.
6. Provides Help() function to explain how to run the bash script.


### start.sh
1. Checks installed version of Python for debugging purposes
2. Detects the operating system that the user is using so that corresponding commands can be used based on the OS in use:
   - Linux environment
   - Mac environment
   - Linux emulation environment for Windows
   - Standard 32-bit and 64-bit versions of Windows
3. Creates and activates a Python 3 virtual environment.
4. Checks the install path for python.
5. Formats the codebase using Black.
6. Runs Flask app based on the mode specified; either development or testing mode based on the corresponding flag that was passed.
7. Help message provided if an incorrect mode is specified when running the app.

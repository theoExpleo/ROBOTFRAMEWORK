SHELL := /bin/bash
# Makefile to create a Python Virtual Environment

# Specify the name of the virtual environment
VENV_NAME = virtualEnvironment
VENV_PATH = "/home/dsf12/Documents/VsCode/RobotFramework/virtualEnvironment"

# Specify the Python version to use
PYTHON_VERSION = python3

# Specify the path to the requirements file
REQUIREMENTS_FILE=requirements.txt


# Target to create the Virtual Environment
venv:
	$(PYTHON_VERSION) -m venv $(VENV_NAME)
	source $(VENV_NAME)/bin/activate; \
	pip3 install -r $(REQUIREMENTS_FILE)

# Target to activate the virtual environment
# UNFORTUNATELY, a makefile executes each command in a separate shell
# which does not persist across lines. In simple terms, it will
# execute the following lines of code, and then end the shell.
activate: 
	source $(VENV_NAME)/bin/activate && \
	echo "virtual environment activated"

# Runs the robot framework test
run:
	robot tests/testDemo1.robot

# Target to deactivate the Virtual environment
deactivate:
	deactivate
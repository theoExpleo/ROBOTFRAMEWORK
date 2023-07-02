
# Makefile to create a Python Virtual Environment


# Variables needed to store command-line arguments needed 
# run Robot Framework tests
TestScriptName :=
tagName :=
folderName :=


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

run2:
	robot tests/testDemo2.robot

run3:
	robot tests/testDemo3.robot

run4:
	robot tests/testDemo4.robot	

run5:
	robot tests/testDemo5.robot

run6:
	robot tests/testDemo6.robot	


# Runs all the tests but sequentially
sequence_run:
	robot tests/.

# Runs all the tests in parallel
parallel_run:
	pabot	tests/.


# Runs the test cases in a Test Script parallely
run_test_level:
	pabot --testlevelsplit '${TestScriptName}'

# Runs test cases that are annotated with the specified test name
# To exclude a certain tag from being run you use "--include" instead.
run_tag:
	robot --include ${tagName} .

run_failed:
	robot --rerunfailed output.xml tests/.

# A test suite is a collection of multiple files/scripts that
# contain test cases
run_test_suite:
	robot --suite ${folderName}

# Target to deactivate the Virtual environment
deactivate:
	deactivate

clean:
	rm *.png *.html *.xml
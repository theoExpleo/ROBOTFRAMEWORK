# ROBOT FRAMEWORK PROJECT

The purpose of this project is to provide an 
introduction and overview of the Robot Framework.

## Introduction 

Robot Framework is a generic open-source test automation framework. It is written in Python and utilizes a keyword-driven testing approach. The framework allows users to create, execute, and manage automated test cases and test suites.

## Features

**Keyword-driven approach**: Robot Framework allows test cases to be written in a keyword-driven format, making them easily readable and maintainable.

**Data-driven testing**: The framework supports data-driven testing, allowing test cases to be executed with different input data.

**Built-in libraries and tools**: Robot Framework provides a rich set of built-in libraries and tools, such as SeleniumLibrary for web testing and DatabaseLibrary for database testing.

**Extensibility**: The framework can be extended using custom libraries and plugins, allowing users to add functionality specific to their needs.

## Installation and Execution

To get started with the Robot Framework, follow these steps:

        1. Run the Makefile:

                $ make

            - it will PIP install all the needed libraries which are defined the in *requirements.txt* file.

        2. Activate the virtual environment by executing the *activate_venv.sh* script[OPTIONAL]:
                
                $ . activate_venv.sh

            **NOTE**: type "chmod +x activate_venv.sh" to give it execution rights (^.^)

        3. Run the Makefile again with "run" as the argument

                $ make run


**| =============================== THE END =============================== |**
# Safran Data Science Template

This is a standard template for data science projects. Its purpose is to meet the needs of the data scientists. This example should be considered as a starting point and changed based upon the evolution of the project.

This template is compatible with **Python3**.

## Table of contents

<!--ts-->
   * [Template Tree](#template-tree)
   * [Getting started](#getting-started)
      * [Application and package names](#application-and-package-names)
      * [Create a new project repository on GitHub](#create-a-new-project-repository-on-gitHub)
      * [Clone the project repository and rename the package](#clone-the-project-repository-and-rename-the-package)
   * [Environment setup](#environment-setup)
      * [Python3 virtual environment](#python3-virtual-environment)
      * [User specific settings](#user-specific-settings)
   * [Working on the project](#working-on-the-project)
      * [Launch a Jupyter notebook](#launch-a-jupyter-notebook)
      * [Tutorial Notebooks](#Tutorial-Notebooks)
      * [Store the data](#store-the-data)
      * [Application logs](#application-logs)
      * [Unit tests](#unit-tests)
      * [Clean the environment](#clean-the-environment)
      * [Format code](#format-code)
      * [Git management](#git-management)
      * [Git commit message guidelines](#git-commit-message-guidelines)
   * [Industrialization](#industrialization)
      * [Continuous integration](#continuous-integration)
      * [Scheduling job](#scheduling-job)
   * [Setting Git Configurations](#setting-git-configurations)

<!--te-->


## Template Tree

```
├── app_template                        <- Python package - scripts of the project
│   └── utils                           <- Useful transversal functions
│       └── system.py                   <- System functions
        └── multiplication_.py          <- multiplication functions
│
├── notebook                            <- Notebooks for analysis and testing
│   └── _tutorial                       <- Tutorial notebooks
│       ├── 01_tutorial.ipynb           <- calculated distance between 2 points (with longitude and latitude)
│
├── script                              <- Shell scripts of the application
│   ├── app_profile.sh                  <- Set environment variables needed for the application
│   ├── change_name.sh                  <- Rename package
│   ├── notebook.sh                     <- Launch python notebook
│   ├── set_virtualenv.sh               <- Setup virtualenv environment
│
├── test                                <- Unit tests
│   ├── utils                           <- Utils unit tests
│   │   └── test_system.py              <- Unit tests of the utils/system.py script
│   │   └── test_multiplication_.py     <- Unit tests of the utils/multiplication_.py script
│
├── .gitignore                          <- Files that should be ignored by git
├── Makefile                            <- Executable to run commands of the project
├── MANIFEST.in                         <- Describe resources files to include in the package for release
├── README.md                           <- The top-level README of the repository
├── requirements.txt                    <- Python libraries used in the project
└── setup.py                            <- Script to build the package
```



## Getting started

This git repository is a template for data science projects. To create a project
based on this template, please execute the following steps.

### Application and package names

- *Application name*: repository name on GitHub. Give it the name you want to give

- *Package name*: python package which will contain all the scripts.
The requirements are as follows:
  - short
  - lowercase letters
  - no space, use `_` instead (and not `-`)
  - no accent
  - can't start with a digit

- Example:
  - *Application name*: `python_datascience_template`
  - *Package name*: `ses_template`

### Create a new project repository on GitHub

Create an empty repository on GitHub with the following parameters:
*******************************************************************

### Clone the project repository and rename the package

*********************************************************

Second, use the command `rename` defined in the Makefile. At the invitation,
please enter the initial name of the package (by default `ses_template`)
and then the new name (`package_name`).
```
$ cd your application
$ make rename
or
$ mingw32-make rename
What is the initial name?
$ ses_template
What is the new name?
$ package_name
```


Third, commit your changes.
```
$ git add .
$ git commit -m "MNT: rename python package"
$ git push
```


## Environment setup

### Python3 virtual environment

This command will install a Python3 environment with all the python libraries
set by default in *requirements.txt*.
```
$ make install
or
$ mingw32-make install
```
Feel free to add any library in the *requirements.txt* file that you may need
in the project, and then run again the command above.

To activate the environment:
```
$ source script/app_profile.sh
```


## Working on the project

### Launch a Jupyter notebook

To install Jupyter and launch a notebook, run the following command.
A password is required to lock the notebook, you can set the password you want.
```
$ pwd
to be sure that your are on the root of your project
$ make notebook
or
$ mingw32-make notebook
```

By default, notebooks are not tracked by git. If you want to add a specific one still (for example a demo notebook), force git to add it:
```
$ git add -f notebook/notebook_to_add.ipynb
```

If you want to activate the notebook extensions such as the table of content and the execution time,
then go to the "Nbextensions" tab of your jupyter notebook home and select the corresponding checkbox.


### Tutorial Notebooks
The following tutorial notebooks are available to facilitate your project:
|Notebook| Comments|
|---|---|
|01_tutorial.ipynb|Shows how to calculated distance between 2 points (with longitude and latitude)|

### Store the data

The `data/` directory should be located in the root directory of the application. A structure for the `data` directory could be:
```
├── data                           
   ├── raw               <- Raw data from the databases
   ├── standard          <- Standard data (data quality, validation, common format)
   └── refined           <- Final tables of the project
```

### Unit tests

The unit tests of the application should be located in the `test` directory.
To launch the tests:
```
$ pwd
to be sure that your are on the root of your project
$ make test
or
$ mingw32-make test
```

### Clean the environment

If you want to clean the environment, use the command:
```
$ pwd
to be sure that your are on the root of your project
$ make clean
or
$ mingw32-make clean
```
It will delete all the *.pyc* files and the *cache* folders.

### Format code

To format the code using PEP8 and PEP256 rules:
```
$ pwd
to be sure that your are on the root of your project
$ make format
or
$ mingw32-make format
```
Warning: this command will reformat every python files in the package!
If you want to format a specific file, use the command directly.
```
$ source script/app_profile.sh
$ black <filename>.py
```

### Git management


### Git commit message guidelines

The purpose of a git commit message is to summarize what you changed and why. Committing regularly allows the other users to easily follow the development of the code and to rework on it. To allow a good understanding of the commit messages, the following structure has been adopted:
```
<type of change> <scope>: <description of the change>
```
where `<type of change>` can be taken from the table below (adapted from numpy developer guide). The last column corresponds to the legacy acronym
system,

| <type of change> | Description                                        | Legacy acronyms |
|------------------|----------------------------------------------------|-----------------|
| API              | an (incompatible) API change                       |                 |
| BENCH            | changes to the benchmark suite                     |                 |
| BLD              | change related to building/CI                      |                 |
| FIX              | bug fix                                            | fix             |
| DEP              | deprecate something, or remove a deprecated object |                 |
| DOC              | documentation                                      | doc             |
| ENH              | enhancement                                        | feat           |
| MAINT (or MNT)   | maintenance commit (refactoring, typos, etc.)      | refactor, minor |
| REV              | revert an earlier commit                           |                 |
| STY              | style fix (whitespace, PEP8)                       | style           |
| TST              | addition or modification of tests                  | test            |
| REL              | related to releasing                               |                 |
| NBK              | addition or modification of notebooks              | notebook        |


- `<scope>`: name of the sub-package of the python package containing the file(s) concerned by the commit.

- `<description of the change>`: brief description of the change. Use the present tense (e.g. "Change", not "Changed" / "Changes"), don't add any dot (.) at the end of the description.

Example:
```
FIX configuration: correct bug dynamic allocation in python librairy
```

## Industrialization
### Continuous integration


### Scheduling job

To schedule the jobs of the project, the [Airflow](https://airflow.apache.org/) tool can be used.

## Setting Git Configurations
- Disable SSL verification for HTTPS : 
```
git config --global http.sslVerify false
```

- Set the generic provider for the specific URL :
```
git config --global credential.https://git-int.eu.labinal.snecma.provider generic
```
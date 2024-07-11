#!/bin/sh
#PARENT_DIR=$(pwd)
##############################################################################
# ENVIRONMENT VARIABLES
##############################################################################
export UNXSCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
#export PARENT_DIR=$PARENT_DIR
#export UNXSCRIPT="$PARENT_DIR"
#export UNXSCRIPT="$( cd "$readlink -f "$0"" >/dev/null && pwd )"
export UNXAPPLI="$( dirname $UNXSCRIPT )"
export UNXCONF="$UNXAPPLI/conf"
export UNXDATA="$UNXAPPLI/data"
export UNXHISTO="$UNXAPPLI/histo"
export UNXNOTEBOOK="$UNXAPPLI/notebook"
export UNXLOG="$UNXAPPLI/log"
export toto="coco"
echo "Loading app-profile.sh from this repository: $UNXSCRIPT"

# This folder should contain the source code of the application
export UNXPACKAGE="ses_template"

if [ ! -e $UNXPACKAGE ]
then
	echo "ERROR! python package '$UNXPACKAGE' not found in the repository"
	return
fi


##############################################################################
# GENERAL CONFIGURATION
##############################################################################
export LANG=en_US.utf8
export TMOUT=0

# This folder contains the correct version of make that we want to use
export PATH=/usr/bin/:$PATH


##############################################################################
# PYTHON SPECIFIC CONFIGURATION
##############################################################################
# Add virtualenv binary to the PATH
export PATH=$PATH:$UNXAPPLI/.venv3/bin/

# Add the repo to the PYTHONPATH
export PYTHONPATH=$UNXAPPLI:$PYTHONPATH

# allow pip to search specified libraries
export PIP_OPTIONS="--proxy http://proxyep.rd1.rf1:8080 --trusted-host pypi.org"

# Activate the virtual environment
if [ -e $UNXAPPLI/.venv3/bin/activate ]
then
	source $UNXAPPLI/.venv3/bin/activate
fi
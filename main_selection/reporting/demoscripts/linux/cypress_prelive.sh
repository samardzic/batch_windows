#!/bin/bash

# ---------------------------------------------------------------------
# TITLE        : Test Data for PRELIVE env
# DESCRIPTION  : Modify test data to acomodate "prelive" envinronment
# PROJECT      : RVD
# VERSION      : 0.1
# ---------------------------------------------------------------------


#  ---------------  Variables   ------------------------

# Project ROOT path
ROOT_PATH=~/Build

# CYPRESS test folder location
CYPRESS_LOCATION=rvd_demo_portal

# NODE_MODULES location
NODE_LOCATION=~/node_modules/cypress/bin

# Test data ACTIVE location
TESTDATA_ACTIVE_LOCATION=cypress/test_data

# Test data PRELIVE location
TESTDATA_PRELIVE_LOCATION=cypress/test_data/prelive


# ---------------  Setting PRELIVE env as active   ------------------------

# CD to Cypress test folder 
cd $ROOT_PATH/$CYPRESS_LOCATION

# Deletes existing ACTIVE test data file
rm $ROOT_PATH/$CYPRESS_LOCATION/$TESTDATA_ACTIVE_LOCATION/testData.active.js

# Copies PRELIVE test data file ACTIVE test data folder
cp $ROOT_PATH/$CYPRESS_LOCATION/$TESTDATA_PRELIVE_LOCATION/test_data_prelive.js $ROOT_PATH/$CYPRESS_LOCATION/$TESTDATA_ACTIVE_LOCATION

# Renames PRELIVE test data file to ACTIVE test data file, and sets it as ACTIVE test data file
mv $ROOT_PATH/$CYPRESS_LOCATION/$TESTDATA_ACTIVE_LOCATION/test_data_prelive.js $ROOT_PATH/$CYPRESS_LOCATION/$TESTDATA_ACTIVE_LOCATION/testData.active.js



# ---------------  Executing tests ------------------------

$NODE_LOCATION/cypress run --headed
# $NODE_LOCATION/cypress run --spec "c:\rvd\rvd_demo_portal\cypress\specs\*.*"









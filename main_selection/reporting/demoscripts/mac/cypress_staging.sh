#!/bin/bash

# ---------------------------------------------------------------------
# TITLE        : Test Data for STAGING env
# DESCRIPTION  : Modify test data to acomodate "staging" envinronment
# PROJECT      : RVD
# VERSION      : 0.1
# ---------------------------------------------------------------------



#  ---------------  Variables   ------------------------

# Project ROOT path
ROOT_PATH=/Users/ime/Build

# CYPRESS test folder location
CYPRESS_LOCATION=rvd_demo_portal

# NODE_MODULES location
NODE_LOCATION=/Users/ime/Build/rvd_demo_portal/node_modules/cypress/bin

# Test data ACTIVE location
TESTDATA_ACTIVE_LOCATION=cypress/test_data

# Test data STAGING location
TESTDATA_STAGING_LOCATION=cypress/test_data/staging




# ---------------  Setting STAGING env as active   ------------------------

# CD to Cypress test folder 
cd $ROOT_PATH/$CYPRESS_LOCATION

# Deletes existing ACTIVE test data file
rm $ROOT_PATH/$CYPRESS_LOCATION/$TESTDATA_ACTIVE_LOCATION/testData.active.js

# Copies STAGING test data file ACTIVE test data folder
cp $ROOT_PATH/$CYPRESS_LOCATION/$TESTDATA_STAGING_LOCATION/test_data_staging.js $ROOT_PATH/$CYPRESS_LOCATION/$TESTDATA_ACTIVE_LOCATION

# Renames STAGING test data file to ACTIVE test data file, and sets it as ACTIVE test data file
mv $ROOT_PATH/$CYPRESS_LOCATION/$TESTDATA_ACTIVE_LOCATION/test_data_staging.js $ROOT_PATH/$CYPRESS_LOCATION/$TESTDATA_ACTIVE_LOCATION/testData.active.js



# ---------------  Executing tests ------------------------

$NODE_LOCATION/cypress run --headed
# $NODE_LOCATION/cypress run --spec "c:\rvd\rvd_demo_portal\cypress\specs\*.*"








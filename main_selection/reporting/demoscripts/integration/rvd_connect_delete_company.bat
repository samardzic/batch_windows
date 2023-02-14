:: ==================================================================================
:: TITLE        : Cypress run
:: DESCRIPTION  : This is a batch script intended to auto-run Cypress
:: PROJECT      : RVD
:: VERSION      : 0.1
:: ==================================================================================

:: ---------------  Variables   ------------------------

:: Change directory to project folder
set rvd_project_location=c:\rvd\rvd_demo_portal

:: Path to the Cypress folder
set cypress_location=node_modules\.bin


:: ---------------  Cypress Autorun   ------------------------

cd %rvd_project_location%  

%cypress_location%\cypress run --spec 'cypress/specs/integration/Delete_company.js'
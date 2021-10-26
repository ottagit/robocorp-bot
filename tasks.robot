# ## Beginners' course - starter files
#
# This example is the starting point of our <a href="https://robocorp.com/docs/courses/beginners-course">beginners' course</a>.
#
# Take the course to learn how to turn this into a complete and useful robot!
#

*** Settings ***
Documentation     Starter robot for the Beginners' course.
Library           RPA.Browser.Selenium
Library           RPA.Robocorp.Vault
Library           RPA.HTTP
Library           RPA.Excel.Files


*** Variables ***
${sales_data}    https://robotsparebinindustries.com/SalesData.xlsx

# +
*** Keywords ***
Open the intranet website
    Open Available Browser  https://robotsparebinindustries.com/
    
*** Keywords ***
Log in
    ${secret}=      Get Secret  credentials
    Input Text      username  ${secret}[username]
    Input Password  password  ${secret}[password]
    Submit Form
    Wait Until Page Contains Element   id:sales-form
# -

*** Keywords ***
Download the Excel file
    Download    ${sales_data}   overwrite=True

*** Keywords ***
Fill and submit the form for one sales person   
    [Arguments]   ${sales_rep}
    Input Text    id:firstname  ${sales_rep}[First Name]
    Input Text    id:lastname  ${sales_rep}[Last Name]
    Input Text    id:salesresult  ${sales_rep}[Sales]
    Select From List By Value    salestarget  ${sales_rep}[Sales Target]
    Click Button    Submit

*** Keywords ***
Fill the form using data from Excel file
    Open Workbook    SalesData.xlsx
    ${sales_reps}   Read Worksheet As Table  header=True
    Close Workbook
    FOR    ${sales_rep}    IN    @{sales_reps}
        Fill and submit the form for one sales person  ${sales_rep}
    END


*** Keywords ***
Collect the Results
    Screenshot    css:div.sales-summary    ${CURDIR}${/}output${/}sales_summary.png

*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Open the intranet website
    Log in
    Download the Excel file
    Fill the form using data from Excel file
    Collect the Results

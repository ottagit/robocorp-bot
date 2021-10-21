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
Fill and submit the form
    Input Text    //*[@id="firstname"]  Jane
    Input Text    //*[@id="lastname"]   Doe
    Select From List By Value    //*[@id="salestarget"]  10000
    Input Text    //*[@id="salesresult"]    8000
    Click Button    Submit
    

*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Open the intranet website
    Log in
    Fill and submit the form

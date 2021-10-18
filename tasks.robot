# ## Beginners' course - starter files
#
# This example is the starting point of our <a href="https://robocorp.com/docs/courses/beginners-course">beginners' course</a>.
#
# Take the course to learn how to turn this into a complete and useful robot!
#

*** Settings ***
Documentation     Starter robot for the Beginners' course.
Library           RPA.Browser.Selenium


*** Keywords ***
Open The Intranet Website
    Open Available Browser  https://robotsparebinindustries.com/

*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Open The Intranet Website





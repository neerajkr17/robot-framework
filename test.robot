*** Settings ***
Documentation    Automation Testing of an Online Pizza Shop; To Order Pizza's from an online pizza store While doing so, pizza size, flavor, sauce and toppings are chosen Further Succes message is vaerified and logged in reports
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***
#Business Test Cases
Order 5 Pizza's Online
    
#Child Test Cases
    Open Website
    Login
    Select Medium Size, Veggie Delight Flavor, Buffalo Sauce, And Greenolive+Tomatoes Toppings
    Set the Quantity to % and Add to Cart
    Verify Success Message
    Print Success Message
    
*** Keywords ***
#for above business keywords we are wrapping up all releted Selenium Functionalities
Open Website
    Open Browser    https://dineshvelhal.github.io/testautomation-playground/login.html    chrome
    Maximize Browser Window
    
Login
    Click Element    id:user
    Input Text    id:user    admin
    Sleep    0.5
    Click Element    id:password
    Input Text    id:password    admin
    Sleep    0.5
    Click Button    id:login
     
Select Medium Size, Veggie Delight Flavor, Buffalo Sauce, And Greenolive+Tomatoes Toppings
    
    Wait Until Element Is Visible    css:h3
    
    Click Element    id:rad_medium
    
    Select From List By Label    id:select_flavor    Veggie Delight
    
    Click Element    id:rad_buffalo
    Click Element    id:green_olive
    Sleep    0.5
    
Set the Quantity to % and Add to Cart
    Click Element    id:quantity
    Input Text    id:quantity    5
    Click Button    id:submit_button
    
Verify Success Message
    Sleep    0.5
    Wait Until Element Is Visible    id:added_message
    Element Text Should Be    id:added_message    Pizza added to the cart!
    
Print Success Message
    ${SuccessMessage}=    Get Text    id:added_message
    Log To Console    ${SuccessMessage}
    Log    ${SuccessMessage}
    Sleep    0.5
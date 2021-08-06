*** Settings ***
Library   SeleniumLibrary
Library   String

*** Variables ***
${browser}  chrome
${url}      https://github.com/
${input_text}  //input[@name='q']
${language}  //select[@id='search_language']
${Advanced_Search}  //div[@class='mt-3 d-none d-md-block']/a[.='Advanced search']
${stars}  //input[@id='search_stars']
${followers}  //input[@id='search_followers']
${license}  //select[@id='search_license']
${Search_Button}  //button[@type='submit']
${link_text}  //a[.='mvoloskov/decider']
${a}=  //div[@id='readme']



*** Keywords ***
Select Language
   [Arguments]  ${Value}
   click element  ${language}
   click element  //select[@id='search_language']//option[.='${Value}']

Enter the input text in search field
   [Arguments]  ${Value}
   input text  ${input_text}  ${Value}

Click on Enter
  Press Keys  ${input_text}  ENTER

Click on Advanced Search
   click element  ${Advanced_Search}

Enter with the stars
   [Arguments]  ${Value}
   input text  ${stars}  ${Value}

Enter followers
   [Arguments]  ${Value}
   input text  ${followers}  ${Value}

Select License
   [Arguments]  ${Value}
   click element  ${license}
   click element  //option[.='${Value}']

Click on Seacrh button
  click element  ${Search_Button}

Verify the link text
   [Arguments]  ${Value}
   Should contain  ${link_text}  ${Value}

Click on the link
   click element   ${link_text}

Navigate to Repository page
  click element  //a[@title='README.md']

Verify that there is only one repository result
  [Arguments]  ${Value}
  Element text should be  //h3[contains(.,'${Value} repository result')]  ${Value} repository result

*** Test Cases ***
Search Git Hub Result
    open browser   ${url}  ${browser}
    maximize browser window
    Enter the input text in search field  react
    Click on Enter
    Click on Advanced Search
    Select Language  JavaScript
    Enter with the stars  >45
    Enter followers  >50
    Select License  Boost Software License 1.0
    #click element  //form[@id='search_form']
    Click on Seacrh button
    Verify the link text  mvoloskov/decider
    Verify that there is only one repository result  1
    Click on the link
    Navigate to Repository page
    ${b}  Get text  ${a}
    ${d}  Remove String  ${b}  ${SPACE}
    ${c}  Get Substring  ${d}  0  301
    log to console  ${c}
    sleep  10s
    close browser



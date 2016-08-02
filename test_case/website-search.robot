*** Settings ***
Documentation     A test suite with a single test for searching official website.
Library           Selenium2Library



*** Variables ***
${SEARCH_ENGINE}        Google
${SEARCH_URL}           www.google.com.tw
${KEYWORD}              ruckus wireless
${OFFICIAL_WEBSITE}     tw.ruckuswireless.com/
${SCREENSHOT_NAME}      website_screenshot
${DELAY}                1
${LOCATOR_INPUT}        lst-ib
${LOCATOR_SUBMIT}       input.lsb
${SELENIUM_HUB}         selenium-hub


*** Keywords ***
Open Browser To Search With
    [Arguments]             ${browser}
    Open Browser            https://${SEARCH_URL}/  ${browser}  remote_url=http://${SELENIUM_HUB}:4444/wd/hub
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}
    Location Should Be      https://${SEARCH_URL}/

Search Keyword
    [Arguments]             ${keyword}
    Input Text              ${LOCATOR_INPUT}        ${keyword}
    Click Element           css=${LOCATOR_SUBMIT}

Search Official Website With
    [Arguments]                     ${browser}
    Open Browser To Search With     ${browser}
    Search Keyword                  ${KEYWORD}
    Click Link                      default=http://${OFFICIAL_WEBSITE}
    Location Should Be              http://${OFFICIAL_WEBSITE}
    Capture Page Screenshot         filename=${SCREENSHOT_NAME}_${browser}.png
    [Teardown]                      Close Browser



*** Test Cases ***
Official Website Search
    Search Official Website With    Chrome
    Search Official Website With    Firefox

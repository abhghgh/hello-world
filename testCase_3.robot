*** Settings ***
Documentation          	This example demonstrates executing commands on a remote machine
...                    	and getting their output and the return code.

Library                	SSHLibrary

*** Variables ***
${HOST}                	hltd456.hydc.sbc.com
${USERNAME}            	as0136
${KEYFILE}            	C:\\Users\\AS0136\\RoboFramework\\Opensshkey.ppk
${PASSWORD}             smls123

*** Test Cases ***
ssh to remote host
    ${index}=    Open Connection    ${HOST}    timeout=90seconds
    ${output}=    Run Keyword If    ${index} != 0   Login With Public Key    ${USERNAME}    ${KEYFILE}    ${PASSWORD}
    Should Contain    ${output}    as0136
    Log    ${output}
    Close All Connections

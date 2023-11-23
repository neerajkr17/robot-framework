Robot - Writing functionality tests with Robot

![](https://lh7-us.googleusercontent.com/HXudCFnp-nAi-br_k2Y4qeB9n3oDU6mW1bfUXuvxHAqAXD_-ePvXSwCvXm1rxHyEWPKZixyfo-3_-lvFmDFbcDiiwHJX9d2EF0b5Vi3_igFIF-6OJFKt4uNUATUTFBZbQgo39MH4X3qCCDEgfdG6QJE)


# Introduction

Robot Framework is a Python-based, extensible keyword-driven automation framework for acceptance testing, acceptance test driven development (ATDD). It can be used in distributed, heterogeneous environments, where automation requires using different technologies and interfaces.

The framework has a rich ecosystem around it consisting of various generic libraries and tools that are developed as separate projects. For more information about Robot Framework and the ecosystem.

Robot Framework is open source software released under the [Apache License 2.0](http://apache.org/licenses/LICENSE-2.0). Its development is sponsored by the [Robot Framework Foundation](http://robotframework.org/foundation).


# [Why Robot Framework?](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-222)

- Enables easy-to-use tabular syntax for [creating test cases](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#creating-test-cases) in a uniform way.
- Provides ability to create reusable [higher-level keywords](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#creating-user-keywords) from the existing keywords.
- Provides easy-to-read result [reports](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#report-file) and [logs](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#log-file) in HTML format.
- Is platform and application independent.
- Provides a simple [library API](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#creating-test-libraries) for creating customised test libraries which can be implemented natively with Python.
- Provides a [command line interface](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#executing-test-cases-1) and XML based [output files](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#output-file) for integration into existing build infrastructure (continuous integration systems).
- Provides support for testing web applications, rest APIs, mobile applications, running processes, connecting to remote systems via Telnet or SSH, and so on.
- Supports creating [data-driven test cases](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#data-driven-style).
- Has built-in support for [variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variables), practical particularly for testing in different environments.
- Provides [tagging](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#tagging-test-cases) to categorise and [select test cases](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#selecting-test-cases) to be executed.
- Enables easy integration with source control: [test suites](http://robot-framework.readthedocs.org/en/master/autodoc/robot.running.html#robot.running.model.TestSuite) are just files and directories that can be versioned with the production code.
- Provides [test-case](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-setup-and-teardown) and [test-suite](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#suite-setup-and-teardown) -level setup and teardown.
- The modular architecture supports creating tests even for applications with several diverse interfaces.


## [High-level architecture](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-223)

Robot Framework is a generic, application and technology independent framework. It has a highly modular architecture illustrated in the diagram below.

![src/GettingStarted/architecture.png](https://lh7-us.googleusercontent.com/-g1zK42uBP4J-PY7RFCmUt14Cee5pR0KnRpshLx2l1AgcTLhLIee1bBo2UYGcNTc0oOarX4_PnXvDK2Hd5-1oRCc4QBJzXG7d7UbgVMXdjowIEZ7SHYKs-8CcH9yOE2wilZJXnofm5Jfz7wx1p5nVLk)

_Robot Framework architecture_

The [test data](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#creating-test-data) is in simple, easy-to-edit tabular format. When Robot Framework is started, it processes the data, [executes test cases](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#executing-test-cases-1) and generates logs and reports. The core framework does not know anything about the target under test, and the interaction with it is handled by [libraries](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#creating-test-libraries). Libraries can either use application interfaces directly or use lower level test tools as drivers.


# Setup:-

1. ## Install Python 

Ubuntu usually comes with Python pre-installed

Check Python Version:

Open a terminal and check if Python is already installed by typing:
```

      python3 --version
```

Output:-
```

neeraj\@neeraj-G3-3500:\~$ python3 --version

Python 3.10.12

neeraj\@neeraj-G3-3500:\~$
```

2. ## Install pip

           ```
           sudo apt install python3-pip
           ```

Output:-
```

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

The following packages were automatically installed and are no longer required:

  gyp libc-ares2 libjs-events libjs-highlight.js libjs-inherits

  libjs-is-typedarray libjs-psl libjs-source-map libjs-sprintf-js

  libjs-typedarray-to-buffer libnode-dev libnode72 libssl-dev libuv1-dev

  node-abbrev node-ansi-regex node-ansi-styles node-ansistyles

  node-are-we-there-yet node-arrify node-asap node-asynckit

  node-balanced-match node-brace-expansion node-chownr node-clean-yaml-object

  node-color-convert node-color-name node-commander node-core-util-is

  node-decompress-response node-delayed-stream node-delegates node-depd

  node-diff node-encoding node-end-of-stream node-err-code

  node-escape-string-regexp node-fancy-log node-foreground-child

  node-fs.realpath node-function-bind node-get-stream node-glob node-growl

  node-has-flag node-has-unicode node-hosted-git-info node-iconv-lite

  node-iferr node-imurmurhash node-indent-string node-inflight node-inherits

  node-ini node-ip node-ip-regex node-is-buffer node-is-plain-obj

  node-is-typedarray node-isarray node-isexe node-json-parse-better-errors

  node-jsonparse node-kind-of node-lodash-packages node-lowercase-keys

  node-lru-cache node-mimic-response node-minimatch node-minimist

  node-minipass node-mute-stream node-negotiator node-npm-bundled node-once

  node-osenv node-p-cancelable node-p-map node-path-is-absolute

  node-process-nextick-args node-promise-inflight node-promise-retry

  node-promzard node-pump node-quick-lru node-read node-readable-stream

  node-resolve node-retry node-safe-buffer node-set-blocking node-signal-exit

  node-slash node-slice-ansi node-source-map node-spdx-correct

  node-spdx-exceptions node-spdx-expression-parse node-spdx-license-ids

  node-sprintf-js node-stealthy-require node-string-decoder

  node-supports-color node-text-table node-time-stamp node-tmatch

  node-typedarray-to-buffer node-universalify node-util-deprecate

  node-validate-npm-package-license node-webidl-conversions node-whatwg-fetch

  node-wrappy node-yallist nodejs-doc

Use 'sudo apt autoremove' to remove them.

The following packages will be upgraded:

  python3-pip

1 upgraded, 0 newly installed, 0 to remove and 64 not upgraded.

Need to get 0 B/1,305 kB of archives.

After this operation, 2,048 B of additional disk space will be used.

(Reading database ... 221792 files and directories currently installed.)

Preparing to unpack .../python3-pip\_22.0.2+dfsg-1ubuntu0.4\_all.deb ...

Unpacking python3-pip (22.0.2+dfsg-1ubuntu0.4) over (22.0.2+dfsg-1ubuntu0.3) ...

Setting up python3-pip (22.0.2+dfsg-1ubuntu0.4) ...

Processing triggers for man-db (2.10.2-1) ...

neeraj\@neeraj-G3-3500:\~$ 
```

3. ## Install Pycharm

``` 
sudo snap install pycharm-community --classic
```

Output:-
```

snap "pycharm-community" is already installed, see 'snap help refresh'
```

4. ## Install Selenium
```

pip3 install selenium
```

Output:-
```

Defaulting to user installation because normal site-packages is not writeable

Requirement already satisfied: selenium in ./.local/lib/python3.10/site-packages (4.15.2)

Requirement already satisfied: urllib3\[socks]<3,>=1.26 in /usr/lib/python3/dist-packages (from selenium) (1.26.5)

Requirement already satisfied: trio-websocket\~=0.9 in ./.local/lib/python3.10/site-packages (from selenium) (0.11.1)

Requirement already satisfied: trio\~=0.17 in ./.local/lib/python3.10/site-packages (from selenium) (0.23.1)

Requirement already satisfied: certifi>=2021.10.8 in ./.local/lib/python3.10/site-packages (from selenium) (2023.7.22)

Requirement already satisfied: sniffio>=1.3.0 in ./.local/lib/python3.10/site-packages (from trio\~=0.17->selenium) (1.3.0)

Requirement already satisfied: outcome in ./.local/lib/python3.10/site-packages (from trio\~=0.17->selenium) (1.3.0.post0)

Requirement already satisfied: attrs>=20.1.0 in ./.local/lib/python3.10/site-packages (from trio\~=0.17->selenium) (23.1.0)

Requirement already satisfied: idna in /usr/lib/python3/dist-packages (from trio\~=0.17->selenium) (3.3)

Requirement already satisfied: sortedcontainers in ./.local/lib/python3.10/site-packages (from trio\~=0.17->selenium) (2.4.0)

Requirement already satisfied: exceptiongroup>=1.0.0rc9 in ./.local/lib/python3.10/site-packages (from trio\~=0.17->selenium) (1.1.3)

Requirement already satisfied: wsproto>=0.14 in ./.local/lib/python3.10/site-packages (from trio-websocket\~=0.9->selenium) (1.2.0)

Requirement already satisfied: PySocks!=1.5.7,<2.0,>=1.5.6 in ./.local/lib/python3.10/site-packages (from urllib3\[socks]<3,>=1.26->selenium) (1.7.1)

Requirement already satisfied: h11<1,>=0.9.0 in ./.local/lib/python3.10/site-packages (from wsproto>=0.14->trio-websocket\~=0.9->selenium) (0.14.0)

neeraj\@neeraj-G3-3500:\~$ 
```

5. ## Install Robot Framework (Using pip)
```

 pip3 install robotframework
```

Output:-
```

Defaulting to user installation because normal site-packages is not writeable

Requirement already satisfied: robotframework in ./.local/lib/python3.10/site-packages (6.1.1)
```

6. ## Install Robot Framework Selenium Library (Using pip)
   
```
pip3 install robotframework-seleniumlibrary
```

Output:-
```
Defaulting to user installation because normal site-packages is not writeable

Requirement already satisfied: robotframework-seleniumlibrary in ./.local/lib/python3.10/site-packages (6.1.3)

Requirement already satisfied: robotframework-pythonlibcore>=3.0.0 in ./.local/lib/python3.10/site-packages (from robotframework-seleniumlibrary) (4.2.0)

Requirement already satisfied: selenium>=4.3.0 in ./.local/lib/python3.10/site-packages (from robotframework-seleniumlibrary) (4.15.2)

Requirement already satisfied: robotframework>=4.1.3 in ./.local/lib/python3.10/site-packages (from robotframework-seleniumlibrary) (6.1.1)

Requirement already satisfied: trio-websocket\~=0.9 in ./.local/lib/python3.10/site-packages (from selenium>=4.3.0->robotframework-seleniumlibrary) (0.11.1)

Requirement already satisfied: urllib3\[socks]<3,>=1.26 in /usr/lib/python3/dist-packages (from selenium>=4.3.0->robotframework-seleniumlibrary) (1.26.5)

Requirement already satisfied: trio\~=0.17 in ./.local/lib/python3.10/site-packages (from selenium>=4.3.0->robotframework-seleniumlibrary) (0.23.1)

Requirement already satisfied: certifi>=2021.10.8 in ./.local/lib/python3.10/site-packages (from selenium>=4.3.0->robotframework-seleniumlibrary) (2023.7.22)

Requirement already satisfied: sniffio>=1.3.0 in ./.local/lib/python3.10/site-packages (from trio\~=0.17->selenium>=4.3.0->robotframework-seleniumlibrary) (1.3.0)

Requirement already satisfied: exceptiongroup>=1.0.0rc9 in ./.local/lib/python3.10/site-packages (from trio\~=0.17->selenium>=4.3.0->robotframework-seleniumlibrary) (1.1.3)

Requirement already satisfied: outcome in ./.local/lib/python3.10/site-packages (from trio\~=0.17->selenium>=4.3.0->robotframework-seleniumlibrary) (1.3.0.post0)

Requirement already satisfied: idna in /usr/lib/python3/dist-packages (from trio\~=0.17->selenium>=4.3.0->robotframework-seleniumlibrary) (3.3)

Requirement already satisfied: sortedcontainers in ./.local/lib/python3.10/site-packages (from trio\~=0.17->selenium>=4.3.0->robotframework-seleniumlibrary) (2.4.0)

Requirement already satisfied: attrs>=20.1.0 in ./.local/lib/python3.10/site-packages (from trio\~=0.17->selenium>=4.3.0->robotframework-seleniumlibrary) (23.1.0)

Requirement already satisfied: wsproto>=0.14 in ./.local/lib/python3.10/site-packages (from trio-websocket\~=0.9->selenium>=4.3.0->robotframework-seleniumlibrary) (1.2.0)

Requirement already satisfied: PySocks!=1.5.7,<2.0,>=1.5.6 in ./.local/lib/python3.10/site-packages (from urllib3\[socks]<3,>=1.26->selenium>=4.3.0->robotframework-seleniumlibrary) (1.7.1)

Requirement already satisfied: h11<1,>=0.9.0 in ./.local/lib/python3.10/site-packages (from wsproto>=0.14->trio-websocket\~=0.9->selenium>=4.3.0->robotframework-seleniumlibrary) (0.14.0)
```

7. ## Install Required Packages in Pycharm:-

<!---->

1. Selenium
2. Robotframework
3. robotframework-seleniumlibrary

![](https://lh7-us.googleusercontent.com/2bBebKT4sS6TRJBUr7-RhxU1bNB8FWOiXot-la1NvxTFlRF8ZfCiVqLO29AlB2bZSFRRTv8QJ9T0EMowU5w1e5oq8RZBaAlee7JCTlbewToG5c2-1nrmDtKduMUgmHoaSbvW06AUyn9ZFdL5AiNL-bU)

8. ## Install this plugin in Pycharm:-

![](https://lh7-us.googleusercontent.com/Yqg-rwZnPM8VMdCQkufmkcZ8K4i_-4gWLAlnR5NfrM-xcCh7qCAmnRPhz40EGgnO3NhQiC_LsKnw4pn36bSf2Cj4oqgyPurrDJnOPLoNqENZPXlFCLq3eyZ-OqfK9TbDxm6NPwOQbPKmpkv5NL4dKLk)


# Test Demo

This is an Automation Script that I have written for an Automation testing of an online Pizza Shop website.

Link of Website:-  <https://dineshvelhal.github.io/testautomation-playground/login.html>

Step 1 :- Create a Dairety for test cases

Step 2 :- Create a new file with any name but please add a extension (.robot) to make it robot file.

Step 3:- Write this code to check the functionality of the website.

    *** Settings ***
    Documentation    Automation Testing of an Online Pizza Shop; To Order Pizza's from an online pizza store While doing so, pizza size, flavor, sauce and toppings are chosen Further Succes message is vaerified and logged in reports
    Library    SeleniumLibrary
    Test Teardown    Close Browser

<!---->

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
       Open Browser    https://dineshvelhal.github.io/testautomation-playground/login.html    chrome
       Maximize Browser Window
      
    Login
       Click Element    id:user
       Input Text    id:user    admin
       Sleep    0.5
       Click Element    id:password
       Input Text    id:password    admin
       Sleep    0.5
       Click Button    id:login
       
    Select Medium Size, Veggie Delight Flavor, Buffalo Sauce, And Greenolive+Tomatoes Toppings
      
       Wait Until Element Is Visible    css:h3
      
       Click Element    id:rad_medium
      
       Select From List By Label    id:select_flavor    Veggie Delight
      
       Click Element    id:rad_buffalo
       Click Element    id:green_olive
       Sleep    0.5
      
    Set the Quantity to % and Add to Cart
       Click Element    id:quantity
       Input Text    id:quantity    5
       Click Button    id:submit_button
      
    Verify Success Message
       Sleep    0.5
       Wait Until Element Is Visible    id:added_message
       Element Text Should Be    id:added_message    Pizza added to the cart!
      
    Print Success Message
       ${SuccessMessage}=    Get Text    id:added_message
       Log To Console    ${SuccessMessage}
       Log    ${SuccessMessage}
       Sleep    0.5

To run the script enter this command in terminal of Pycharm => robot Automation/test.robot

Output:-
```
(venv) neeraj\@neeraj-G3-3500:\~/PycharmProjects/pythonProject$ robot Automation/test.robot

\==============================================================================

Test :: Automation Testing of an Online Pizza Shop; To Order Pizza's from a...

\==============================================================================

Order 5 Pizza's Online                                                .....Pizza added to the cart!

Order 5 Pizza's Online                                                | PASS |

\------------------------------------------------------------------------------

Test :: Automation Testing of an Online Pizza Shop; To Order Pizza... | PASS |

1 test, 1 passed, 0 failed

\==============================================================================

Output:  /home/neeraj/PycharmProjects/pythonProject/output.xml

Log:     /home/neeraj/PycharmProjects/pythonProject/log.html

Report:  /home/neeraj/PycharmProjects/pythonProject/report.html

(venv) neeraj\@neeraj-G3-3500:\~/PycharmProjects/pythonProject$
```

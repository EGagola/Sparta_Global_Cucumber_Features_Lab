Feature: BBC Login

  Scenario: Inputting incorrect username credentials shows an error
    Given I access the BBC login page
    And I input incorrect username details
    And I input incorrect password details
    When I try to login
    Then I receive an error for not finding an account

  Scenario: Inputting a password less than 8 characters shows an error
    Given I access the BBC login page
    And I input incorrect username details
    And I input an invalid password as t3sting
    When I try to login
    Then I receive an error stating it needs to be at least 8 chars

  Scenario: Inputting a password with no letters shows an error
    Given I access the BBC login page
    And I input incorrect username details
    And I enter an invalid password as 123456789
    When I try to login
    Then I receive an error stating it needs to contain letters

  Scenario: Inputting a password with no numbers shows an error
    Given I access the BBC login page
    And I input incorrect username details
    And I enter an invalid password as nonumbers
    When I try to login
    Then I receive an error stating it needs to contain non-alphabetic characters

  Scenario: Leaving all fields blank shows three errors
    Given I access the BBC login page
    When I try to login
    Then I receive an error stating that details do not match
    And I receive an error stating that the username is missing
    And I receive an error stating that the password is missing


  Scenario: Inputting an email in an incorrect format shows an error
    Given I access the BBC login page
    And I input an incorrect email format as test@test
    And I input a correct password
    When I try to login
    Then I receive an error stating that the email doesn't look right

  Scenario: Inputting a valid email and password that are not registered as an account shows an error
    Given I access the BBC login page
    And I input a correct email that does not belong to an account
    And I input a correct password
    When I try to login
    Then I receive an error stating that the email isn't associated with an account

  Scenario: Inputting a valid email for an account with a password that does not match shows an error
    Given I access the BBC login page
    And I input a correct email
    And I input a password that does not match the account
    When I try to login
    Then I receive an error stating that the password isn't associated with an account

  Scenario: Inputting the correct email with the correct password will log the user in
    Given I access the BBC login page
    And I input a correct email
    And I input the matching password
    When I try to login
    Then I return to the homepage and am logged in

Feature: Project Browse files
  Background:
    Given I sign in as a user
    And I own project "Shop"
    Given I visit project source page

  Scenario: I browse files from master branch
    Then I should see files from repository

  Scenario: I browse files for specific ref
    Given I visit project source page for "6d39438"
    Then I should see files from repository for "6d39438"

  Scenario: I browse file content
    Given I click on ".gitignore" file in repo
    Then I should see its content

  Scenario: I browse raw file
    Given I visit blob file from repo
    And I click link "raw"
    Then I should see raw file content

  Scenario: I can create file
    Given I click on "new file" link in repo
    Then I can see new file page

  @javascript
  Scenario: I can edit file
    Given I click on ".gitignore" file in repo
    And I click button "edit"
    Then I can edit code

  @javascript
  Scenario: I can see editing preview
    Given I click on ".gitignore" file in repo
    And I click button "edit"
    And I edit code
    And I click link "Diff"
    Then I see diff

  Scenario: I can browse directory with Browse Dir
    Given I click on files directory
    And I click on history link
    Then I see Browse dir link

  Scenario: I can browse file with Browse File
    Given I click on readme file
    And I click on history link
    Then I see Browse file link

  Scenario: I can browse code with Browse Code
    Given I click on history link
    Then I see Browse code link

  # Permalink

  Scenario: I click on the permalink link from a branch ref
    Given I click on ".gitignore" file in repo
    And I click on permalink
    Then I am redirected to the permalink URL

  Scenario: I don't see the permalink link from a SHA ref
    Given I visit project source page for "6d394385cf567f80a8fd85055db1ab4c5295806f"
    And I click on ".gitignore" file in repo
    Then I don't see the permalink link

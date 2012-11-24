Feature: Merge Articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully merge articles
    Given I go to the new article page
    When I fill in "article_title" with "Hello World!"
    And I fill in "article__body_and_extended_editor" with "Welcome to Typo. This is your first article. Edit or delete it, then start blogging!"
    And I press "Publish"
    Then I should be on the manage articles page
    And I shoud see "Hello World!" twice
    When I follow "Hello World!"
    Then I should see "Article ID"
    When I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the manage articles page
    And I shoud see "Hello World!" once

  Scenario: Unsuccessfully merge articles
    Given I am not logged
    And I am logged into the publisher panel
    And I go to the new article page
    When I fill in "article_title" with "Hello World!"
    And I fill in "article__body_and_extended_editor" with "Welcome to Typo. This is your first article. Edit or delete it, then start blogging!"
    And I press "Publish"
    Then I should be on the manage articles page
    And I shoud see "Hello World!" twice
    When I follow "Hello World!"
    Then I should not see "Article ID"
    And I go to the merge article page
    And I shoud see "Hello World!" twice
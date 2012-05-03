Drupal-Tag
==========

Easily link to Drupal.org projects for Octopress

### Syntax 
{% drupal [name|nid|uid].[module|theme|installprofile|installprofile|project|node|user] [title] %}

### Examples:
{% drupal views.module "Views" %}
{% drupal andromeda.theme "Andromeda Theme" %}
{% drupal 559302.node "Guidelines for SQL" %}
{% drupal 571032.user "This is my d.o profile" %}


### Output:
  <a href="http://drupal.org/project/views">Views</a>
  <a href="http://drupal.org/project/andromeda">Andromeda Theme</a>
  <a href="http://drupal.org/node/559302">Guidelines for SQL</a>
  <a href="http://drupal.org/user/571032">This is my d.o profile</a>
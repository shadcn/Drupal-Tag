# Title: Drupal Tag
# Authors: Arshad http://donothackcore.com
# Description: Easily link to Drupal.org projects, nodes and users for Octopress
#
# Syntax {% drupal [name|nid|uid].[module|theme|installprofile|installprofile|project|node|user] [title] %}
#
# Examples:
# {% drupal views.module "Views" %}
# {% drupal andromeda.theme "Andromeda Theme" %}
# {% drupal 559302.node "Guidelines for SQL" %}
# {% drupal 571032.user "This is my d.o profile" %}
#
# Output:
# <a href="http://drupal.org/project/views">Views</a>
# <a href="http://drupal.org/project/andromeda">Andromeda Theme</a>
# <a href="http://drupal.org/node/559302">Guidelines for SQL</a>
# <a href="http://drupal.org/user/571032">This is my d.o profile</a>
#

module Jekyll

  class Drupal < Liquid::Tag
    @domain = ''
    @type = ''
    @id = ''
    @title = ''

    def initialize(tag_name, markup, tokens)
      if markup =~ /(\b)(\w+)(\.(module|theme|translation|installprofile|project))(\b)(\s"([^"]*)")?/i
        @domain = 'http://drupal.org'
        @id  = $2
        @type = 'project'
        @title = $7
      end
      
      if markup =~ /(\b)([a-z0-9#\-]*)(\.(node))(\b)(\s"([^"]*)")?/i
        @domain = 'http://drupal.org'
        @id = $2
        @type = 'node';
        @title = $7
      end
      
      if markup =~ /(\b)([a-z0-9#\-]*)(\.(user))(\b)(\s"([^"]*)")?/i
        @domain = 'http://drupal.org'
        @id = $2
        @type = 'user';
        @title = $7
      end
      
      super
    end

    def render(context)
      if @domain and @id and @type and @title
        @href = "#{@domain}/#{@type}/#{@id}"
        "<a href='#{@href}'>#{@title}</a>"
      else
        "Error processing input, expected syntax: {% drupal [name|nid|uid].[module|theme|installprofile|installprofile|project|node|user] [title] %}"
      end
    end
  end
end

Liquid::Template.register_tag('drupal', Jekyll::Drupal)

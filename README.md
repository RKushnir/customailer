# Customailer
Let your mail templates to be edited on the fly.  
*Rails 3 only.*

## Installation
As usual, add `customailer` to your Gemfile, install and run migrations:

    gem "customailer", github: "RKushnir/customailer"

    bundle install
    rake customailer:install:migrations
    rake db:migrate

## Usage
Rails will start to look up your custom templates automatically as soon as you install the gem. To actually create them you'll need to mount it in the router:

    mount Customailer::Engine => "/customailer"

Customailer doesn't know about your security, so you'll need to take care of that. Here's how I use it with Devise:

    authenticate :user, lambda(&:admin?) do
      mount Customailer::Engine => "/customailer"
    end

Now you can create and edit the mail templates at [/customailer/mail_templates](http://localhost:3000/customailer/mail_templates). Customailer uses Liquid template engine.

## Credits
Thanks to José Valim for his great book [Crafting Rails Applications](http://pragprog.com/book/jvrails/crafting-rails-applications) and to Roy van der Meij for the code for [Liquid template handler](http://www.royvandermeij.com/blog/2011/09/21/create-a-liquid-handler-for-rails-3-dot-1/).

## License
This project rocks and uses MIT-LICENSE.

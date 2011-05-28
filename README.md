Monitaur
=============

Rails 3 Web App Monitoring. Monitor your apps directly from your desktop. Lightweight. Built using Rails Engines.

Instructions
-----------

    gem install monitaur
    
on your routes.rb file add "monitaur", for example

    YourApplication::Application.routes.draw do
      monitaur
    end

then download the desktop client and add your site. Start *monitauring* your Rails 3 apps now!

Desktop Client

Source
    https://github.com/jasontorres/monitaur-desktop

Latest Download Build
    http://api.appcelerator.net/p/pages/app_page?token=P4rHamg5
        

Customization
-----------

You can freely add custom data via adding Proc, method or Hash objects on the config. Just add this on your initializer (config/initializers/monitaur.rb)

    Monitaur::Monitor.config do |config|
      
      user_count = Proc.new do
        { 'users_count' => User.count }
      end

      config.hooks << user_count

      purchases = Proc.new do
        { 'purchases' = yourpurchasecode }
      end

      config.hooks << purchases

    end

License
-----------

Copyright 2011 - Jason Torres (ProudCloud.net) 

MIT License 

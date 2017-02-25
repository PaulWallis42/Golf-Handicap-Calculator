# The Golf Stat & Handicap Tracker

An app that allows you to sign up and start recording your golfing rounds.  From your entries a golfing handicap is calculated and updated each time a user enters a new round.  From this handicap the app will calculate a Stableford score for the users round.  Each user has their own profile page which lists all their previous rounds, handicaps and scores.  The app also compares users v other users if they have played the same round and calculates the winner of the Stroke Play, Stableford Play and of course the infamous Three Putter award!

![landing page](/app/public/readme.png)

The app is written using the following technologies and has been deployed to Heroku:

* Ruby & Sinatra Framework
* Postgres
* Datamapper
* Rspec (unit testing)
* Capybara (feature testing)
* Poltergeist (as the Capybara driver)
* Rake
* JavaScript
* jQuery
* Bootstrap
* Selection of other ruby gems (see Gemfile)

## Getting Started
* Clone this repository to your computer
* Using your command line navigate to the directory where you have saved the clone and run 'bundle install' (download bundler if you do not currently have it: http://bundler.io/)
* Run 'rackup' from the command line to start the server and to visit the app go to http://localhost:9292/ in your browser.

## Using the app
The app requires you to sign up using an e mail and password before you can start.

Once signed up users can start recording their round and hole results by clicking on the 'Add a round' link.  Once rounds have been added the app will automatically update your history in the 'profile page' and show the results of any competitions with friends on the home page.  The app is quite self explanatory once you start using it.  Happy Golfing!

## Features for the future...
Currently the app is designed for one golf course 'Oak Park'.  Further versions will look to consume an API so that all UK (possibly world!) courses can be entered on the app.  Users will be able to get statistics from hole types (ie average of bogie for all time on par 3's etc).

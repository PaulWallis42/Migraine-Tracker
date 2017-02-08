# The Migraine Tracker

[![Build Status](https://travis-ci.org/PaulWallis42/Migraine-Tracker.svg?branch=master)](https://travis-ci.org/PaulWallis42/Migraine-Tracker)

A basic migraine tracking app allowing users to record details of their diet and migraine attacks.  Food nutrient details are obtained through an RESTful API to the United States department of Agricultures database.

![landing page](/app/assets/images/readme.png)

The app is written using Ruby on Rails and tested using Rspec & Capybara and has been deployed to Heroku.


## Getting Started
* Clone this repository to your computer
* Using your command line navigate to the directory where you have saved the clone and run 'bundle install'
* Run 'bin/rails s' from the command line to start the server and to visit the app go to http://localhost:3000/ in your browser

## Using the app
The app requires you to sign up using an e mail and password before you can start.

Once signed up users should start recording their meals using the meal recording function and migraines using the migraine recording function.  The app will then tell the user how many grams of the nutrient Phenylalanine they have consumed between migraines.

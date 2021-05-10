# README - PushWith

## Introduction
PushWith is a Ruby on Rails application that allows gym members to connect with each other through workout groups, and share their workouts by posting them to the workout group's page. I created PushWith in order to practice building a fully functional Ruby on Rails application featuring full CRUD functionality, an MVC structure, nested resources and nested forms, partials and helpers, join tables, and user authentication.

## Technologies
This program was created using ruby 2.6.1 and rails 6.1.1. It also uses Materialize CSS 1.0.0 for the styling. The database is written in SQLite3 version 1.4 and has a branch with a PostGres database for Heroku hosting.

## Launch
In order to run this program, fork and clone the Github repository, run 'bundle install' and 'rails:webpacker' in the terminal, migrate the databases by running rails db:migrate, create a .env file in the root directory of the app, and create a google oauth client id in the google developer console and add the client key to the .env file as GOOGLE_CLIENT_KEY= and add the secret to the .env as GOOGLE_CLIENT_SECRET=. Then the application will be ready to run by typing in the command 'rails s'!

## Features

-  Users can create accounts and sign in
-  Users can sign in with Google via Omniauth
-  Users can create and join workout groups
-  Users can create, view, edit, and delete workouts for workout groups that they are in
-  Users can edit the name of a workout group they're in or delete the workout group
-  Users are associated to workout groups through a UserGroups join table that facilitates a many to many relationship between users and workout groups

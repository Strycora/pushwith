# README

This application allows users to create accounts and sign in, create and join workout groups, and create workouts for the workout groups to complete. Users are able to sign up by entering a username and password or sign up through Google. Each user can be a part of many workout groups, and each workout group can contain many users. 

This program was created using ruby 2.6.1 and rails 6.1.1. In order to run this program, fork and clone the Github repository, run 'bundle install' and 'rails:webpacker' in the terminal, migrate the databases by running rails db:migrate, create a .env file in the root directory of the app, and create a google oauth client id in the google developer console and add the client key to the .env file as GOOGLE_CLIENT_KEY= and add the secret to the .env as GOOGLE_CLIENT_SECRET=. Then the application will be ready to run!


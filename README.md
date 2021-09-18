## PerTutor - Saas application

PerTutor is a rails project I built personally from scratch. It is a saas application with subdomain for each account user.

This project is to help tutors create their own school / channel, schedule their availability, invite students and have students book a slot for one-on-one or group tutoring.

The idea for this project was inspired by [Substack](https://substack.com/). Therefore most of the features were borrowed from Substack.

## Technology stack
1. Ruby 2.7.2
2. Rails 6.1.0
3. Postgresql

## Core features
1. Create a channel with a unique subdomain as `youraccount.yourdomain.com`
2. Welcome email upon creating a channel to `schedule a your calendar`, `invite students` or `share invite link`.
3. Account admin has a dashboard to `view bookings`, `schedule a calendar`
4. Account admin can customize their account with color theme and background image
5. Account admin can view all calendar
6. Invited students can view tutor's availability and book a session
7. There is question and answer forum to enable instructor interact with students
8. User authentication and user authorization
9. Sidekiq to process background jobs for sending emails and reminders

## Setup

1. Pull down the app from version control
2. Make sure you have Postgres running
3. `bin/setup`

## Starting the Server

1. `bin/run`
2. Please visit the localhost as this **http://lvh.me:3000/**

## Project homepage
![PerTutor](https://github.com/earnestaddae/pertutor/blob/main/app/assets/images/pertutor.png)

## Project admin dashboard
![Admin Dashboard](https://github.com/earnestaddae/pertutor/blob/main/app/assets/images/dashboard.png)

## Attributions
This application wouldn't have been possible without a wonderful web framework like [Ruby on Rails](https://rubyonrails.org/), an expressive language like [Ruby](https://www.ruby-lang.org/en/), accessible [RubyGems](https://rubygems.org/), and the community of selfless Rubyists.

## Contributions & Issues
Whenever, I find something interesting to add, I will do so. You are welcome to use this project as you want. 

However, if there are features you want added that will be beneficial to others, you can add it and issue a [PR](https://github.com/earnestaddae/pertutor/pulls). Furthermore, if you want a feature, but can't build yourself, [create an issue](https://github.com/earnestaddae/pertutor/issues) and I will try to add in due time.

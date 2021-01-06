# PhotoRepo
This is app that works similarly to imgur or Unsplash.

## Features
- Image Compression
  - Images are compressed to have either a max width of 1200px or a max height of 1200px depending on the aspect ratio
  - Images are compressed using ImageMagick on upload
- Search
  - Search Results will show up my matching the search query to the title or the description of the post.
  - Quasi search suggestions: realtime search results show up as you type
  - You can also search for users
- Profiles
  - Users can share photos, and they'll show up on their profile
  - Photos are shareable (basically just sharing the link to the page) 

## Tech Stack
- Ruby on Rails 6
- Stimulus.js
- Postgres

## Server
- Heroku

## 3rd Party
- DigitalOcean Spaces (for image storage)

## How to run on your local machine

*There is a demo on heroku, and I would recommend that you use that one. But if you want to run this locally, follow these steps*

1. Clone the repo
2. run `bundle install` making sure you have the correct version of Ruby (2.7.1)
3. run `rails db:create && rails db:migrate`
4. run `bin/webpack` and then run `rails s` (This project uses webpacker)

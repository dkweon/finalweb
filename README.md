# Scrapwebbing

Scrapwebbing is a tool for creating photo albums, which can be shared between different users. We wanted to share some photos with our parents back in Korea, but did not want to use facebook, which automatically shares photos with all of our friends. Also, we intended to create a family photo album on a webpage in order to overcome the problem of living far away from each other.


## Features

- Secure albums via unique user names and passwords
- Number of albums as well as photos inside each album has no limit
- User can change the background of each album
- Users can share their albums with their friends
- Used Bootstrap


## Use
1. Clone the repo
2. Install dependencies with 'bundle install'
3. Run this app with shotgun
or
Go to http://web-group-album.herokuapp.com/

1. Clone the repo
2. Edit `config/initializers/admin_users.rb` to reflect the admins' google account info.
3. Set the `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `GITHUB_CLIENT_ID`, and `GITHUB_CLIENT_SECRET` environment variables with your GitHub and Google API credentials (if you're deploying to heroku, you'll need to set those on the server as well).
4. Install dependencies with `bundle install`
5. Create the database with `rake db:create db:migrate` (you will need to have postgres installed)
6. Run this app with `rackup` or `shotgun`

## Screenshots

![screen shot 2014-09-23 at 1 28 18 pm](https://raw.github.com/dkweon/finalweb/blob/master/Desktop/finalweb/public/a.jpg)


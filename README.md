### My Twitter Unfollow App
As it stands I have....

1. A database the keeps tracks of users and their passwords and twitter handles.
2. A database that keeps tracks of the search terms a user uses
3. A user can create an account and be tracked as logged in
4. A user can sign in and be tracked as logged in
5. A user can sign out which clears session data
6. Created models to access and store data in the database
7. A user can enter a search term that will currently save that term to the DB and show 10 of the users Twitter friends

I plan to implement

1. Ajax calls for my routes so that the page does not have to reload
2. BCrypt to protect my users information
3. The ability to control what DOM elements are show on the home page depending on a login state
4. CSS styling
5. Save a users friend in an array to a variable
6. The ability to look at posts from a user friends and look for the saved search term within the body


### Things I have learned and Obstacles I have run into

1. Using the twitter gem is great for accessing Twitter data
2. The Twitter login process is very difficult
3. I have learned how to access a Twitter object that the API returns
4. I have learned how to make the proper calls using the Twitter Gem
5. I understand better how OAuth works but find it hard to implement


### To Use
1. Create a user account with your valid Twitter handle
2. Enter a search term and hit search
3. At this juncture it will the last 10 people a user has followed


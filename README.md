# IMDB-Clone

# IMDB Clone

## Description:
This is a slimmed-down version of the IMDB web application with basic functionalities such as searching for movies, logging in, viewing movie details, and adding movies to watchlists.

## Technologies Used:
- EJS (Embedded JavaScript) for templating
- JavaScript for client-side functionality
- CSS for styling

## Features:
1. **Home Page:**
    - Generic Search: Searches movie titles, summaries, and actors. Provides a dropdown for specific search categories. Displays the top 3 items matching the search text.
    - List of Movies: Displays at least 10 movies with IMDB scores, images, and trailers.
    - Language Toggle: Allows users to switch between English and Turkish. Defaults to the browser language.

2. **Login Page:**
    - Email/Password and Google Login: Supports both methods for authentication.
    - User Registration: Users can register with email, password (meeting specific criteria), country, and city.
    - After Login: Redirects users to the Home Page with the user name displayed in the header.
    - Watchlist and Rating: Logged-in users can add movies to their watchlist and rate/comment on movies.

3. **Search Results:**
    - Titles and People Sections: Displays search results in separate sections for movies/shows and people.
   
4. **Movie/Show Detail:**
    - Image and Clip: Displays one image and one clip of the movie/show.
    - Rating: Shows the rating of the movie/show.
    - Popularity: Business logic calculates popularity based on ratings, comments, and page views. Displays popularity ranking.

## Issues:
- **Unable to Upload Trailers:** The trailers for the movies are fetched from my database in the `images` folder. However, due to GitHub's 24MB limit, I couldn't upload the trailers. The trailers are included in the video demonstrating the site and can be seen when running the project locally.

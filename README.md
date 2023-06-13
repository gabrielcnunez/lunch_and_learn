<div align="center"><img src="doc/images/lunch_and_learn.jpeg" alt="Lunch and Learn" class="center" width="572" height="300"></div>
<br>
  
This repo is a back end application utilizing four external APIs to expose five endpoints for use by a fictional front end application. 
<br>

The purpose of this project is to simulate the real-world challenge of developing an application based on the requirements of a front end team. 
<br>
<br>

# Table of Contents
- [Learning Goals](#learning-goals)
- [Tech & Tools Used](#tech-and-tools)
- [How to Set Up](#how-to-set-up)
- [How to Run Test Suite](#how-to-run-test-suite)
- [Available Endpoints](#available-endpoints)
- [Contributors](#contributors)
<br>
    
# Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure by using mocking tools, such as Webmock and VCR
<br>

# Tech and Tools
### Built With
  - ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) **2.7.4**
  - ![Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) **5.2.8.1**
  - <img src="doc/images/rspec_badge.png" alt="RSpec" height="30"> **3.12.0**
  - <img src="doc/images/postman_badge.png" alt="RSpec" height="30">
  - ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

### Gems Used:
  - [Faraday](https://lostisland.github.io/faraday/)
  - [Figaro](https://github.com/laserlemon/figaro)
  - [Pry](https://github.com/pry/pry-rails)
  - [Simple-Cov](https://github.com/simplecov-ruby/simplecov)
  - [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)
  - [Webmock](https://github.com/bblimke/webmock)
  - [VCR](https://github.com/vcr/vcr)
<br>

# Developer Setup
<ol>
  <li>Fork and clone this repository</li>
  <li>cd into the root directory</li>
  <li>Run <code>bundle install</code></li>
  <li>Run <code>bundle exec figaro install</code></li>
  <li>Run rails <code>db:{create,migrate}</code></li>
  <li>To run this server, run <code>rails s</code> in your terminal</li>
  <li>To stop the local server, use command <code>Control + c</code></li>
  <li>Sign up for the following APIs (all available for free):
  
  [REST Countries API](https://restcountries.com/#api-endpoints-v3-all) |
  [Edamam API](https://developer.edamam.com/edamam-recipe-api) |
  [Youtube API](https://developers.google.com/youtube/v3/getting-started) |
  [Unsplash API](https://unsplash.com/documentation#creating-a-developer-account)

  In config > application.yml

  ```
     recipe_app_id: <edamam_app_id>
     recipe_api_key: <edamam_api_key>
     video_api_key: <youtube_api_key>
     images_api_key: <unsplash_api_key>
  ```
</ol>
<br>

# How to Run Test Suite
  After set up:
  <ol>
    <li>Run <code>bundle exec rspec spec</code></li>
  </ol>


# Available Endpoints
<details close>
<summary>Get Recipes for a Particular Country</summary><br>

  - GET "/api/v1/recipes?country=thailand"<br>
  - Sample response body: <br>
    ```
      {
        "data": [
          {
            "id": "null",
            "type": "recipe",
            "attributes": {
              "title": "Thai Coconut Cremes",
              "url": "https://food52.com/recipes/37220-thai-coconut-cremes",
              "country": "thailand",
              "image": "https://edamam-product-images.com/web-img/f4e571219.jpg"
            }
          },
          {
            "id": "null",
            "type": "recipe",
            "attributes": {
              "title": "Sriracha",
              "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
              "country": "thailand",
              "image": "https://edamam-product-images.com/web-img/h4w832793.jpg"
          }
        ]
      }
    ```
  
</details>

<details close>
<summary>Get Recipes for a Random Country</summary><br>

  - GET "/api/v1/recipes
  - Sample response body: 
    ```
      {
        "data": [
          {
            "id": "null",
            "type": "recipe",
            "attributes": {
              "title": "Tropical Pops(Antigua and Barbuda)",
              "url": "http://www.food.com/recipe/tropical-pops-antigua-and-barbuda-507250",
              "country": "Antigua and Barbuda",
              "image": "https://edamam-product-images.com/web-img/m9h234343.jpg"
            }
          },
          {
            "id": "null",
            "type": "recipe",
            "attributes": {
              "title": "Papaya Pie (Antigua and Barbuda)",
              "url": "http://www.food.com/recipe/papaya-pie-antigua-and-barbuda-468338",
              "country": "Antigua and Barbuda",
              "image": "https://edamam-product-images.com/web-img/j6y293874.jpg"
          }
        ]
      }
    ```
</details>

<details close>
<summary>Get Learning Resources for a Particular Country</summary><br>

  - GET "/api/v1/learning_resources?country=laos"
  - Sample response body: 
    ```
      {
        "data": {
          "id": null,
          "type": "learning_resource",
          "attributes": {
            "country": "laos",
            "video": {
              "title": "A Super Quick History of Laos",
              "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
              {
                "alt_tag": "time lapse photography of flying hot air balloon",
                "url": "https://images.unsplash.com/photo-1540611025311.jpg'
              },
              {
                "alt_tag": "aerial view of city at daytime",
                "url": "https://images.unsplash.com/photo-1570366583862.jpg"
              }
            ]
          }
        }
      }
    ```
</details>


<details close>
<summary>Register a New User</summary><br>

  - POST "/api/v1/users/"<br>
  - Sample request body: <br>
    ```
    {
        "name": "Jon X Sample",
        "email": "jon@sample.com"
    }
    ```
  - Sample response body: <br>
    ```
      {
        "data": {
          "id": "2",
          "type": "user",
          "attributes": {
            "name": "Jon X Sample",
            "email": "jon@sample.com",
            "api_key": "Xge8Ls27WdlS"
          }
        }
      }
    ```
</details>

<details close>
<summary>Add Favorited Recipe to User</summary><br>

  - POST "/api/v1/favorites"<br>
  - Sample request body: <br>
    ```
    {
        "api_key": "d1gdyTIHlmEK",
        "country": "vietnam",
        "recipe_link": "https://www.seriouseats.com/kenji_rulez.html",
        "recipe_title": "Garlic Noodles (a San Francisco Treat, not THE San Francisco Treat)"
    }
    ```
  - Sample response body: <br>
    ```
      {
        "success": "Favorite added successfully"
      }
    ```
</details>

<details close>
<summary>Get All Favorites for a User</summary><br>

  - GET "api/v1/favorites?api_key=d1gdyTIHlmEK"
  - Sample response body:
    ```
      {
        "data": [
          {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Garlic Noodles (a San Francisco Treat, not THE San Francisco Treat)",
                "recipe_link": "https://www.seriouseats.com/kenji_rulez.html",
                "country": "vietnam",
                "created_at": "2023-01-17T21:12:19.336Z"
            }
          },
          {
            "id": "2",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Thai Coconut Cremes",
                "recipe_link": "https://food52.com/recipes/37220-thai-coconut-cremes",
                "country": "thailand",
                "created_at": "2023-01-18T08:37:50.770Z"
            }
          }
        ]
      }
    ```
</details>


<br>

# Project Team:
## Contributors

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/108249540?v=4" width=auto height=110px></td>
  </tr>
  <tr>
    <td>
    <div align="center"><strong>Gabe Nuñez</strong></td></div>
  </tr>
  <tr>
    <td>
      <div align="center"><a href="https://github.com/gabrielcnunez">GitHub</a><br>
      <a href="https://www.linkedin.com/in/gabriel-nunez-az/">LinkedIn</a></div>
    </td>
  </tr>
</table>

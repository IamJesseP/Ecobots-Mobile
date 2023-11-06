# Ecobots

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

An intuitive platform to quantify the significance of their recycling practices. By uploading an image of their recyclable item, users not only get it recognized, but also receive insights into the environmental benefits of recycling that specific item.

### App Evaluation

   - **Category:** Educational / Climate Advocacy
   - **Mobile:** Mobile is essential for the instant logging of recycling info. Users use the app to conveniently identify recyclables and learn of their individual impact.
   - **Story:** There is a growing sentiment that our individual actions for recycling are meaningless. This app seeks to show everyone the significance of their individual reaction to save the world!
   - **Market:** Anyone that uses recyclable materials, or wants to learn about recycling impacts.
   - **Habit:** Users are constantly surounded by recyclable materials. Upon disposing something that can be recycled, users can snap a picture of the item, get immediate insight on their impact, and have an accumulated history of their recycling habits and total impact.
   - **Scope:** V1 would allow users to take a picture of their recyclable and recieve feedback (recyclable identified, impact). V2 would incorporate a database for individual users to keep track of total recycling habits. V3 would add a way for users to add friends and see each others recycling habits 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can take a picture of a recyclable item
* Users can have the recyclable type identified
* Users have a display with useful information after taking a picture
* Useful information can be: How to recycle said item, impact for recycling said individual item, facts about recycling said item

**Optional Nice-to-have Stories**

* Users can register and login
* Users can see a history of all items they have recycled through the app
* Users can see a total calculcated impact of all of their recycled items
* Users can add friends and share their recycling history and total impact

### 2. Screen Archetypes

- Login Screen
  * Users can login
- Registration Screen
  * Users can register
- Creation Screen
  * Users can take a photo and create a detail screen for recycled item
- Home Stream Screen
  * Users can see a data log history of recycled items
- Detail Screen
  * Users can see a detailed view of a recycled item
- Profile Screen
  * Users can access data log history detail screen
  * Users can see total impact
  * Users can see added friends
- Profile Screen: Friends
  * Users can see friends data log history detail screen
  * Users can see friends total impact

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Recycle => Takes to camera
* Profile => Takes to user profile
* Friends => Takes to friends list

**Flow Navigation** (Screen to Screen)

- Login / Registration Screen:
  * => Home Screen
* Home Screen:
  * => display stream screen
* Stream screen:
  * => Detail screen
* Detail screen:
  * => nowhere
* Creation screen:
  * => Detail screen
  * => Home screen
* Profile screen:
  * => detail screen
  * => profile screen(friends)

## Wireframes

<img width="488" alt="image" src="https://github.com/IamJesseP/Ecobots-Mobile/assets/108151191/551fa76e-774e-4749-8627-844e6ff7ad19">



## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

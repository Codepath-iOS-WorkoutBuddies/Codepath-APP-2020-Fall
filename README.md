WorkoutBuddies - README
===

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
WorkoutBuddies is a workout app that pairs similar-leveled users and creates a workout agenda in which they can add or delete exercises. WorkoutBuddies also matches users for physical-related activities such as skateboarding, hiking, etc. Lastly, WorkoutBuddies also features user-messaging to assist users in the scheduling of workout sessions.

### App Evaluation
- **Category:** Fitness + Social Networking
- **Mobile:** The real-time availability of mobile is essential for this. This allows users from anywhere to connect with another likeminded user through a partnered workout session. The camera, audio sensors, and location will be used for this app.
- **Story:** Facilitates the building of meaningful connections between people by the means of an online, partnered workout session.
- **Market:** Any person seeking to build connections with others through an online workout session. Any person that find themselves lacking motivation to get in shape. //TODO Monetization
- **Habit:** Users are using it every other day or weekly to schedule a workout session with another person.
- **Scope:** V1 - Users can schedule a simple workout session with another user by Zoom. Users can also private message each other. V2 - Users can now choose different categories for their workouts (ie. skateboarding, hiking, etc) V3 - The integration of Google Meetings, Google Calendar, and Facetime 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can create an account, login and out
* User can select their level of expertise
* User can edit a system generated agenda
* User matches with another user with same the level of expertise
* User can meet others through Zoom
* User can search for other users

**Optional Nice-to-have Stories**

* Integration of Google Meetings, Google Calendar, and Facetime
* Allow the schedule of different categories of physical fitness
* Users can login through their Google Accounts/ Facebook Accounts

### 2. Screen Archetypes

* Login and Registration Screen   
    * User can log in  
    * User can create their accounts
* Home Screen 
    * User can view the people they can schedule a workout session with
    * User can view possible workout buddies
    * User can schedule workout plan
* Create Plan Screen
    * User can create a workout place 
* Workout Plan Screen
    * System generates a plan which the user can edit
* Suggestions Screen
    * User can view a full list of suggested workout buddies  
* Buddy Detail Screen
    * Displays the profile of another user
* New Event Screen
    * User can schedule a workout with another user
* User Profile Screen 
    * User can view user-related information
    * User can view upcoming, scheduled workouts
* Search Screen
    * Users can search for other pairs if current pairs aren't satisfactory
    * Search by workout expertise, category, and/or name
* View Chats Screen
    * User can view all chats
* Chat Screen
    * User can see the chat with another user
* FaceTime Screen
    * User can facetime another user and view the workout plan at the same time

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Feed
* Profile
* Search
* Chat

**Flow Navigation** (Screen to Screen)
* Login and Registration Screen
    * => Home Screen
* Home Screen
   * => Search Screen
   * => View Chats Screen
   * => Profile Screen
   * => Create Plan Screen
   * => Suggestions Screen
* Search Screen
    * => Buddy Detail Screen
* View Chats Screen
    * => Chats Screen
        * => FaceTime Screen
* User Profile Screen
* Create Plan Screen 
    * => Workout Plan Screen
* Suggestions Screen
    * => Buddy Details Screen
        * => New Event Screen

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://raw.githubusercontent.com/lmxtiger/Codepath-APP-2020-Fall/main/Image%20from%20iOS.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

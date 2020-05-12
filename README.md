# MemeMe
Select, create, save and share memes.

# Project Overview
An app that enables a user to take a picture, and add text at the top and bottom to form a meme, and share that meme on Facebook and Twitter and also by SMS or email. Sent memes will appear in a tab view with two tabs: a table view and a collection view. This app demonstrates use of:
+ Setting up a navigation structure that creates an intuitive flow through the app
+ Building tables with datasources and delegates
+ Creating custom table view cells
+ Implementing user interfaces with tab views and collection views

# Specifications
+ The Sent Memes page is displayed when the app launches.
+ The app has three pages of content: Meme Editor, Sent Memes, and Meme Detail.
+ Control statements (for, while, if, else, switch) are used appropriately.
+ Potentially repetitive blocks of code are effectively abstracted into reusable methods.
+ Arguments and return values are procedure-appropriate.
+ Code is easy to understand. Any code that may be hard to follow is commented effectively.
+ Code adheres to Swift naming and style conventions.
+ User interface elements, images, and generated memes are properly displayed and function as expected in portrait as well as landscape orientations.
+ The Meme Editor view has a toolbar with two buttons: one that allows user to open the Photo Album to select an image, one that launches the camera.
+ The app displays the image picker when the Album button is pressed.
+ The app displays the camera when the Camera button is pressed on a phone.
+ The Camera button is disabled when app is run on devices without a camera, such as the simulator.
+ The chosen image from the camera or the photo album is displayed and scaled properly with AspectFit to fit the device screen.
+ Text fields are provided for top and bottom text.
+ The font and style used to display the meme text is easy to read: bold, all caps, white with a black outline, and shrink to fit.
+ The text field that the user is currently editing remains fully visible with the keyboard on screen. For the bottom text field this is achieved by moving the entire view up to keep the text field on screen, then back after the keyboard is dismissed.
+ The Meme Editor uses the Cancel button to return to the Sent Memes View.
+ The app has a social share button that uses the “Action” icon built into iOS.
+ The share button launches the Activity View.
+ The meme is saved in the activity view controller’s completionWithItemsHandler. Canceling the activity view controller does not save the meme.
+ The Meme model is a struct that includes: two strings representing the top and bottom text, the original image, a memed image combining image and text

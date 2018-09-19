# open_source_hacks


## CoolWhip

Simple class function methods for simple animations

## FCM Notifications

Device to device notifications for iOS is a bit trivial. This function sends an HTTP request to FCM Google API of the notification to your users generated FCM Token. 

In order to use the class, you must have a Server Token, device FCM token of the user you want to send a notification to (think of it as the users phone number when sending a text message), and Push Notifications setup in Firebase. To learn more about how to set that up, refer to the [Firebase Cloud Messaging Documentation](https://firebase.google.com/docs/cloud-messaging/ios/client).

## PageViewController

This will allow you to setup a page controller in your iOS app. Each ViewController of your app must have a Storyboard ID. To learn more about Storyboard ID's, refer to this [StackOverflow Question](https://stackoverflow.com/questions/13867565/what-is-a-storyboard-id-and-how-can-i-use-this). When that is setup, add the ViewController by ID in the orderedViewController array and set the PageViewController class onto a UIPageViewController inside Storyboards. 

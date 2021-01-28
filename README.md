# MovieSearch
What design decisions did you make and why?
 I used Storyboard, since it is not a complex UI.The layout acted for this UI seems to be conveniently implemented through Storyboard in a limited time.

What design patterns or architecture might be necessary in the future?
The design pattern I have used is MVVM.It seems MVVM architecture can still support further feature implementation with efficient code modularization and unit testing 

How would we extend your app if we had to add functionality?
This app can be extended to add multiple new features 
Since I have done in MVVM architecture, I could extend it further.This api retrieves only one response. If it gives more response data I can populate it all in tableview

How might you change the architecture of the app if the data model and end point code needed to be reused in a second app?
In case some modules to be used in different apps, I would consider using sub project within  the main project (as a sub module)

What documentation, websites, papers, etc. did you consult for this assignment?
I have referred sample tutorial to implement unit testing as the project that I have worked earlier as well as my current project don’t have unit testing implemented.

Websites Referred:-
Raywenderlich.com
Medium.com
Rotten Tomatoes

What third-party libraries or other tools does your application use? How did you choose each library or framework you used?
I haven't used any third party libraries.

How long did you spend on this exercise? If you had unlimited time to spend on this, how would you spend it and how would you prioritize each item? 
I took three hours to complete this. I would probably spend more time on writing unit test code more efficiently.
And would have improvised UI.I would consider adding swift lint 
Searching suggestions 
Would have added one UI to list popular movies

If you were going to implement a level of automated testing to prepare this for a production environment, how would you go about doing so?
1 . unit testing
2. UI snapshot testing 
3. UI automated testing apium 

If you were unable to finish the exercise, what issues did you face and how did you plan on finishing the exercise?
I have faced issue on getting correct api.The api key which was given to me was not working.So I created a new api key and obtained the api response.
I would concentrate more on code modularization and writing unit test cases.

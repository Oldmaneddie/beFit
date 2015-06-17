# beFit
Ruby on Rails Project Designed as a Fitness tracker & Analytics for Weightlifters.

additional gems:
Devise
Paper Clip
Full Calender
Gruff

Notes:

Using paperclip within Devise or Scenario where you have already created the USer Object you obviously cannot in retrospect use
the inbox CREATE fucntion instead just find by params/current_user using devise and then update the attributes to save it. 
not much actual documentation about this one. 

Also note that you could probably renest Weeklogs right into it but don't want to go down that path itself.
Also you have some serious styling issue with your class assignment with sumbit buttons of different types. 
# SkinTune Application Frontend - ANU Hackathon 2024

In collaboration with [@jamesnoonan](https://github.com/jamesnoonan), [@chethin](https://github.com/Chethin) and [@kpate123](https://github.com/kpate123).

An AB-testing framework application for people with skin issues, suitable for IOS.

## Use-Case:

SkinTune’s demographic are people who have mild-moderate skin issues that would typically require 
multiple consultations to find a somewhat trivial solution. This app removes the need for professional
opinions, which often results in guesswork regardless. Passively take charge of your health by spending 
less than one minute a day journaling your schedule and let SkinTune help find your tailored treatment.

## Interface:

Upon entry, the user is prompted to rate their day on several metrics relevant to skincare. Next, the user 
enters how their skin felt at the end of the day. Then, on the popular hosting framework, Heroku, the 
team has created a custom API which the application uses to send data to the neural network hosted in 
the cloud (the backend code can be found [here](https://github.com/BillyJaf/hackathon_backend). 
SkinTune learns external factors that impact consumers skin-health and compares its 
predictions to user input. Following this, a list of currently optimal conditions are fed back to the user for trial.
The following can be seen in the friendly UI:

![image](https://github.com/user-attachments/assets/8f74e450-f95c-4c1c-b686-235f8a205ade)

## Installation:

The application is suitable for, and can be downloaded on, IOS () but can also be downloaded onto () IOS emulator.

### Steps:

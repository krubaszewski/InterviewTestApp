Instructions for completing the Hargreaves Lansdown XCUITest take home test
===


The Task
---

Edit the existing test 'testExample' in the 'InterviewTestApp' class (InterviewTestApp.swift) to perform the following sequence of test actions:

1. Type the non-numerical value "Anna" in the textfield
2. Tap the 'Validate' button
3. Confirm that an error message is displayed and that the 'Show next screen' button is DISABLED
4. Type the number "56" in the textfield
5. Tap the 'Validate' button
6. Confirm that the number is converted into decimal and that the 'Show next screen' button is ENABLED
7. Tap the 'Show next screen' button
8. Validate that the same number is shown on the next screen
9. Tap the BACK arrow
10. Validate that the screen has been cleared and that the 'Show next screen' button is DISABLED
11. Confirm that it is not possible to type a number with a comma and that the correct error message is displayed
12. Type ".897" in the textfield
13. Tap the "Validate" button
14. Confirm that the number is converted into decimal and that the 'Show next screen' button is ENABLED
15. Tap the 'Show next screen' button
16. Confirm that the correct number is shown on the next screen
17. Swipe BACK to the previous screen
18. Confirm that the screen is clear


Expectations
---

1. The test should pass on every run. It will be run at least three times on an iPhone 13 (iOS 16, Xcode 14.1).
2. All code should be Swift and only Apple frameworks are to be used.
3. It is not required to use any particular pattern e.g. Robot.
4. Presentation of the code is as important as functioning code. The submission should be treated as if it were a merge request waiting to be peer reviewed.
5. The use of Xcode's test recording feature will be rejected, the quality of code generated is usually poor.
6. The choice of variable/function names is important and will be considered as part of the assessment.

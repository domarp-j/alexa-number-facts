# Alexa Sinatra Demo

Create an Alexa skill using Ruby

Based on a great guide by Maker's Academy: https://developer.amazon.com/alexa-skills-kit/makers-academy

## Setup

Note: These instructions are based on the developer console beta that exists as of *20 March 2017(.

### Part 1 - Initialize the skill

1. Create an AWS account, if you don't have one already
2. Log in and go to the AWS Developer Console: https://developer.amazon.com/edw/home.html#/
3. Select "Get Started" in the Alexa Skills Kit widget
4. Click "Create Skill"
5. Enter skill name, then press "Next"
6. Select "Custom" as the skill type, then select "Create skill"

### Part 2 - Create the interaction model

1. On the right side, you should see a skill builder checklist. Select the first step "Invocation Name".
2. Enter the **invocation name** of your skill
  - The invocation name is the name that Alexa will use to recognize your skill
  - "Alexa, ask **Recipes** *how do I make an omelet?*" => The invocation name is in bold
3. Click "Save Model", then go back to the dashboard by clicking the "Build" tab on top
4. Under the skill builder checklist, select "Intents, Samples, and Slots"
5. Create an **intent** and select "Create custom intent"
  - Intents are just the requests that will be sent to Alexa, allowing it to send a response
6. Enter a **sample utterance**
  - Sample utterances are essentially the specific commands you have for a skill
  - "Alexa, ask **Recipes** *how do I make an omelet?*" => The sample utterance is in italics
7. Click "Save Model", then "Build Model"
8. Click on the "Build" tab to go back to the skill builder checklist, and wait for the third step "Build Model" to go green
9. Hold off on setting an endpoint for now

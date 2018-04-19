# Alexa Sinatra Demo (Part 1) - Number Facts

This is Part 1 of the primer for setting up an Alexa skill with Ruby! Go through the [Alexa custom skills documentation](https://developer.amazon.com/docs/custom-skills/understanding-custom-skills.html) to see the full depth of Alexa's capabilities.

This guide will teach you the basics of making an Alexa skill dialogue model via the Amazon Developer Console. It will also teach you how to create server-side code through [Sinatra](https://github.com/sinatra/sinatra) in order to handle Alexa requests & responses.

After you're done with this guide, check out [Part 2](https://github.com/domarp-j/alexa-pizza-buddy) which uses the [ralyxa](https://github.com/sjmog/ralyxa), a gem that makes handling Alexa requests & responses MUCH easier. Part 2 is optional, however - you should have everything you need to build an Alexa skill after going through this guide.

Based on a great guide by Maker's Academy: https://developer.amazon.com/alexa-skills-kit/makers-academy

## Setup

Note: These instructions are based on the developer console beta that exists as of *18 April 2018*.

### Part 0 - Think about what you want to build!

Decide what you would like to build, and then map out the dialogue model between the client and Alexa.

### Part 1 - Initialize the skill on Amazon Developer Console

1. Create an Amazon Developer account, if you don't have one already
    - Note: it'll be easier to test your skill on your Alexa device if the Amazon developer account has the same email as the Amazon account registered with the device
2. Log in and go to the Amazon Developer Console: https://developer.amazon.com/edw/home.html#/
3. Select "Alexa Skills Kit" navigation item
4. Click "Create Skill"
5. Enter the name of the skill you would like to build, then press "Next"
6. Select "Custom" as the skill type, then select "Create skill"

### Part 2 - Create the interaction model

1. If you're not already at the skill page, go to the Amazon Developer Console, select "Alexa Skills Kit", and select your skill
2. On the right side, you should see a skill builder checklist. Select the first step "Invocation Name".
3. Enter the **invocation name** of your skill
    - The invocation name is the name that Alexa will use to recognize your skill
    - "Alexa, ask **fun number facts** *about the number 11*" => The invocation name is **fun number facts**
4. Click "Save Model", then go back to the dashboard by clicking the "Build" tab item at the top of the page
5. Under the skill builder checklist, select the second step "Intents, Samples, and Slots"
6. Create **intents**
    - Intents are the requests that will be sent to Alexa, allowing it to send a response
    - You will want to create an intent for every request you want Alexa to handle
    - To create an intent, click "Add" next to "Intents" and follow the guide
        - Intents are usually named in CapitalCase format
7. Enter one or more **sample utterances** for each intent
    - Sample utterances are essentially the specific commands you have for a skill
    - "Alexa, ask **fun number facts** *about the number 11*"" => The sample utterance is *about the number 11*
8. Optionally, add one or more **slots** to any sample utterance
    - Slots are parameters that you can add to sample utterances to make them dynamic
    - Add curly braces around the slot in the sample utterance field
    - "Alexa, ask **fun number facts** *about the number {someNumber}* => The slot is *someNumber*
    - Define the slot under "Intent Slots", defining both the name and slot type
9. Optionally, you can create a **custom slot type**
    - In the left side panel, select "Add" next to "Slot Types"
    - Enter a name for the slot type, then press "Create custom slot type"
    - Create a sample utterance with slots (see Steps 7 and 8)
    - Under "Intent Slots", set slot types to your new custom slot type as needed
10. Click "Save Model" when you are ready
11. Click "Build Model" - you'll have to do this every time you create or modify an intent
12. Click on the "Build" tab item to go back to the skill builder checklist, and wait for the third step "Build Model" to go green
13. Hold off on setting an endpoint for now

### Part 3 - Set up Sinatra & ngrok for local development

1. If you haven't already, fork and clone this repo
2. Run `bundle install`
3. Download ngrok: https://ngrok.com/download
4. Unzip the downloaded ngrok contents and move the `ngrok` executable to this repo
5. Run `./ngrok http 4567` to run the Sinatra app locally on port 4567
    - We need ngrok to give us an HTTPS URL that we can use as an endpoint for Alexa
    - Alexa uses SSL to validate endpoints, so an HTTPS URL is mandatory
    - ngrok will give us a convenient public URL that will directly hit `localhost:4567` on our local machine
    - If you would like to customize the subdomain rather than getting some random characters, enter `./ngrok http -subdomain=ohheyitsme 4567`
6. Copy the HTTPS path somewhere. We will use it shortly.
    - Look for a URL with the format https://ohheyitsme.ngrok.io
    - Leave this terminal open to keep ngrok running
7. Open a new terminal and run `ruby server.rb`
    - Note that `server.rb` already has a POST request defined, ready to accept requests passed along by Alexa
    - Note the format of the JSON response. This is how the Sinatra app tells Alexa how to reply.
    - Do not close this terminal while `server.rb` is running

### Part 4 - Endpoint setup

1. Go back to the Amazon Developer Console for Alexa
2. Under the skil builder checklist, select the fourth and final step "Endpoint"
3. For the service endpoint type, select "HTTPS"
4. You should see two fields next to "Default Region". In the first field, enter the HTTPS ngrok URL you copied.
5. For the second field, the SSL certificate type, select the following:
    - "My development endpoint is a sub-domain of a domain that has a wildcard certificate from a certificate authority"
6. Click "Save Endpoints"
7. Select the "Build" tab at the top, and verify that all four skill builder checklist items are green

### Part 5 - Testing the skill

1. Select the "Test" tab at the top, and enable testing
2. Make sure that `ngrok` and `server.rb` are both running locally, in separate terminals
3. Test Alexa by doing one of the following:
    - Type in the commands to get Alexa's responses on your local machine
    - Speak to your Alexa-enabled device
        - If you have an Alexa that is already connected to the same email as your Amazon Developer account, you're good to go!
        - If not, follow these instructions to link the device to your developer account: https://developer.amazon.com/docs/custom-skills/test-a-custom-skill.html#h2_register

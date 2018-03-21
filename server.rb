require 'sinatra'
require 'json'
require 'net/http'

post '/' do
  # Get the Alexa client's request
  parsed_request = JSON.parse(request.body.read)

  # Extract out the information we need from the slots in the request
  # See requestSamples/intentRequestSample.json for an example of the request
  number = parsed_request['request']['intent']['slots']['someNumber']['value'] # built-in slot
  fact_type = parsed_request['request']['intent']['slots']['factType']['value'] # custom slot

  # Make an external API call
  number_facts_uri = URI("http://numbersapi.com/#{number}/#{fact_type}")
  number_fact = Net::HTTP.get(number_facts_uri)

  # Return Alexa's response as JSON
  {
    version: '1.0',
    response: {
      outputSpeech: {
        type: "PlainText",
        text: number_fact
      }
    }
  }.to_json
end
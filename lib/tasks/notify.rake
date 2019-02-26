task :mailgun do
  require 'mailgun-ruby'

# First, instantiate the Mailgun Client with your API key
mg_client = Mailgun::Client.new 'key-f547a2d53fb3e0f1510ee2b43d6baff7'

# Define your message parameters
message_params =  { from: 'winter19@teacherplan.org',
                    to:   'jmzhou@uchicago.edu',
                    subject: 'The Ruby SDK is awesome!',
                    text:    'It is really easy to send a message!'
                  }

# Send your message through the client
mg_client.send_message 'mg.teacherplan.org', message_params
end

task :twilio do
  require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC560eec0b431b58b5e755e3846e2ad8ac'
auth_token = 'a650751c70dfe323924261b4d07647c4'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.api.account.messages.create(
  from: '+18017846386',
  to: '+16176062304',
  body: 'Hey there!'
)

end


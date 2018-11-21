require 'zendesk_api'

$client = ZendeskAPI::Client.new do |config|
  # Mandatory:

  config.url = "https://jeremy9496.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

  # Basic / Token Authentication
  config.username = "jbeaucjemin2701@gmail.com"

  # Choose one of the following depending on your authentication choice
  # config.token = "oitlMFs4PsGU796bhYR6rn8dELxuwoEhyLSfOXEZ"
  config.password = "morse8904"

end

  # OAuth Authentication
  #config.access_token = "a93dd837aa892d0433e239c16e2b256c5b749c31bc36166473c51bc1523c1e81"

  # Optional:

  # Retry uses middleware to notify the user
  # when hitting the rate limit, sleep automatically,
  # then retry the request.
  #config.retry = true

  # Logger prints to STDERR by default, to e.g. print to stdout:
  #require 'logger'
  #config.logger = Logger.new(STDOUT)



  # Changes Faraday adapter
  # config.adapter = :patron

  # Merged with the default client options hash
  # config.client_options = { :ssl => false }

  # When getting the error 'hostname does not match the server certificate'
  # use the API at https://yoursubdomain.zendesk.com/api/v2
  
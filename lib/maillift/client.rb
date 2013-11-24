module MailLift
  class Client
    ROOT_URL = 'https://api.maillift.com'

    def initialize(account, secret, version = '2013-08-17')
      @account, @secret, @version = account.strip, secret.strip, version.strip
    end

    def letter
      @letter ||= API::LetterAPI.new(rest_client, rest_client)
    end

    def letter_status
      @letter_status ||= API::LetterStatusAPI.new(rest_client, rest_client)
    end

    private
    def base_url
      "#{ROOT_URL}/#{@version}/"
    end

    def rest_client
      @rest_client = RestClient::Resource.new( 
        base_url, 
        {
          user: @account,
          password: @secret,
          headers: { accept: :json }
        }
      )
    end
  end
end

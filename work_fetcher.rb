require 'octokit'
require './credentials'

module WorkFetcher
	@client = Octokit::Client.new access_token: Credentials.access_token

	def self.list_of_repositories
		@client.repos(@client.user.login)
	end
end
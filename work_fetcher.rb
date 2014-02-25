require 'octokit'

require './credentials'
require './requests_cache'

module WorkFetcher
	@client = Octokit::Client.new access_token: Credentials.access_token
	@user = @client.user
	@login = @user.login

	@cache = RequestsCache.new @client

	def self.repos
		without_html_url = @cache.handle :repos, self.query_repos
		self.add_html_url without_html_url
	end

	def self.organizations
		@cache.handle :organizations, self.query_organizations
	end

	def self.query_repos
		@client.repos(@login, sort: :updated, headers: self.etag_headers(:repos))
	end

	def self.query_organizations
		@client.organizations(@login, headers: self.etag_headers(:organizations))
	end

	def self.etag_headers(request_type)
		etag = @cache.get_etag(:request_type)
		etag = '' if !etag
		{'If-None-Match' => etag}
	end

	def self.add_html_url(repos)
		repos.each do |repo|
			repo.url = 'https://github.com/' + @login +'/' + repo.name
		end
		repos
	end

end
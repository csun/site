require 'sinatra'
require './work_fetcher'

def network_setup
	set :port, 80
	set :bind, '0.0.0.0'
end

network_setup


get '/'  do
	erb :index
end

get '/work' do
	@works = WorkFetcher.list_of_repositories
	erb :work
end

get '/about' do
	erb :about
end

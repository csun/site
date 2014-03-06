require 'sinatra'
require './work_fetcher'
require './description_generator'

def network_setup
	set :port, 80
	set :bind, '0.0.0.0'
	set :environment, :production
end

network_setup

get '/'  do
	@description = DescriptionGenerator.random_description
	erb :index
end

get '/work' do
	@repos = WorkFetcher.repos
	erb :work
end

get '/about' do
	erb :about
end

not_found do
	erb :'404'
end

error do
	erb :error
end
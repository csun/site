require 'sinatra'

def network_setup
	set :port, 80
	set :bind, '0.0.0.0'
end

network_setup

get '/'  do
	erb :index
end

get '/work' do
	erb :work
end

get '/bio' do
	erb :bio
end

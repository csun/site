require 'sinatra'

def network_setup
	set :port, 80
	set :bind, '0.0.0.0'
end

network_setup

get '/'  do
	'More to come'
end
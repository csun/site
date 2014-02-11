require 'sinatra'


# If script is run with --deploy, server will listen
# for all incoming connections
def network_setup
	set :port, 80
	if (ARGV[0] and ARGV[0] == '--deploy')
		set :bind, 0.0.0.0
	end
end

network_setup

get '/'  do
	'More to come'
end
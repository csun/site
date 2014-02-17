class RequestsCache
	def initialize(client)
		@client = client
		@cache = {}
	end

	def handle(request_type, response)
		if !response.empty?
			self.cache_data request_type, self.get_last_etag, response
		end

		self.get_cached_response request_type
	end

	def is_cached(request_type)
		return @cache[request_type] != nil
	end

	def cache_data(request_type, etag, response)
		@cache[request_type] = { etag: etag, response: response }
	end

	def get_last_etag
		@client.last_response.headers[:etag]
	end

	def get_cached_response(request_type)
		@cache[request_type][:response]
	end

	def get_etag(request_type)
		return nil if !self.is_cached request_type
		@cache[request_type][:etag]
	end

end
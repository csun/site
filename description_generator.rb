module DescriptionGenerator
	@DESCRIPTIONS_FILE = 'descriptions.txt'
	@all_descriptions = File.readlines(@DESCRIPTIONS_FILE)

	def self.random_description
		@all_descriptions.sample
	end
end
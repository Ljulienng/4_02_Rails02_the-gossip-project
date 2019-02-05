require 'faker'

FactoryBot.define do 
	factory :gossip do
		user_id { FactoryBot.create(:user).id }
		title { "Pikachu"}
		content { "test" }
	end
end
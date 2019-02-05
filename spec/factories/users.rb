require 'faker'

FactoryBot.define do 
	factory :user do 
		first_name { Faker::Lebowski.character }
		email { Faker::Internet.email}
		age { rand(13..45) }
		description { Faker::Lewboski.quote }
	end
end

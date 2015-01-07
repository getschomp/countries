require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Nicole#{n}" } # required
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    country_of_origin "USA" # optional
    gender "Female" # optional
    about "I love to travel. Travelling is great." # optional
    admin false
  end

  factory :review do
    food_rating 1
    nightlife_rating 2
    landmark_rating 3
    cost_rating 4
    weather_rating 5
    culture_rating 3
    sequence(:description) { |n| "#{n}the house with the place of the city." }
    user
    city
  end

  factory :city do
    sequence(:name) { |n| "Space Boston#{n}" }
    country

    factory :city_with_reviews do

      transient do
        reviews_count 5
      end

      after(:create) do |city, evaluator|
        create_list(:review, evaluator.reviews_count, city: city)
      end
    end
  end

  factory :country do
    sequence(:name) { |n| "Space Massachussettes#{n}" }

    factory :country_with_cities do

      transient do
        cities_count 5
      end

      after(:create) do |country, evaluator|
        create_list(:city, evaluator.cities_count, country: country)
      end
    end
  end



end

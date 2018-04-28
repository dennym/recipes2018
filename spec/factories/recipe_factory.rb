FactoryBot.define do

  factory :recipe do
    name "recipe"
    description "Tasty pizza"
    # published_at Time.now
    association :user
    image_url { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'test_images', 'beef.jpg'), 'image/jpeg') }
  end

end

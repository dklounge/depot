require 'factory_girl'

FactoryGirl.define do
  sequence :title do |n|
    "title#{n}"
  end

  factory :product do
    title
    description 'new product'
    price 8.99
    image_url 'some_image_url/image.jpg'
  end

  factory :invalid_product do
    title 'fixed'
    description 'fake product'
    price 8.99
    # no image_url
  end
end

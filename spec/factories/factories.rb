require 'factory_girl'

FactoryGirl.define do
  factory :product, class: Product do
    title 'new'
    description 'new product'
    price 8.99
    image_url 'some_image_url/image.jpg'
  end
end

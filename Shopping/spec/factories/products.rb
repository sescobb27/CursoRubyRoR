# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name 'FooBar Test'
    bar_code {"#{rand 10}"*3}
    price {rand 100}
  end
end

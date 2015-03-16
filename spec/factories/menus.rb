FactoryGirl.define do
  factory :menu do
    sequence(:nombre) { |n| "Menu #{n}" }
    fecha "2015-02-27"
  end

end

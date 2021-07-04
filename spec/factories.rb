FactoryGirl.define do

  factory :course do
    sequence(:name) {|n| "Name #{n}" }
  end

  factory :tutor do
    sequence(:name) {|n| "Tutor#{n}" }
  end

end

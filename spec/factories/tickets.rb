FactoryGirl.define do
  factory :ticket do
    subject "MyText"
    status 1
    client_id "MyString"
    technician_id "MyString"
  end
end

FactoryBot.define do
  factory :borrow_detail do
    request_date_from {"2019-11-19"}
    request_date_to {"2007-11-30"}
    return_back {false}
  end
end

FactoryBot.define do
  factory :error do
    uuid { "" }
    error_type { "MyString" }
    sender { "MyString" }
    message { "MyString" }
    published_at { "2016-09-05 16:16:16" }
    debug_data { "" }
  end
end

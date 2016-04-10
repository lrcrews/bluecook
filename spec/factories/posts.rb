FactoryGirl.define do
  
  factory :post do
    content "<b>Foo</b> is food, without the 'd', and <span>bar</span> is 'bar', which is good to drink"
    description "When you want some foo with your bar, and a bit more"
    title "Foo Bar and More"
  end

end

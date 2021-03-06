FactoryBot.define do
  factory :saved_article do
    abstract {'abstract'}
    authors {'by authors names'}
    photo {"https://static01.nyt.com/images/2019/06/12/arts/12thrones-3/12thrones-3-mediumThreeByTwo210-v3.jpg"}
    sequence(:title) {|n| "title_#{n}" }
    url {"www.url.com"}
  end
end

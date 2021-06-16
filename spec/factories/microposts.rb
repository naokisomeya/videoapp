FactoryBot.define do
  factory :micropost, class: Micropost do
    name { 'test_micropost' }
    content { 'test_content' }
    youtube_url { 'https://www.youtube.com/watch?v=bjmBJ1Fl0cs' }
    association :user
  end
end

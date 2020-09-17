FactoryBot.define do
  factory :video_game do
    title        { 'Cyberpunk 2077'                   }
    url          { 'https://www.cyberpunk.net/us/en/' }
    release_date { Time.new(2020, 11, 19)             }
  end
end

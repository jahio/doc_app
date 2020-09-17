require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Video Games' do
  header "Content-Type", "application/json"

  before :each do
    @game = create(:video_game)
  end

  get '/games' do
    example 'Get the list of video games' do
      do_request
      expect(status).to eq 200
      games = JSON.parse(response_body)['video_games']
      expect(games.include?(JSON.parse(@game.to_json))).to eq true
    end
  end

  post '/games' do
    with_options scope: :video_game, with_example: true do
      parameter :title, '(String) The name of the video game', required: true
      parameter :url,   '(String) A URL for the game website', required: true
      parameter :release_date, '(String/Date) When the game releases', required: true
    end

    let(:title)        { 'Assassin\'s Creed Valhalla' }
    let(:url)          { 'https://www.ubisoft.com/en-us/game/assassins-creed/valhalla' }
    let(:release_date) { Time.new(2020, 11, 10) }

    example 'Create a new video game' do
      expect {
        do_request
      }.to change { VideoGame.count }.by(1)
      expect(status).to eq 200
      game = JSON.parse(response_body)['video_game']
      expect(game['title']).to eq 'Assassin\'s Creed Valhalla'
    end
  end
end

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /albums' do
    xit 'should return the list of albums' do
      response = get('/albums')

      expected_response = 'Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover,
      Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, 
      Ring Ring'

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end

  context 'POST /' do
    xit 'should create a new album' do
    
    response = post('/albums', title: 'Voyage', release_year: '2022', artist_id: '2')
    all_albums = get('/albums')

    expect(response.status).to eq(200)
    expect(response.body).to eq('')
    expect(all_albums.body).to include('Voyage')
    end
  end

  context 'POST /artists' do
    it 'should create a new artist' do
      response = post('/artists', name:'Wild nothing')
      all_artists = get('/artists')

      expect(response.status).to eq(200)
      expect(response.body).to eq('')
      expect(all_artists.body).to include('Wild nothing')
    end
  end

  context 'GET /artists' do
    it 'should return the list of artists' do
      response = get('/artists')
      
      expected_response = 'Pixies, ABBA, Taylor Swift, Nina Simone'

      expect(response.status).to eq(200)
      expect(response.body).to eq (expected_response)
    end
  end

  

end

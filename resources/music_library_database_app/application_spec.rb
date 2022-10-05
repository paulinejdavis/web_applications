require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    xit 'returns a hello page if the password is correct' do

      response = get('/', password: 'abcd')

      expect(response.body).to include('Hello!')
    end

    xit 'returns a forbidden message if the password is incorrect' do

      response = get('/', password: 'defgh')

      expect(response.body).to include('Access Denied')
    end
  end

    xit 'returns an html list of names' do
      response = get('/')

      expect(response.body).to include('<p>Anna</p>')
      expect(response.body).to include('<p>Kim</p>')
      expect(response.body).to include('<p>Josh</p>')
      expect(response.body).to include('<p>David</p>')
    end
  
    xit 'returns the html message with the given name' do
      response = get('/', name: 'Bob')

      expect(response.body).to include
      ('<h1>Hello Bob!</h1>')
      #<img src="hello.jpg" />
      # expect(response.body).to include('<img src="hello.jpg"/>')
    end

    xit 'returns the html message with a new name' do
      response = get('/', name: 'Sockets')

    expect(response.body).to include('<h1>Hello Sockets!</h1>')
    #<img src="hello.jpg" />
    end
  
  
  context 'GET /albums/:id' do
    it 'should return info about album 1' do
      response = get('/albums/2')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Surfer Rosa</h1>')
      expect(response.body).to include('Release year: 1988')
      expect(response.body).to include('Artist: Pixies')
    end
  end


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
    xit 'should create a new artist' do
      response = post('/artists', name:'Wild nothing')
      all_artists = get('/artists')

      expect(response.status).to eq(200)
      expect(response.body).to eq('')
      expect(all_artists.body).to include('Wild nothing')
    end
  end

  context 'GET /artists/:id' do
    xit 'should return a given artist' do
      response = get('/artists/1')
      
      # expected_response = 'Pixies, ABBA, Taylor Swift, Nina Simone'

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Pixies</h1>')
      expect(response.body).to include('Genre: Rock')
    end
  end

  context 'GET /artists' do
    it 'should return a list of artists' do

      response = get('/artists')
      
      # expected_response = 'Pixies, ABBA, Taylor Swift, Nina Simone'

      expect(response.status).to eq(200)
      expect(response.body).to include('<a href=/artists/1><p>Pixies</p></a>')
      expect(response.body).to include('<p>Pixies</p>')
      expect(response.body).to include('<a href=/artists/2><p>ABBA</p></a>')
      expect(response.body).to include('<p>ABBA</p>')
      expect(response.body).to include('<a href=/artists/3><p>Taylor Swift</p></a>')
      expect(response.body).to include('<p>Taylor Swift</p>')
      # expect(response.body).to include('<a href=/artists/4><p>Nina Simone</p></a>')
      # expect(response.body).to include('<p>Nina Simone</p>')
    end
  end



  context 'GET /artists' do
    xit 'should return the list of artists' do
      response = get('/artists')
      
      expected_response = 'Pixies, ABBA, Taylor Swift, Nina Simone'

      expect(response.status).to eq(200)
      expect(response.body).to eq (expected_response)
    end
  end
end

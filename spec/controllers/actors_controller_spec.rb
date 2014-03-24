require 'spec_helper'




describe ActorsController do

  describe "GET 'index'" do 
    it "returns HTTP success" do
      get 'index'
      response.should be_success
    end
  end


    context 'when format is JSON' do
      it 'the index, gives back all actors' do
        Actor.create(name: "Bob", quote: "hi", bio: "I'm a famous actor!!!!")
        get 'index', format: 'json'
        actors = JSON.parse(response.body)
        expect(actors.count).to eq(1)
      end
  end


    
end
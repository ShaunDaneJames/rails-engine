require 'rails_helper'

describe 'merchant API' do
  it 'sends a list of merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'
    expect(response).to be_successful

    merchants = JSON.parse(response.body)
  end
end
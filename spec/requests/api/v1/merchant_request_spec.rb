require 'rails_helper'

describe 'merchant API' do
  it 'sends a list of merchants' do
    create_list(:merchant, 3)

    get api_v1_merchants_path

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].count).to eq(3)

    expect(merchants[:data][0][:attributes]).to have_key(:id)
    expect(merchants[:data][0][:attributes][:id]).to be_an(Integer)

    expect(merchants[:data][0][:attributes]).to have_key(:name)
    expect(merchants[:data][0][:attributes][:name]).to be_a(String)
  end
end

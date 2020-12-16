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

  it 'can show a merchant record' do
    merch_1 = create(:merchant)

    get api_v1_merchant_path(merch_1.id)

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data][:attributes]).to have_key(:id)
    expect(merchant[:data][:attributes][:id]).to eq(merch_1.id)

    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to eq(merch_1.name)
  end

  it 'can update a merchant record' do
    merch_1 = create(:merchant)

    new_name = "Jim's"
    put api_v1_merchant_path(merch_1.id), params: {name: new_name}

    merch_1.reload
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data][:attributes]).to have_key(:id)
    expect(merchant[:data][:attributes][:id]).to eq(merch_1.id)

    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to eq(new_name)
  end

  it 'can create a record' do
    post api_v1_merchants_path, params: {name: 'Link'}

    
  end

  it 'can delete a record' do
    merch_1 = create(:merchant)

    delete api_v1_merchant_path(merch_1.id)


  end
end

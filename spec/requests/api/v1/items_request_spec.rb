require 'rails_helper'

describe 'Item API' do
  it 'sends a list of items' do
    merch_1 = create(:merchant)
    item_1 = create(:item, merchant_id: merch_1.id)
    item_2 = create(:item, merchant_id: merch_1.id)

    get api_v1_items_path
    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].count).to eq(2)

    expect(items[:data][0][:attributes]).to have_key(:id)
    expect(items[:data][0][:attributes][:id]).to be_an(Integer)

    expect(items[:data][0][:attributes]).to have_key(:name)
    expect(items[:data][0][:attributes][:name]).to be_a(String)

    expect(items[:data][0][:attributes]).to have_key(:description)
    expect(items[:data][0][:attributes][:description]).to be_a(String)

    expect(items[:data][0][:attributes]).to have_key(:unit_price)
    expect(items[:data][0][:attributes][:unit_price]).to be_a(Float)

    expect(items[:data][0][:attributes]).to have_key(:merchant)
    expect(items[:data][0][:attributes][:merchant]).to be_a(Hash)
  end
end

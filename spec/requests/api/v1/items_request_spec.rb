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

    expect(items[:data][0][:attributes]).to have_key(:merchant_id)
    expect(items[:data][0][:attributes][:merchant_id]).to be_a(Integer)
  end

  it 'sends a particular item' do
    merch_1 = create(:merchant)
    item_1 = create(:item, merchant_id: merch_1.id)

    get api_v1_item_path(item_1)

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:data][:attributes][:id]).to eq(item_1.id)
    expect(item[:data][:attributes][:name]).to eq(item_1.name)
    expect(item[:data][:attributes][:description]).to eq(item_1.description)
    expect(item[:data][:attributes][:unit_price]).to eq(item_1.unit_price)
    expect(item[:data][:attributes][:merchant_id]).to eq(item_1.merchant_id)
  end

  it 'can update a particular item' do
    merch_1 = create(:merchant)
    item_1 = create(:item, merchant_id: merch_1.id)
    new_name = 'Shiny'
    new_description = 'Sparkles with glee'
    new_unit_price = 13.37
    put api_v1_item_path(item_1), params:{
      name: new_name,
      description: new_description,
      unit_price: new_unit_price
    }

    item_1.reload
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:data][:attributes][:id]).to eq(item_1.id)
    expect(item[:data][:attributes][:name]).to eq(item_1.name)
    expect(item[:data][:attributes][:description]).to eq(item_1.description)
    expect(item[:data][:attributes][:unit_price]).to eq(item_1.unit_price)
    expect(item[:data][:attributes][:merchant_id]).to eq(item_1.merchant_id)
  end
end

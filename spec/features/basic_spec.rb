require 'spec_helper'

describe 'app' do
  it 'has a home page' do
    visit '/'

    expect(body).to include 'Fixture objects'
  end

  it 'does something when you load a manifest' do
    visit '/'

    fill_in 'path', with: 'fixtures/bb018zb8894.json'
    click_button 'Preview'

    expect(body).to include 'George Stirling\'s heritage : a story of chequered love / by Graham Stark. author of "The laird and his friend"'
  end
end

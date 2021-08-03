require 'spec_helper'

describe 'app' do
  it 'has a home page' do
    visit '/'

    expect(body).to include 'Fixture manifests'
  end

  it 'does something when you load a manifest' do
    visit '/'

    fill_in 'url', with: 'https://iiif.io/api/cookbook/recipe/0009-book-1/manifest.json'
    click_button 'Preview'

    expect(body).to include 'Simple Manifest - Book'
  end
end

require 'spec_helper'

describe IiifManifest do
  subject(:manifest) { IiifManifest.new('https://iiif.io/api/cookbook/recipe/0009-book-1/manifest.json') }

  describe '#canvases' do
    it 'returns some canvas objects' do
      expect(manifest.canvases.length).to eq 5
    end
  end
end

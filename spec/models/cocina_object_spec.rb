require 'spec_helper'

describe CocinaObject do
  subject(:object) { CocinaObject.new(path) }

  let(:path) { 'fixtures/bb018zb8894.json' }

  describe '#path' do
    it 'returns the path' do
      expect(object.path).to eq(path)
    end
  end

  describe '#body' do
    it 'returns the body (JSON)' do
      expect { JSON.parse(object.body) }.not_to raise_error
    end
  end

  describe '#cocina' do
    it 'returns a valid Cocina object' do
      expect { Cocina::Models.build(object.cocina) }.not_to raise_error
    end
  end

  describe '#file_urls' do
    it 'returns an array of file URLs' do
      expect(object.file_urls.count).to eq(328)
    end
  end
end

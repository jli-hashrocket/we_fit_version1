require 'spec_helper'
require 'carrierwave/test/matchers'

describe PhotoUploader do
  include CarrierWave::Test::Matchers

  let(:uploader) do
    PhotoUploader.new(FactoryGirl.build(:user),
      :photo)
  end

  let(:path) do
    Rails.root.join('spec/file_fixtures/profile.png')
  end

  before do
    PhotoUploader.enable_processing = true
  end

  after do
    PhotoUploader.enable_processing = false
  end

  it 'stores without error' do
    expect(lambda { uploader.store!(File.open(path)) }).to_not raise_error
  end
end

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
    uploader.store!(File.open(path))
  end

  after do
    PhotoUploader.enable_processing = false
    uploader.remove!
  end

  it 'stores without error' do
    expect(lambda { uploader.store!(File.open(path)) }).to_not raise_error
  end

  context 'the thumb version' do
    it "should scale down the image to be 100x100 pixels" do
      uploader.thumb.should be_no_larger_than(100,100)
    end
  end

end

require 'spec_helper'

describe Favorite do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:favorited_id) }

  it { should have_valid(:user_id).when(1) }
  it { should_not have_valid(:user_id).when(nil) }

  it { should have_valid(:favorited_id).when(2) }
  it { should_not have_valid(:favorited_id).when(nil) }

  it { should belong_to(:user) }
  it { should belong_to(:favorited) }
end

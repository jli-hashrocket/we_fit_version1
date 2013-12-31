require 'spec_helper'

describe User do
  user = FactoryGirl.create(:user)
  it { should have_valid(:first_name).when(user.first_name) }
  it { should_not have_valid(:first_name).when(nil) }

  it { should have_valid(:last_name).when(user.last_name) }
  it { should_not have_valid(:last_name).when(nil) }

  it { should have_valid(:username).when(user.username) }
  it { should_not have_valid(:username).when(nil) }

  it { should have_many(:user_activities) }
  it { should have_many(:activities).through(:user_activities) }
end

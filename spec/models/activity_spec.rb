require 'spec_helper'

describe Activity do
  activity = FactoryGirl.create(:activity)
  it { should have_valid(:name).when(activity.name) }
  it { should_not have_valid(:name).when(nil)}

  it { should have_many(:user_activities) }
  it { should have_many(:users).through(:user_activities) }
end

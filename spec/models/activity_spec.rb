require 'spec_helper'

describe Activity do
  it { should have_valid(:name).when("Hangliding") }
  it { should_not have_valid(:name).when(nil)}

  it { should have_many(:user_activities) }
  it { should have_many(:users).through(:user_activities) }
end

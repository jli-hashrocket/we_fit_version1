require 'spec_helper'


describe Activity do
  it { should have_valid(:name).when("Weightlifting", "MMA", "Aerobics", "Running") }

  it { should have_many(:user_activities) }
  it { should have_many(:users).through(:user_activities) }
end

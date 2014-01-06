require 'spec_helper'

describe User do
  it { should have_valid(:first_name).when("Jeff") }
  it { should_not have_valid(:first_name).when(nil) }

  it { should have_valid(:last_name).when("Baker") }
  it { should_not have_valid(:last_name).when(nil) }

  it { should have_valid(:username).when("angrymoose") }
  it { should_not have_valid(:username).when(nil) }

  it { should have_valid(:gender).when("Female") }
  it { should_not have_valid(:gender).when(nil) }

  it { should have_many(:user_activities) }
  it { should have_many(:activities).through(:user_activities) }

end

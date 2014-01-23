require 'spec_helper'

describe UserActivity do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:activity) }

  it { should belong_to(:user) }
  it { should belong_to(:activity) }
end

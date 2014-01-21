require 'spec_helper'

describe Product do
  it { should belong_to(:seller) }
  it { should have_and_belong_to_many(:tags) }
  it { should have_and_belong_to_many(:sizes) }
  it { should have_and_belong_to_many(:colors) }
  it { should have_one(:price) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:count) }
  it { should validate_presence_of(:picture) }
  it { should validate_numericality_of(:count).only_integer }

end

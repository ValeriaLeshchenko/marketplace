require 'spec_helper'

describe Price do
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:currency) }
  it { should allow_value(0.02, 1234.45).for(:amount) }
  it { should_not allow_value('asdfjkl', '0.3').for(:amount) }
  it { should ensure_inclusion_of(:currency).in_array(%w(USD RUB EUR)) }

end

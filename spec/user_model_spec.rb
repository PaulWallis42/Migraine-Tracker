require 'rails_helper'

describe User do
  it { should have_many(:migraines) }

  it { should have_many(:foods) }
end

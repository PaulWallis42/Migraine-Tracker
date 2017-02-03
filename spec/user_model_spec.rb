require 'rails_helper'

describe Migraine do
  it { should belong_to(:user) }
end

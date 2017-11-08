require 'rails_helper'

RSpec.describe User, type: :model do
  # Associations
  it { should have_many(:cards) }

  # Validations
  it { should validate_presence_of(:email) }
end

require 'rails_helper'

RSpec.describe Card, type: :model do
  # Associations
  it {should belong_to(:user)}
  it {should belong_to(:occasion)}
  it {should have_many(:comments)}

  # Validations
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:price)}

end

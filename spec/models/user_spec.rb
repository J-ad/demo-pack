require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    expect(build(:user)).to be_valid
  end

  it "is NOT valid without required attributes" do
    expect(build(:user, name: nil)).not_to be_valid
    expect(build(:user, email: nil)).not_to be_valid
  end

  it "is NOT valid without incorrect attributes" do
    expect(build(:user, total_orders_pln: "nil")).not_to be_valid
    expect(build(:user, total_orders_eur: "nil")).not_to be_valid
    expect(build(:user, email: "wrong_format@")).not_to be_valid
  end
end

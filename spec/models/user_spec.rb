require 'rails_helper'

describe User, type: :model do
  describe 'Validatons' do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:role)}
  end
  describe 'roles' do
    it 'can be created as an admin' do
      user = User.create(username: 'Seth', password: 'password', role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end
  end
end

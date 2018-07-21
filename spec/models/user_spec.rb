require 'rails_helper'

describe User, type: :model do
  describe 'Validatons' do
    xit {should validate_presence_of(:first_name)}
    xit {should validate_presence_of(:last_name)}
    xit {should validate_presence_of(:username)}
    xit {should validate_uniqueness_of(:username)}
    xit {should validate_presence_of(:password)}
    xit {should validate_presence_of(:role)}
  end
  describe 'Relationships' do
    xit {should have_many(:orders)}
  end
  describe 'roles' do
    xit 'can be created as an admin' do
      user = User.create(username: 'Seth', password: 'password', role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end
    xit 'can be created as a default user' do
      user = User.create(username: 'Keegan', password: 'test123', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
  end
end

require 'rails_helper'

RSpec.describe Parents, type: :model do
  it 'should have a unique user' do
    user = User.create(email: 'foo@bar.com', password: 'secretfoo')
    first_parents = Parents.create(user: user)
    second_parents = Parents.create(user: user)

    expect(first_parents.valid?).to eq true
    expect(second_parents.valid?).to eq false
  end
end

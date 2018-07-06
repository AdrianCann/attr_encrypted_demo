require './user.rb'

RSpec.describe User do
  it 'saves an ssn and retrieves it' do
    user = User.new
    user.ssn = 'cat'
    user.save

    retrieved_user = User.load
    expect(retrieved_user.ssn).to eq('cat')
  end
end

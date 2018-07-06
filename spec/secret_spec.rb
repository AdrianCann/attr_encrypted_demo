require './secret.rb'

RSpec.describe Secret do
  it 'saves an message with a short password and retrieves it' do
    secret = Secret.new
    secret.password = 'password'
    secret.message = 'cat'
    secret.save

    retrieved_secret = Secret.load
    retrieved_secret.password = 'password'
    expect(retrieved_secret.message).to eq('cat')
  end

  it 'can use passwords that are longer than 32 characters' do
    secret = Secret.new
    secret.password = 'this_is_a_really_long_password_I_have_decided_to_use_for_this'
    secret.message = 'cat'
    secret.save

    retrieved_secret = Secret.load
    retrieved_secret.password = 'this_is_a_really_long_password_I_have_decided_to_use_for_this'
    expect(retrieved_secret.message).to eq('cat')
  end
end

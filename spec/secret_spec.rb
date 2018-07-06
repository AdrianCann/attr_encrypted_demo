require './secret.rb'

RSpec.describe Secret do
  it 'saves an ssn with a short password and retrieves it' do
    secret = Secret.new
    secret.password = 'password'
    secret.ssn = 'cat'
    secret.save

    retrieved_secret = Secret.load
    retrieved_secret.password = 'password'
    expect(retrieved_secret.ssn).to eq('cat')
  end

  it 'can use passwords that are longer than 32 characters' do
    secret = Secret.new
    secret.password = 'this_is_a_really_long_password_I_have_decided_to_use_for_this'
    secret.ssn = 'cat'
    secret.save

    retrieved_secret = Secret.load
    retrieved_secret.password = 'this_is_a_really_long_password_I_have_decided_to_use_for_this'
    expect(retrieved_secret.ssn).to eq('cat')
  end
end

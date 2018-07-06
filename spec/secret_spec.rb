require './secret.rb'

RSpec.describe Secret do
  let(:password) { 'a' * 32 }

  it 'saves an ssn and retrieves it' do
    secret = Secret.new
    secret.password = password
    secret.ssn = 'cat'
    secret.save

    retrieved_secret = Secret.load
    retrieved_secret.password = password
    expect(retrieved_secret.ssn).to eq('cat')
  end
end

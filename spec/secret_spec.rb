require './secret.rb'

RSpec.describe Secret do
  it 'saves an ssn and retrieves it' do
    secret = Secret.new
    secret.ssn = 'cat'
    secret.save

    retrieved_secret = Secret.load
    expect(retrieved_secret.ssn).to eq('cat')
  end
end

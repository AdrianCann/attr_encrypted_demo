require 'attr_encrypted'

class Secret
  extend AttrEncrypted
  attr_accessor :name
  attr_encrypted :ssn, key: 'This is a key that is 256 bits!!'

  def self.load
    self.new.tap do |secret|
      secret.encrypted_ssn = File.read('data/encrypted_ssn')
      secret.encrypted_ssn_iv = File.read('data/encrypted_ssn_iv')
    end
  end

  def save
    File.write('data/encrypted_ssn', encrypted_ssn)
    File.write('data/encrypted_ssn_iv', encrypted_ssn_iv)
  end
end

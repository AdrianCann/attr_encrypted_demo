require 'attr_encrypted'

class Secret
  extend AttrEncrypted
  attr_reader :password
  attr_encrypted :ssn, key: :password

  def self.load
    self.new.tap do |secret|
      secret.encrypted_ssn = File.read('data/encrypted_ssn')
      secret.encrypted_ssn_iv = File.read('data/encrypted_ssn_iv')
    end
  end

  def save
    raise "Requires Key" unless password
    File.write('data/encrypted_ssn', encrypted_ssn)
    File.write('data/encrypted_ssn_iv', encrypted_ssn_iv)
  end

  def password=(text)
    @password = correct_length(text)
  end

  def correct_length(text)
    if text.length < 32
      text * (1 + (32 / text.length))
    else
      text
    end[0,32]
  end
end

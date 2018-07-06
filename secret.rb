require 'attr_encrypted'

class Secret
  extend AttrEncrypted
  attr_reader :password
  attr_encrypted :message, key: :password

  def self.load
    self.new.tap do |secret|
      secret.encrypted_message = File.read('data/encrypted_message')
      secret.encrypted_message_iv = File.read('data/encrypted_message_iv')
    end
  end

  def save
    raise "Requires Key" unless password
    File.write('data/encrypted_message', encrypted_message)
    File.write('data/encrypted_message_iv', encrypted_message_iv)
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

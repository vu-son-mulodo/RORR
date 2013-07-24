class TBlowfish

  def self.createBf

	if @@blfish.nil?
	  @@blfish = TBlowfish.new
	end

  end

  def self.encrypt(data)
	return Base64.encode64(data).sub("\n","")
  end

  def self.decrypt(data)
	return Base64.decode64(data)
  end

  def initialize(key = nil)
	require "base64"
  end

end
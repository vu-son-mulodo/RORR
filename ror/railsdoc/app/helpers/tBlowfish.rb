class TBlowfish

  def self.createBf

	if @@blfish.nil?
	  @@blfish = TBlowfish.new
	end

  end

  def self.encrypt(data)
	#return Base64.encode64(data).sub("\n","")
	return Digest::MD5.hexdigest(data)
  end

  def self.decrypt(data)
	return nil
  end

end
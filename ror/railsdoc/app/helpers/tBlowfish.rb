class TBlowfish
  attr_accessor :key
  attr_accessor :blowfish
  @@blfish = nil

  def self.createBf

	if @@blfish.nil?
	  @@blfish = TBlowfish.new
	end

  end

  def self.encrypt(data)
	self.createBf
	data = @@blfish.encrypt(data)
	return data
  end

  def self.decrypt(data)
	self.createBf
	data = @@blfish.decrypt(data)
	return data
  end

  def initialize(key = nil)
	require 'rubygems'
	require 'crypt/blowfish'
	require "base64"

	unless key.nil?
	  @key = key
	else
	  @key = "abc123zx"
	end

	  #@blowfish = Crypt::Blowfish.new(@key)
  end

  def setKey(key)

	unless key.nil?
	  @key = key
	  #@blowfish = Crypt::Blowfish.new(key)
	end

  end

=begin
	splitencrypt convert data to array what there are every part as 8 byte
=end
  def splitencrypt(data)
	lengthkey =  data.length / 8;
	temp = 0
	array = Hash.new

	if data.length % 8 != 0
	  temp = data.length - (8 * lengthkey)
	  lengthkey += 1;
	end

	start = 0

	for i in 1..lengthkey
	  array[i-1] =  data.to_str.slice(start,8)
	  start +=8
	end

	if temp != 0

	  #add space for enought 8byte
	  for k in 0...(8-temp)
		array[i-1] << ["00"].pack('H*')
	  end

	end

	return array
  end

=begin
	splitdecrypt convert data to hex array what there are every part as 16 byte
=end
  def splitdecrypt(data)
	data = data.unpack("H*")
	lengthkey =  data[0].length / 16
	array = Hash.new
	start = 0

	for i in 1..lengthkey
	  array[i-1] =  data[0].to_str.slice(start,16)
	  start +=16
	end

	return array
  end

=begin
  encrypt data
=end
=begin
  def encrypt(data)
	array = splitencrypt(data)
	encryptedBlock = ''

	#Encrypt every parts in data
	for i in 0...array.length
	  encryptedBlock << blowfish.encrypt_block(array[i])
	end

	return Base64.encode64(encryptedBlock)
  end
=end
  def encrypt(data)
	return Base64.encode64(data)
  end

=begin
  decrypt data
=end
=begin
  def decrypt(data)
	data = Base64.decode64(data)
	array = splitdecrypt(data)
	decryptedBlock = ''

	#Decrypt every parts in data
	for i in 0...array.length
	  val = array[i]
	  decryptedBlock << blowfish.decrypt_block([val].pack('H*'))
	end

	return decryptedBlock.tr(["00"].pack('H*'), "")
  end
=end
  def decrypt(data)
	return Base64.decode64(data)
  end
end
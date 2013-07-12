module UsersHelper

 def actionLogin(username,password)
  @user = Users.checkLogin(username,password)
	if @user != false
	  session[:user_id] = @user.id
	  redirect_to "/users"
	else
	  @user = Users.new(:username => username)
	  @error = "Username or Password wrong"
	end
 end

 def actionLogout
  session[:user_id] = nil
  redirect_to "/top"
 end

class TBlowfish
  attr_accessor :key
  attr_accessor :blowfish
  @@blfish = nil

  def self.encrypt(data)
	if @@blfish == nil
	  @@blfish = TBlowfish.new
	end
	data = @@blfish.encrypt(data)
  end

  def initialize(key = nil)
	require 'crypt/blowfish'
	require "base64"
	if key != nil
	  @key = key
	else
	  @key = 'abc123zx'
	end
	  @blowfish = Crypt::Blowfish.new(@key)
  end

  def setKey(key)
	if key != nil
	  @key = key
	  @blowfish = Crypt::Blowfish.new(key)
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
	  for k in 0...(8-temp)
		array[i-1] << ["00"].pack('H*')
	  end
	end
	return array
  end

=begin
	splitdencrypt convert data to hex array what there are every part as 16 byte
=end
  def splitdencrypt(data)
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
  def encrypt(data)
	array = splitencrypt(data)
	encryptedBlock = ''
	for i in 0...array.length
	  encryptedBlock << blowfish.encrypt_block(array[i])
	end
	return Base64.encode64(encryptedBlock)
  end

=begin
  decrypt data
=end
  def decrypt(data)
	array = splitdencrypt(data)
	decryptedBlock = ''
	for i in 0...array.length
	  val = array[i]
	  decryptedBlock << blowfish.decrypt_block([val].pack('H*'))
	end
	return blowfish.decrypt(decryptedBlock)
  end
end

end

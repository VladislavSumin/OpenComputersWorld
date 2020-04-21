local data = {}

-- Computes CRC-32 hash of the data. Result is binary data.
function data.crc32(data)
	-- data:string

	-- return string 
end

-- Applies base64 decoding to the data.
function data.decode64(data)
	-- data:string

	-- return string 
end

-- Decrypt data with AES.
function data.decrypt(data, key, iv)
	-- data:string
	-- key:string
	-- iv:string

	-- return string 
end

-- Applies deflate compression to the data.
function data.deflate(data)
	-- data:string

	-- return string 
end

-- Restores key from its string representation.
function data.deserializeKey(data, type)
	-- data:string
	-- type:string

	-- return userdata 
end

-- Generates a shared key. ecdh(a.priv, b.pub) == ecdh(b.priv, a.pub)
function data.ecdh(priv, pub)
	-- priv:userdata
	-- pub:userdata

	-- return string 
end

-- Signs or verifies data.
function data.ecdsa(data, key, sig)
	-- data:string
	-- key:userdata
	-- sig:string

	-- return string or boolean 
end

-- Applies base64 encoding to the data.
function data.encode64(data)
	-- data:string

	-- return string 
end

-- Encrypt data with AES. Result is binary data.
function data.encrypt(data, key, iv)
	-- data:string
	-- key: string
	-- iv:string

	-- return string 
end

-- Generates key pair. Returns: public, private keys. Allowed key lengths: 256, 384 bits.
function data.generateKeyPair(bitLen)
	-- bitLen:number

	-- return userdata, userdata 
end

-- The maximum size of data that can be passed to other functions of the card.
function data.getLimit()

	-- return number 
end

-- Applies inflate decompression to the data.
function data.inflate(data)
	-- data:string

	-- return string 
end

-- Computes MD5 hash of the data. Result is binary data.
function data.md5(data, hmacKey)
	-- data:string
	-- hmacKey:string

	-- return string 
end

-- Generates secure random binary data.
function data.random(len)
	-- len:number

	-- return string 
end

-- Computes SHA2-256 hash of the data. Result is binary data.
function data.sha256(data, hmacKey)
	-- data:string
	-- hmacKey:string

	-- return string 
end

return data

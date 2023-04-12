class AuthService
    ALGORITHM = 'HS256'.freeze
  
    def self.encode(payload)
      JWT.encode(payload, auth_secret, ALGORITHM)
    end
  
    def self.decode(token)
      JWT.decode(token, auth_secret, true, algorithm: ALGORITHM)[0]
    rescue JWT::DecodeError
      nil
    end
  
    def self.auth_secret
      ENV['AUTH_SECRET']
    end
  end
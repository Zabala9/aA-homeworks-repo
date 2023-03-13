require 'securerandom'

class User < ApplicationRecord
    def ensure_session_token
        if :session_token == nil
            token = generate_unique_session_token
            :session_token = token
        else
            true
        end
    end

    validates :username, presence:true
    validates :session_token, presence:true

    def self.find_by_credentials(username, password)
        if username == :username
            return :username
        else
            return nil
        end
    end

    def is_password?(password)
        if password != :password_digest
            puts "The password is incorrect. Please, try again."
        else
            true
        end
    end

    def generate_unique_session_token
        SecureRandom.base64(16)
    end
end

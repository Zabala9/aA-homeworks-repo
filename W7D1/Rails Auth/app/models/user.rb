class User < ApplicationRecord
    def ensure_session_token
        if :session_token == nil
            generate_unique_session_token
        end
    end

    validates :username, presence:true
    validates :session_token, presence:true

    def self.find_by_credentials(username, password)

    end

    def is_password?(password)
        if password != :password_digest
            
        end
    end

    def generate_unique_session_token

    end
end

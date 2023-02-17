class Map
    def initialize
        @my_hash = {}
    end

    def set(key, value)
        if @my_hash.has_key?(key)
            answer = ""

            until answer == "Yes" || answer == "yes" || answer == "No" || answer == "no"
                puts "The #{key} is already in the map, do you want to change his value? ('Yes' or 'No')"
                puts "Please, enter a valid answer."
                answer = gets.chomp
                answer
            end

            if answer == "Yes" || answer == "yes"
                @my_hash[key] = value
                puts "The value was successfully changed"

            elsif answer == "No" || answer == "no"
                puts "The value wasn't changed"
            end
        else
            @my_hash[key] = value
        end
    end

    def get(key)
        return @my_hash[key]
    end

    def delete(key)
        @my_hash.delete(key)
    end

    def show
        return @my_hash
    end
end

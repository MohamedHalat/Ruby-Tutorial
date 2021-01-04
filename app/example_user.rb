class User
    attr_accessor :first_name, :last_name, :email

    def initialize(attribute = {})
        @first_name = attribute[:first_name]
        @last_name = attribute[:last_name]
        @email = attribute[:email]
    end

    def alphabetical_name
        "#{last_name}, #{first_name}"
    end


    def full_name
        "#{first_name} #{last_name}"
    end

    def formatted_email
        "#{full_name} #{@email}"
    end

end

# user = User.new(name: "Michael Hartl", email: "mhartl@example.com")
user = User.new(first_name: "Michael", last_name: "Hartl", email: "mhartl@example.com")
puts user.formatted_email
puts user.alphabetical_name
puts user.alphabetical_name.split(", ").reverse == user.full_name.split
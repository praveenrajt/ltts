class User < ApplicationRecord
    # Validations
    validates_presence_of :first_name, :last_name, :email
    validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
end

class User < ActiveRecord::Base
    validates :email,:name,:last_name,:identification,  presence: true
    validates :email, email:true
    validates :email, :identification, uniqueness: true
    validates :name, :last_name , :identification , length: { minimum: 2 , maximun: 20}
    has_many :tokens
    has_many :packages
    before_create :generate_credencials

    private 

    def generate_credencials
        begin
            self.api_key = SecureRandom.hex
            self.api_secret =  SecureRandom.hex(30)
        end while User.where(api_key: self.api_key, api_secret:self.api_secret ).any?  
    end
end

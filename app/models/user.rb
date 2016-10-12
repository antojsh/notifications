class User < ActiveRecord::Base
    USERTYPE = %w(admin client)
    before_validation :generate_credencials
    validates :email,:name,:last_name,:identification,:api_key, :api_secret,:user_type, presence: true
    validates :email, email:true
    validates :email, :identification, uniqueness: true
    validates :name, :last_name , :identification , length: { minimum: 3 , maximun: 20}
    validates :user_type, inclusion: { in: USERTYPE }
    has_many :tokens
    has_many :packages
    has_many :movements
    has_many :operations
    has_many :services, through: :operations
    


    # USERTYPE.each do |state|
    #     scope state, -> { where(user_type: state) }
    # end
    private 

    def generate_credencials
        self.user_type =USERTYPE[1]
        begin
            self.api_key = SecureRandom.hex
            self.api_secret =  SecureRandom.hex(30)
        end while User.where(api_key: self.api_key, api_secret:self.api_secret ).any?
        
    end
end

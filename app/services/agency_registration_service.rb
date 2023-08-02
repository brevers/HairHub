class AgencyRegistrationService
    attr_reader :agency, :user
  
    def initialize(user, agency)
      @user = user
      @agency = agency
    end
  
    def call
      prepare_attributes
      Agency.transaction do
        Agency.create!(agency.attributes)
      end
    end
  
    private
  
    def prepare_attributes
      agency.assign_attributes(
        name: create_agency_name,
        user: user
      )
    end
  
    def create_agency_name
      # Fill in some defaults arguments based on current user.
      # TODO: Make user name required! :)
      count = user.agencies.count + 1
      "#{user.name || user.email} #{count.ordinalize} agency"
    end
  end
  
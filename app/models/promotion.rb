class Promotion < ApplicationRecord
    validates :code, :ends_at, presence: true

    ##
    # Returns true is the promo is still valid
    def active?
        Time.now < ends_at
    end
  end
  
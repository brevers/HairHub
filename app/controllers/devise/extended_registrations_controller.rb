module Devise
    class ExtendedRegistrationsController < Devise::RegistrationsController
      def owner
        build_resource({role: :owner})
  
        render "devise/registrations/new"
      end
    end
  end
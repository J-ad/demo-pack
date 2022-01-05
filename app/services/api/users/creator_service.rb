module Api
  module Users
    class CreatorService
      def initialize(params)
        @params = params
      end

      def self.call(params)
        new(params).call
      end

      def call
        user = User.new(@params)

        if user.save
          user
        else
          raise ActiveRecord::RecordInvalid.new(user)
        end
      end
    end
  end
end

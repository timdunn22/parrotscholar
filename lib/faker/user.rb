module Faker
  class User < Base
    class << self
      def gender
        parse('user.gender')
      end
    end
  end
end

module UsersHelper

    def make_user_id
        o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
        user_id = (0...9).map { o[rand(o.length)] }.join
    end
end

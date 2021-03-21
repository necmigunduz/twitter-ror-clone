module UserHelper
    def suggested_followers
        return current_user.suggested_followers if current_user
        []
    end

    def opinions
        @opinions = current_user.opinions.ordered_by_most_recent
    end
end

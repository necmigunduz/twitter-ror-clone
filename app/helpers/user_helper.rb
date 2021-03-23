module UserHelper
    def suggested_followers
        return current_user.suggested_followers if current_user
        []
    end

    def by_followeds
        return current_user.by_followeds if current_user
        []
    end

    def opinions
        @opinions = current_user.opinions.ordered_by_most_recent
    end

    def display_photo_img(user)
        if user.photo.attached?
            image_tag user.display_photo, class: 'avatar rounded-circle'
        else
            image_tag 'default_profile_picture.png', class: 'avatar rounded-circle'
        end
    end

end

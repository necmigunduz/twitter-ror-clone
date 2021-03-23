module ApplicationHelper
    def counter
        content = ''
    
        if signed_in?
        content <<  "<div class='p-2 d-flex flex-column'>
              <span class='px-3 text-light'>#{ current_user.followeds.count }</span>
              <span>Followers</span>
          </div>
          <div class='p-2 d-flex flex-column'>
              <span class='px-3 text-light'>#{ current_user.followers.count } </span>
              <span>Following</span>
          </div>"
        end 
        content.html_safe
    end

    def links
        content = ''
        
        if signed_in?
        content << "<ul class='mt-5'>
            <li class='my-3 list_no_style'>
            <i class='fas fa-home text-white'></i>
            #{link_to 'Home', root_path, class:"fa-1x text-white my-5 font-weight-bold"}
            </li>
            <li class='my-3 list_no_style'>
            <i class='far fa-user text-white'></i>
            #{link_to 'Profile', user_path(current_user), class:"fa-1x my-5 text-white font-weight-bold"}
            </li>
        </ul>"
        else
        content << "<p class='text-white ml-3 mt-5'>'You are not signed in! To see the content, you need to sign in!'</p>"
        end
        content.html_safe
    end

    def create_opinion
        content = ''

        if !signed_in?
        content << "<div class='nav-item'>
        #{link_to fa_icon('sign-in-alt'), new_session_path, class:"fa-2x px-2 text-dark"}
        </div>"
        end

        content.html_safe
    end

    def nav_links
        content = ''

        if signed_in?
            content << "<div><small class='text-white font-weight-bold'>Create a new opinion</small></div>
            <div class='nav-item'>
                #{link_to fa_icon('pen-fancy'), user_path(current_user.id), class:"fa-2x px-2 text-light"}
            </div>
            <div class='nav-item'>
                #{link_to fa_icon('sign-out-alt'), session_path(current_user.id), method: :delete, data: { confirm: 'You are logging out!' }, class:"fa-2x px-2 text-dark" }
            </div>"
        end
        content.html_safe
    end

    def profile_photo
        content = ''
        if signed_in?
            content << "<div class='w-auto'>
                #{current_user.photo.attached? ? image_tag(current_user.photo, size:"50x50") : image_tag('default_profile_picture.png', size:"50x50")}
            </div>
            <div class='text-center ml-3 text-white font-weight-bold'>
                #{  current_user.fullname }
            </div>"
        end
        content.html_safe
    end



    def signup_link
        if !signed_in?
            link_to 'Sign up', new_user_path, class:'font-weight-bold border p-2 border-danger bg-dark text-white rounded'
        end
    end

end

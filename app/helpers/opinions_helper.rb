module OpinionsHelper
  def who_to_follows
    content = ''

    if signed_in?
      content << "<h6 class='d-flex text-center text-light font-weight-bold border p-2 bg-dark'>Who to follow</h6>"
      content << "<div class = 'd-flex col-3 right-bar pt-4 w-900 h-auto mw-100' >"
      suggested_followers.each do |u|
        content << "<div class='text-center'>
                    <div class='p-2'>
                    #{if u.photo.attached?
                        image_tag(u.photo,
                                  size: '50x50')
                      else
                        image_tag('default_profile_picture.png',
                                  size: '50x50')
                      end}
                    </div>
                    <div class=''>#{u.fullname} <small>(#{u.username} )</small></div>
                    #{button_to 'Follow', followings_path(followed_id: u.id), method: :post}"
      end
      content << "</div>
                </div>"
    end

    content.html_safe
  end

  def followed_by
    content = ''

    if signed_in?
      content << "<h6 class='text-center text-light font-weight-bold border p-1 bg-dark'>Followed by</h6>"
      by_followeds.each do |u|
        content << "<div class='py-1 d-flex'>
                    <div class='w-auto'>
                        #{if u.photo.attached?
                            image_tag(u.photo,
                                      size: '50x50')
                          else
                            image_tag('default_profile_picture.png',
                                      size: '50x50')
                          end}
                    </div>
                    <span class='mx-2 my-3'>#{u.fullname}</span>
                    <span class='my-3'>(#{u.username})</span>
                </div>"
      end
    end
    content.html_safe
  end
end

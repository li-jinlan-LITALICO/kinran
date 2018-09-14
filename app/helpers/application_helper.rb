module ApplicationHelper

  def gravatar_for(item, size: 350)
    gravatar_id = Digest::MD5::hexdigest(item.name.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: item.name, class: "gravatar")
  end

end

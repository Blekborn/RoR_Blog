module AuthorsHelper
  # def gravatar_for(author)
  #   gravatar_id = Digest::MD5.hexdigest(author.email.downcase)
  #   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  #   image_tag(gravatar_url, alt: author.first_name, class: 'gravatar', size: 30)
  # end
  def avatar_for(author, options = { size: 80})
    size = options[:size]
    if author.avatar?
      image_tag author.avatar.url(:thumb), width: size, height: size
    else
      image_tag 'guest-male.png', width: size, height: size
    end
  end
end



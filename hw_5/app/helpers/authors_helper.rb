module AuthorsHelper
  def gravatar_for(author)
    gravatar_id = Digest::MD5.hexdigest(author.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: author.first_name, class: 'gravatar', size: 30)
  end
end



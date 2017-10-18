module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    html = ''
    resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <p>#{msg}</p>
      EOF
    end
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end
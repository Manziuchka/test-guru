module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(type)
    if flash[type]
      content_tag :p, flash[type], class: "flash alert"
    end   
  end
end

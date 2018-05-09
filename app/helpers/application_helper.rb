module ApplicationHelper

  def format_key(key)
    key.to_s.split('_').map(&:capitalize).join(' ')
  end
end

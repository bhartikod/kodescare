# frozen_string_literal: false

module ApplicationHelper
  def get_active_class(type)
    request.path.remove('/').eql?(type) ? 'active' : ''
  end
end

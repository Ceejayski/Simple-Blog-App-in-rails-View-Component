# frozen_string_literal: true

class GroupTabPanelComponent < ViewComponent::Base
  def initialize(queries:, current_query:)
    @queries = queries
    @current_query = current_query
  end

end

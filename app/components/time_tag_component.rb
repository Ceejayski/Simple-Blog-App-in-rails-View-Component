# frozen_string_literal: true

class TimeTagComponent < ViewComponent::Base
  def initialize(time:, text: 'Last Updated ')
    @time = time
    @text = text
  end
end

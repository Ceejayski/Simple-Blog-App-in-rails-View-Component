# frozen_string_literal: true

class HotwireModalComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(title:, record:)
    @title = title
    @record = record
  end
end

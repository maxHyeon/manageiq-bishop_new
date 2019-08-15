module Manageiq
  module BishopNew
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end

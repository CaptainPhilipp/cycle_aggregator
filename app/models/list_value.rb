# frozen_string_literal: true

class ListValue < ApplicationRecord
  include HasManyParentsPolymorphic

  def self.where_parents(parents)
    WhereParentsQuery.new(self).call(parents)
  end
end

# frozen_string_literal: true

class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :description, :duration, :editable
  has_one :user

  def editable
    scope == object.user
  end
end

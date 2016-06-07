# frozen_string_literal: true
require 'active_support/all'
require 'active_record'
require 'activerecord-traits'

require 'recognizable/extension'
require 'recognizable/methods'
require 'recognizable/essay' if defined?(Essay)

module Recognizable
  class << self
    def guess_attribute_for_recognition(model)
      model.class.traits.attributes.first_where(
        string?:   true,  key?:              false,
        sti_type?: false, polymorphic_type?: false)
    end

    # TODO Move this to different gem
    def machine_generated_object_name?(s)
      s =~ /\A#<[A-Z_][a-zA-Z_0-9]+(::[A-Z_][a-zA-Z_0-9]+)*:0x[0-9abcdef]+>\Z/
    end
  end
end

ActiveRecord::Base.include(Recognizable::Extension)

# def model_human_name(model, preferred = :full)
#   name = preferred == :full ? model.try(:to_full_name) : nil
#   name = model.try(:to_short_name) if name.blank?
#   name = model.try(:to_s) if name.blank?
#   if machine_generated_object_name?(name)
#     name = "#{traits(model).class_name.humanize}#{" ##{model.id}" if model.id.present?}"
#   end
#   name
# end

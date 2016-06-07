# frozen_string_literal: true
module Recognizable
  module Extension
    extend ActiveSupport::Concern

    included do
      class_attribute :recognizable_options,      instance_accessor: false, instance_predicate: false
      class_attribute :attributes_marked_as_name, instance_accessor: false, instance_predicate: false
      self.recognizable_options      = {}
      self.attributes_marked_as_name = []
    end

    module ClassMethods
      def recognizable(by: :name, **options)
        unless ancestors.include?(Recognizable::Methods)
          include Recognizable::Methods
        end

        mark_as_name(by)

        options.merge!(by: by)
        self.recognizable_options = self.recognizable_options.merge(options)
      end

      def mark_as_name(*attr_names)
        self.attributes_marked_as_name += attr_names
      end
    end
  end
end

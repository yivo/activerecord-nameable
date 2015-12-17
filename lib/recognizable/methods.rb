module Recognizable
  module Methods
    extend ActiveSupport::Concern

    def to_name(format = :full)
      right = if by = self.class.recognizable_options[:by]
        send(by)
      else
        attr = Recognizable.guess_attribute_for_recognition(self)
        attr.value_from(self) if attr
      end

      case format
        when :short
          right || (persisted? ? "##{id}" : '')
        else
          left  = self.class.model_name.human
          right = right ? " «#{right}»" : ("##{id}" if persisted?)
          left + right
      end
    end

    def to_full_name
      to_name(:full)
    end

    def to_short_name
      to_name(:short)
    end
  end
end
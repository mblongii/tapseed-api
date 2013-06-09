module ValidateUrl
  extend ActiveSupport::Concern

  class UrlValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
      def valid?(value)
        uri = URI.parse(value)
        uri.kind_of?(URI::HTTPS)
      rescue URI::InvalidURIError
        record.errors[attribute] << (options[:message] || "is not a valid uri")
      end
    end
  end
end

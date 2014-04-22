class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value=~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      record.errors[attribute] << (options[:message] || I18n.t("warnings.wrong_email_address"))
    end
  end
end


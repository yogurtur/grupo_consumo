class PasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value=~ /(?=^.{8,}$)(?=.*\d+)(?=.*\W+).*/
      record.errors[attribute] << (options[:message] || I18n.t("warnings.wrong_password"))
    end
  end
end

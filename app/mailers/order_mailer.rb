class OrderMailer < ActionMailer::Base
  default from: "abels@domain.com"
  
  def order_created(order, user)
  @order = order
  mail subject: t("email.subject"), to: user.email
  end
end

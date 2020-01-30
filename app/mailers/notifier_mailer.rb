class NotifierMailer < ApplicationMailer
  default from: "weblog@example.com"

  def article_email
    @article = params[:article]
    @url = "http://localhost:3000"
    mail(to: "tuk@tuk.ru", subject: "#{ @article.title }")
  end
end

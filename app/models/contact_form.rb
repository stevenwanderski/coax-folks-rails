class ContactForm < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate: true

  def headers
    {
      subject: 'Coax & Folks Contact Form',
      to: ENV['CONTACT_FORM_TO'],
      from: 'Coax & Folks <coaxandfolks@gmail.com>'
    }
  end
end

class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    Email.create(body: @email.raw_body)
  end
end

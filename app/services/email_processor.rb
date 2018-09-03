class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process

    # email = Email.create(body: @email.raw_html, to: @email.to, from: @email.from)
    html_doc  = Nokogiri::HTML(@email.raw_html)
    html_doc.search('.m_7518718864441798498headline').each do |element|
      puts "-------------------------------------"
      p name = element.text
    end
  end
end


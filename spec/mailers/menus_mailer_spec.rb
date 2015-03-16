require "rails_helper"

RSpec.describe MenusMailer, type: :mailer do
  let(:envio) { Envio.new desde: '01-02-2015', hasta: '04-02-2015', email: 'maestra@escuelita.com' }
  let(:usuario) { FactoryGirl.create :usuario }

  before :each do
    platillo_1 = FactoryGirl.create :platillo, nombre: 'Platillo 1'
    platillo_2 = FactoryGirl.create :platillo, nombre: 'Platillo 2'
    platillo_3 = FactoryGirl.create :platillo, nombre: 'Platillo 3'

    FactoryGirl.create :menu, platillo_ids: [platillo_1.id], fecha: Date.parse('01-02-2015')
    FactoryGirl.create :menu, platillo_ids: [platillo_2.id], fecha: Date.parse('04-02-2015')
    FactoryGirl.create :menu, platillo_ids: [platillo_3.id], fecha: Date.parse('08-02-2015')
  end

  describe "enviar" do
    let(:mail) { MenusMailer.enviar(envio, usuario) }

    it "renders the headers" do
      expect(mail.subject).to eq("Envío de menús")
      expect(mail.to).to eq([envio.email])
      expect(mail.from).to eq([usuario.email])
      expect(mail.bcc).to eq([usuario.email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Platillo 1")
      expect(mail.body.encoded).to match("Platillo 2")
      expect(mail.body.encoded).not_to match("Platillo 3")
    end
  end

end

require 'sms'

describe SMS do

  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }

  let(:config)do
    {
      account_sid: '123',
      auth_token: '23fds',
      from: '+440123456789',
      to: '+44056781479',
      body: 'Thank you for your order, your delivery will be by %s'
    }
  end

  it 'sms sent with eta' do
    args = {
      from: config[:from],
      to: config[:to],
      body: 'Thank you for your order, your delivery will be by 13:15'
    }

    allow(Time).to receive(:now).and_return(Time.parse('12:15'))
    sms.deliver
    expect(messages).to have_received(:create).with(args)

  end

end

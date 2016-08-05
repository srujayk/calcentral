describe ClearingHouse::MyClearingHouseUrl do
  let (:uid) {'61889'}
  let (:real_model) {ClearingHouse::MyClearingHouseUrl.new(uid, fake: false)}
  let (:fake_model) {ClearingHouse::MyClearingHouseUrl.new(uid, fake: true)}
  let (:clearing_house_uri) { URI.parse(Settings.clearing_house_proxy.base_url) }

  context 'fake model' do
    subject { fake_model }
    it 'returns an empty feed' do
      response = subject.get_feed_internal
      expect(response).to eq ({})
    end
  end

  context 'real model', testext: true do
    subject { real_model }
    it 'should make a connection' do
      response = subject.get_feed_internal
      expect(response.code).to eq 200
    end
  end
end

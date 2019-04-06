class GetRequest
  include HTTParty

  def initialize(purchase)
    @purchase = purchase
  end

  def get
    url = "https://stag.wallet.tpaga.co/merchants/api/v1/payment_requests/#{@purchase.token}/info"
    auth = 'Basic bWluaWFwcC1nYXRvMjptaW5pYXBwbWEtMTIz'
    response = HTTParty.get(url, headers: {Authorization: auth, 'Cache-Control' => 'no-cache', 'Content-Type' => 'application/json'})
    p response.parsed_response
    response.parsed_response
  end
end
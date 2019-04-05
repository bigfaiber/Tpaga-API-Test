class GetRequest
  include HTTParty
  url = 'https://stag.wallet.tpaga.co/merchants/api/v1/payment_requests/pr-ecca779d312f3f312452251bf201918381f11b098bda1f5d97726879670ae6a25ff1f1d9/info'
  auth = 'Basic bWluaWFwcC1nYXRvMjptaW5pYXBwbWEtMTIz'
  response = HTTParty.get(url, headers: {Authorization: auth, 'Cache-Control' => 'no-cache', 'Content-Type' => 'application/json'})
  p response.parsed_response
  p 'hola hola'
end
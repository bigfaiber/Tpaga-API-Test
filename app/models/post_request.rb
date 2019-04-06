class PostRequest
  attr_accessor :purchase
  attr_accessor :purchaseUrl
  
    def initialize(purchase, purchaseUrl)
      @purchase = purchase
      @purchaseUrl = purchaseUrl
    end
  
    def post
      p @purchase
      p @purchaseUrl
      auth = 'Basic bWluaWFwcC1nYXRvMjptaW5pYXBwbWEtMTIz'
      url = 'https://stag.wallet.tpaga.co/merchants/api/v1/payment_requests/create'
  
      query = {"cost" => @purchase.cost.to_i,
      "purchase_details_url" => "https://tpagatest.herokuapp.com/purchases/#{@purchase.id}",
      "voucher_url" => "https://example.com/comprobante/",
      "idempotency_token" => @purchase.idempotency_token.to_s,
      "order_id" => @purchase.id.to_s,
      "terminal_id" => "poker1",
      "purchase_description" => "Compra en Tienda Poker",
      "purchase_items" =>[
          {
              "name":"Best Poker Course",
              "value":"10.000"
          },
  
      ],
      "user_ip_address" => @purchase.ip_address.to_s,
      "expires_at" => "2019-05-02T20:10:57.549653+00:00"#(Time.now+100000).utc.strftime('%Y-%m-%dT%l:%M:%S%:z')
      }
  
      response = HTTParty.post(url, query: query, headers: {Authorization: auth, 'Cache-Control' => 'no-cache', 'Content-Type' => 'application/json'})
      p response.parsed_response
      response.parsed_response
    end
  end
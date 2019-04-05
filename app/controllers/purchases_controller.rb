class PurchasesController < ApplicationController
  # require 'json'


  def new
    @price = 100000
    @purchase = Purchase.new
    response = GetRequest.new
    
  end

  def create
    @purchase = Purchase.create(purchase_params)
    @purchase.update(idempotency_token: Base64.encode64(@purchase.id.to_s), description: 'Purchase in poker academy', product: 'Best poker course', ip_address: request.remote_ip)
    req = PostRequest.new(@purchase).post
    @purchase.update(token: req['token'])
    @purchase.update(status: req['status'])
    @purchase.update(payment_url: req['tpaga_payment_url'])
    redirect_to @purchase.payment_url
    p @purchase


    # urlpost = 'https://stag.wallet.tpaga.co/merchants/api/v1/payment_requests/create'
    # auth = 'Basic bWluaWFwcC1nYXRvMjptaW5pYXBwbWEtMTIz'
    # resp2 = RestClient.post(urlpost, {"cost":"13390",
    #                               "purchase_details_url":"https://example.com/compra/348820",
    #                               "voucher_url":"https://example.com/comprobante/348820",
    #                               "idempotency_token":"1000",
    #                               "order_id":"845651",
    #                               "terminal_id":"poker1",
    #                               "purchase_description":"Compra en Tienda Poker",
    #                               "purchase_items":[
    #                                   {
    #                                       "name":"playing OOP",
    #                                       "value":"10.000"
    #                                   },

    #                               ],
    #                               "user_ip_address":"186.30.135.141",
    #                               "expires_at":"2019-05-02T20:10:57.549653+00:00"
    #                               }, headers = {Authorization: auth, 'Cache-Control' => 'no-cache', 'Content-Type' => 'application/json'})
                                  
    #                               result = JSON.parse(resp2.body)
    #                               p result['token']
  end


  private
  def purchase_params
      params.require(:purchase).permit(:description, :name, :email, :cost, :quantity, :status, :ip_address)
  end

end

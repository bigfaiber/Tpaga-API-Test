class PurchasesController < ApplicationController
  # require 'json'


  def new
    @price = 100000
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    @purchase.update(idempotency_token: Base64.encode64((@purchase.id*1000).to_s), description: 'Purchase in poker academy', product: 'Best poker course', ip_address: request.remote_ip)
    req = PostRequest.new(@purchase, purchase_path(@purchase.id)).post
    @purchase.update(token: req['token'])
    @purchase.update(status: req['status'])
    @purchase.update(payment_url: req['tpaga_payment_url'])
    redirect_to @purchase.payment_url
    p @purchase
  end

  def show
    @purchase = Purchase.find(params[:id])
    response = GetRequest.new(@purchase).get
    @purchase.update(status: response['status'])
  end
  
  def index
    @purchases = Purchase.all
  end
  
  private
  def purchase_params
      params.require(:purchase).permit(:description, :name, :email, :cost, :quantity, :status, :ip_address)
  end

end

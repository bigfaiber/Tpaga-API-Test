class PurchasesController < ApplicationController
  def new
    @price = 100000
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    @purchase.update(idempotency_token: Base64.encode64(@purchase.id.to_s), description: 'Purchase in poker academy', product: 'Best poker course', ip_address: request.remote_ip)
    
    redirect_to root_path
  end


  private
  def purchase_params
      params.require(:purchase).permit(:description, :name, :email, :cost, :quantity, :status, :ip_address)
  end

end

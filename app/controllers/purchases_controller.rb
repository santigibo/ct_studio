class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    @design = Design.find(params[:design_id])
    @purchase = Purchase.create({ user_id: @user.id, design_id: @design.id })
    @design.update(sold: true)
    redirect_to design_purchase_path(@design, @purchase)
  end

  def show
    @purchase = Purchase.find(params[:id])
    @design = @purchase.design
  end
end

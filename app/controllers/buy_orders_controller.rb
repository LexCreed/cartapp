class BuyOrdersController < ApplicationController
  before_action :set_buy_order, only: [:show, :edit, :update, :destroy]

  # GET /buy_orders
  # GET /buy_orders.json
  def index
    @buy_orders = BuyOrder.all
  end

  # GET /buy_orders/1
  # GET /buy_orders/1.json
  def show
    @quantyties=HasBuyOrder.where("buy_order_id = ?", params[:id])
    logger.debug @quantyties
  end

  # GET /buy_orders/new
  def new
    @buy_order = BuyOrder.new
  end

  # GET /buy_orders/1/edit
  def edit
  end

  # POST /buy_orders
  # POST /buy_orders.json
  def create
    @buy_order = BuyOrder.new(buy_order_params)

    respond_to do |format|
      if @buy_order.save
        format.html { redirect_to @buy_order, notice: 'Buy order was successfully created.' }
        format.json { render :show, status: :created, location: @buy_order }
      else
        format.html { render :new }
        format.json { render json: @buy_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buy_orders/1
  # PATCH/PUT /buy_orders/1.json
  def update
    logger.debug "Person attributes hash: #{@buy_order.id}"
    respond_to do |format|
      if @buy_order.update(buy_order_params)
        format.html { redirect_to @buy_order, notice: 'Buy order was successfully updated.' }
        format.json { render :show, status: :ok, location: @buy_order }
      else
        format.html { render :edit }
        format.json { render json: @buy_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buy_orders/1
  # DELETE /buy_orders/1.json
  def destroy
    @buy_order.destroy
    respond_to do |format|
      format.html { redirect_to buy_orders_url, notice: 'Buy order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy_order
      @buy_order = BuyOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_order_params
      params.require(:buy_order).permit(:name, :number_order, :date_delivery, :date_order, :payment)
    end
end

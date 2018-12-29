class CheckoutsController < ApplicationController
  def index
    @chart = Chart.find(1)
  end

  def create
    @chart = Chart.find(params[:chart_id].to_i)
    @chart.build_billing_address(billing_address_params).save
    token = @chart.create_token(billing_address_params.merge!({amount: @chart.total_amount, code: DateTime.now.strftime('%y%m%d%H%M%S%6N').to_s}))
    render json: {token: token}
  end

  def success
     @chart = Chart.find(1)
  end

  private
  def billing_address_params
    params.require(:billing_address).permit(:name, :address, :email, :phone_number, :card_number)
  end
end

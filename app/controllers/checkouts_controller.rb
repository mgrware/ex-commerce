class CheckoutsController < ApplicationController
  def index
    @chart = Chart.find(1)
  end

  def create
    @chart = Chart.find(params[:chart_id].to_i)
    if @chart.billing_address.present?
      @chart.billing_address.update_attributes(billing_address_params)
    else
      @chart.build_billing_address(billing_address_params).save
    end
    token = @chart.create_token(billing_address_params.merge!({amount: @chart.total_amount, code: DateTime.now.strftime('%y%m%d%H%M%S%6N').to_s}))
    redirect_to(result_checkouts_path(billing_id:@chart.billing_address.id))
  end

  def success
     @chart = Chart.find(1)
  end


  def result
    @billing_address = BillingAddress.find(params[:billing_id])
    @chart = @billing_address.chart
  end

  private
  def billing_address_params
    params.require(:billing_address).permit(:name, :address, :email, :phone_number, :card_number)
  end
end

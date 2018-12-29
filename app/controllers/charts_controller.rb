class ChartsController < ApplicationController
  def add
    @chart       = Chart.find(1) rescue nil
    @product     = Product.find(params[:product_id])
    if @chart.present?
      item                = @chart.items.new
      item.product_id     = @product.id
      item.amount         = @product.price
      item.save

      total_amount = @chart.items.select("sum(amount) as total").last.total
      @chart.total_amount = total_amount
      @chart.save
    else
      @chart = Chart.create({total_amount: @product.price})
      item                = @chart.items.new
      item.product_id     = @product.id
      item.amount         = @product.price
      item.save
    end
    redirect_to action: :index
  end

  def index
    @chart = Chart.find(1)
  end
end

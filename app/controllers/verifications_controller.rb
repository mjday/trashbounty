class VerificationsController < ApplicationController
  def show
    @bank = Bank.find(params[:bank_id])
    @verification = Verification.find(params[:id])

    @bank.plastics

    @collection = Collection.new(
      date: @verification.date,
      total_amount: @verification.total_amount,
      total_kg: @verification.total_kg,
      payment_type: @verification.payment_type
    )
  end

  def new
    @bank = Bank.find(params[:bank_id])
    @verification = Verification.new
    @bank.plastics
    @collected_plastics = @verification.collected_plastics.build
    @verification.btc_price
  end

  def create
    @bank = Bank.find(params[:bank_id])
    @bank.plastics
    @verification = Verification.new(verification_params)

    @verification.bank = @bank

    sum = 0.0
    kilo = 0
    params[:verification][:collected_plastics_attributes].each do |key, _i|
      plastic = Plastic.find_by(name: params[:verification][:collected_plastics_attributes][key][:plastic])
      price = plastic.price_per_kg * params[:verification][:collected_plastics_attributes][key][:kg_collected].to_i
      kilo += params[:verification][:collected_plastics_attributes][key][:kg_collected].to_i
      sum += price
    end

    @verification.total_amount = sum.round(2)
    @verification.total_kg = kilo

    @verification.payment_type
    @verification.btc_price

    if @verification.save
      redirect_to bank_verification_path(@bank, @verification)
    else
      render :new
    end
  end

  private

  def verification_params
    params.require(:verification).permit(:date, :total_kg, :total_amount, :payment_type)
  end
end





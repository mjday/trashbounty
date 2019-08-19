class VerificationsController < ApplicationController
  def show
    @bank = Bank.find(params[:bank_id])
    @verification = Verification.find(params[:id])

    @bank.plastics

    @collection = Collection.new(
      date: @verification.date,
      total_amount: @verification.total_amount,
      total_kg: @verification.total_kg,
      payment_type: @verification.payment_type)
  end

  def new
    @bank = Bank.find(params[:bank_id])
    @verification = Verification.new

    @bank.plastics
  end

  def create
    @bank = Bank.find(params[:bank_id])
    @bank.plastics

    @verification = Verification.new(verification_params)
    @verification.bank = @bank

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

class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @banks = Bank.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @banks = Bank.all
    end
  end

  def show
  end

  def new
    @bank = Bank.new
    @recyclables = ["ABS", "HDPE", "HIPS", "LDPE", "LLDPE", "PA", "PC", "PE", "PET", "PP", "PS", "PVC", "WastePlastic"]
  end

  def create
    @bank = Bank.new(bank_params)
    @bank.user_id = current_user.id

    if @bank.save
      redirect_to bank_path(@bank)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @bank.update(bank_params)
    redirect_to @bank
  end

  def destroy
    @bank.destroy
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name, :address)
  end

end

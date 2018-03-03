class PaymentsController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Payment.all
  end

  def show
    render json: Payment.find(params[:id])
  end

  def create
    loan = Loan.find(params[:loan_id].to_i)
    payment = loan.payments.new(amount: params[:amount])

    if payment.save
      render json: payment
    else
      render json: { error: payment.errors.full_messages }, status: :unprocessable_entity
    end
  end

end

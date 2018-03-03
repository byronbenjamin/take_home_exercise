class Payment < ActiveRecord::Base

  belongs_to :loan

  before_save :payment_date

  validate :payment_amount_cannot_exceed_loan_outstanding_balance

  # sets the date for a payment
  def payment_date
    payment_date = DateTime.now
  end

  # validation method that checks if the payment is less than the oustanding balance
  def payment_amount_cannot_exceed_loan_outstanding_balance
    if amount > loan.outstanding_balance
      errors.add(:amount, "cannot be greater than the loan's outstanding balance")
    end
  end

end

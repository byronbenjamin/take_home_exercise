class Loan < ActiveRecord::Base

  has_many :payments

  validates_associated :payments

  def outstanding_balance
    all_payments = payments.all
    sum_of_payments = all_payments.sum(&:amount)
    funded_amount - sum_of_payments
  end

end

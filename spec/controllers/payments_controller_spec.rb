require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do

  describe '#index' do
    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    loan = Loan.create!(funded_amount: 100.0)
    let(:payment) { loan.payments.create(amount: 10.0) }

    it 'responds with a 200' do
      get :show, params: { id: payment.id }
      expect(response).to have_http_status(:ok)
    end
  end

  context 'if the loan is not found' do
    it 'responds with a 404' do
      get :show, params: { id: 10000 }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#create' do
    loan = Loan.create!(funded_amount: 100.0)
    it 'responds with a 200' do
      post :create, params: { loan_id: loan.id, amount: 10.0 }
      expect(response).to have_http_status(:ok)
    end

    it 'responds with a 422 if amount exceeds outstanding balance' do
      post :create, params: { loan_id: loan.id, amount: 10000.0 }
      expect(response).to have_http_status(422)
    end

  end

end

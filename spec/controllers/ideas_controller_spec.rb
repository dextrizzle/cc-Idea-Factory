require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let(:idea) {FactoryGirl.create(:idea)}
  
  describe "New Action" do
    it 'assigns an instance variable' do
      get :new
      expect(assigns(:idea)).to be_a_new(Idea)
    end
    it 'renders the new template' do
      get :new
      expect(response).to redirect_to(user_session_path)
    end
  end

  describe "Create Action" do
    context 'with valid attributes' do
      def valid_request
        post :create, params: { idea: FactoryGirl.attributes_for(:idea) }
      end
      it 'creates a new idea in the db' do
        byebug
        count_before = Idea.count
        valid_request
        count_after = Idea.count
        expect(count_after).to eq(count_before+1)
      end
      it 'sets a flash message' do
        valid_request
        expect(flash[:notice]).to be
      end
      it 'redirects to the idea show page' do
        valid_request
        expect(response).to redirect_to(idea_path(Idea.last))
      end
    end
    context 'with invalid attributes' do
      def invalid_request
        post :create, params: { idea: FactoryGirl.attributes_for(:idea, title:nil) }
      end
      it 'sets a flash message' do
        invalid_request
        expect(flash[:alert]).to be
      end
      it 'renders the new template' do
        invalid_request
        expect(response).to render_template(:new)
      end
    end
  end
end

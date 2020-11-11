require 'rails_helper'
RSpec.describe LabReportsController, type: :controller do

  context 'GET #index' do
    it 'should succes and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
    it 'should array empty' do
      get :index
      expect(assigns(:lab_report)).to be_empty
    end
  end
  context 'GET #show' do
    let(:lab_report) { create(:lab_report) }
    it 'should success and render to edit page' do
      get :show, params: { id: lab_report.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
    it 'where have id' do
      get :show, params: { id: lab_report.id }
      expect(assigns(:lab_report)).to be_a(LabReport)
      expect(assigns(:lab_report)).to eq(lab_report)
    end
  end
  context 'GET #new' do
    it 'should succes and render to new page' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
    it 'should new post' do
      get :new
      expect(assigns(:lab_report)).to be_a(LabReport)
      expect(assigns(:lab_report)).to be_a_new(LabReport)
    end
end
  
  context 'Post #update' do
    let(:lab_report) { create(:lab_report) }
    it 'should update ppost' do
      params = { title: 'Update post' }
      put :update, params: { id: lab_report.id, lab_report: params }
      lab_report.reload
      expect(lab_report.title).to eq(params[:title])
    end
  end
end
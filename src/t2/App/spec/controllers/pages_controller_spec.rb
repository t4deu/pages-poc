require "rails_helper"

RSpec.describe PagesController, type: :controller do

  let(:page) { create(:page) }

  describe "GET #index" do
    before { get :index }

    it "renders index template" do
      is_expected.to render_template(:index)
    end

    it "assigns all pages as @pages" do
      expect(assigns(:pages)).to match_array([page])
    end
  end

  describe "GET #show" do
    before { get :show, id: page }

    it "renders show template" do
      is_expected.to render_template(:show)
    end

    it "assigns the requested page as @page" do
      expect(assigns(:page)).to eq(page)
    end
  end

  describe "GET #new" do
    before { get :new }

    it "renders new template" do
      is_expected.to render_template(:new)
    end

    it "assigns a new page as @page" do
      expect(assigns(:page)).to be_a_new(Page)
    end
  end

  describe "GET #edit" do
    before { get :edit, id: page }

    it "renders edit template" do
      is_expected.to render_template(:edit)
    end

    it "assigns the requested page as @page" do
      expect(assigns(:page)).to eq(page)
    end
  end

  describe "POST #create" do
    before do
      post :create, { :page => attributes }
    end

    context "with valid attributes" do
      let (:attributes) { build(:page).attributes }

      it "creates a new Page" do
        expect(Page.last.title).to eq(attributes["title"])
      end

      it "Redirects to the created page" do
        is_expected.to redirect_to Page.last
      end

      it "assigns a newly created page as @page" do
        expect(assigns(:page)).to be_a(Page)
        expect(assigns(:page)).to be_persisted
      end
    end

    context "with invalid attributes" do
      let (:attributes) { build(:page, title: "", author: "").attributes }

      it "assigns a newly created but unsaved page as @page" do
        expect(assigns(:page)).to be_a_new(Page)
      end

      it "re-renders the new template" do
        is_expected.to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    before do
      put :update, {:id => page, :page => new_attributes}
    end

    context "with valid params" do
      let(:new_attributes) { {author: "Chief editor"} }

      it "updates the requested page" do
        page.reload
        expect(page.author).to eq(new_attributes[:author])
      end

      it "assigns the requested page as @page" do
        expect(assigns(:page)).to eq(page)
      end

      it "redirects to the page" do
        is_expected.to redirect_to(page)
      end
    end

    context "with invalid params" do
      let(:new_attributes) { {author: ""} }

      it "assigns the page as @page" do
        expect(assigns(:page)).to eq(page)
      end

      it "re-renders the edit template" do
        is_expected.to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested page" do
      page = create :page

      expect {
        delete :destroy, {:id => page}
      }.to change(Page, :count).by(-1)
    end

    it "redirects to the pages list" do
      delete :destroy, {:id => page}
      is_expected.to redirect_to(pages_url)
    end
  end
end

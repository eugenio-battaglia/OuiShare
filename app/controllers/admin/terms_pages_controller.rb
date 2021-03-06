module Admin
  class TermsPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @terms_page = DefaultAttributes.new(@terms_page).set()
      if @terms_page.save
        redirect_to admin_terms_pages_path
      else
        redirect_to new_admin_language_terms_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_terms_pages_path }
    end

    def destroy
      destroy! { admin_terms_pages_path }
    end

    protected
    def permitted_params
      params.permit(terms_page: [:text])
    end

    def resource
      @terms_page ||= TermsPage.find(params[:id])
    end

    def build_resource
      @terms_page = Language.find(params[:language_id]).build_terms_page(permitted_params[:terms_page])
    end
  end
end

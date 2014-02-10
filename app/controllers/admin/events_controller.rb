module Admin
  class EventsController < BaseController
    inherit_resources
    belongs_to :language
    include AutoHtml
    skip_before_filter :verify_admin, only: [:show, :index]

    def index
    end

    def create
      create! { admin_events_path }
    end

    def update
      params[:event][:slug] = nil
      update! { admin_events_path }
    end

    def destroy
      destroy! { admin_events_path }
    end

    def show
      @event = Event.find(params[:id])

      if request.path != "/#{@current_language.slug}#{event_path(@event)}"
        redirect_to @event, status: :moved_permanently
        return
      end

      render 'admin/events/show'
    end

    protected
    def permitted_params
      params.permit(event: [:title,
                            :place,
                            :date_start,
                            :date_end,
                            :time,
                            :resume,
                            :image,
                            :info,
                            :join_us_text,
                            :service1_image,
                            :service1_link,
                            :service1_title,
                            :service2_image,
                            :service2_link,
                            :service2_title,
                            :service3_image,
                            :service3_link,
                            :service3_title,
                            :title1,
                            :text1,
                            :title2,
                            :text2,
                            :tag_list,
                            :visible,
                            :display_on_menu,
                            :slug,
                            :address,
                            :latitude,
                            :longitude,
                            :user_ids => []])
    end
  end
end

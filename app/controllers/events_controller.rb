class EventsController < ApplicationController
  # イベント一覧はみんながみれるようにするのでログイン状態をチェックしない
  before_action :authenticate, expect: :show

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'イベントを作成しました'
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :place, :content, :start_time, :end_time
    )
  end

end

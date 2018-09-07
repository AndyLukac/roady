class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notification, only: :read

  def read
    @notification.update(read: true)
    redirect_to journey_path(@notification.journey)
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end

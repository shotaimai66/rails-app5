class TutorsController < ApplicationController
  before_action :logged_in_user, only: :index
  before_action :tutor_or_parent, only: :index

  def index
    # @tutors = User.where(tutor: true).paginate(page: params[:page])
    @users = User.where(tutor: true).paginate(page: params[:page])
    # @users = User.paginate(page: params[:page])
  end
end

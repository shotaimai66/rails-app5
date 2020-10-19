class TutorsController < ApplicationController

  def index
    @tutors = User.where(tutor: true).paginate(page: params[:page])
    # @users = User.paginate(page: params[:page])
  end
end

class UsersController < ApplicationController
  before_action :set_user,only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index,:destroy, :edit_basic_info, :update_basic_info]
  before_action :tutor_or_parent, only: :show
  before_action :set_one_month, only: :show


  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    # tutorの表示用。
    # 予約申請があったらボタンを表示しそこに入る情報としてattendance達が入っている
    # 授業の予約申請を取得し@reservation_applicationsに入れる
    # @reservation_applications = @user.attendances.where(lesson_status_00: 2).or(@user.attendances.where(lesson_status_01: 2)).or(@user.attendances.where(lesson_status_02: 2)).or(@user.attendances.where(lesson_status_03: 2)).or(@user.attendances.where(lesson_status_04: 2)).or(@user.attendances.where(lesson_status_05: 2)).or(@user.attendances.where(lesson_status_06: 2)).or(@user.attendances.where(lesson_status_07: 2)).or(@user.attendances.where(lesson_status_08: 2)).or(@user.attendances.where(lesson_status_09: 2)).or(@user.attendances.where(lesson_status_10: 2)).or(@user.attendances.where(lesson_status_11: 2)).or(@user.attendances.where(lesson_status_12: 2)).or(@user.attendances.where(lesson_status_13: 2)).or(@user.attendances.where(lesson_status_14: 2)).or(@user.attendances.where(lesson_status_15: 2)).or(@user.attendances.where(lesson_status_16: 2)).or(@user.attendances.where(lesson_status_17: 2)).or(@user.attendances.where(lesson_status_18: 2)).or(@user.attendances.where(lesson_status_19: 2)).or(@user.attendances.where(lesson_status_20: 2)).or(@user.attendances.where(lesson_status_21: 2)).or(@user.attendances.where(lesson_status_22: 2)).or(@user.attendances.where(lesson_status_23: 2))
    reservation_applications = @user.attendances.where(lesson_status_00: 2).or(@user.attendances.where(lesson_status_01: 2)).or(@user.attendances.where(lesson_status_02: 2)).or(@user.attendances.where(lesson_status_03: 2)).or(@user.attendances.where(lesson_status_04: 2)).or(@user.attendances.where(lesson_status_05: 2)).or(@user.attendances.where(lesson_status_06: 2)).or(@user.attendances.where(lesson_status_07: 2)).or(@user.attendances.where(lesson_status_08: 2)).or(@user.attendances.where(lesson_status_09: 2)).or(@user.attendances.where(lesson_status_10: 2)).or(@user.attendances.where(lesson_status_11: 2)).or(@user.attendances.where(lesson_status_12: 2)).or(@user.attendances.where(lesson_status_13: 2)).or(@user.attendances.where(lesson_status_14: 2)).or(@user.attendances.where(lesson_status_15: 2)).or(@user.attendances.where(lesson_status_16: 2)).or(@user.attendances.where(lesson_status_17: 2)).or(@user.attendances.where(lesson_status_18: 2)).or(@user.attendances.where(lesson_status_19: 2)).or(@user.attendances.where(lesson_status_20: 2)).or(@user.attendances.where(lesson_status_21: 2)).or(@user.attendances.where(lesson_status_22: 2)).or(@user.attendances.where(lesson_status_23: 2))
    reservation_applications.each do |ra|
      if ra.worked_on >= Date.today
        if ra.lesson_status_00 == 2 && Time.current.hour >= 0
          ra.lesson_status_00 = 8
        end
        if ra.lesson_status_01 == 2 && Time.current.hour >= 1
          ra.lesson_status_01 = 8
        end
        if ra.lesson_status_02 == 2 && Time.current.hour >= 2
          ra.lesson_status_02 = 8
        end
        if ra.lesson_status_03 == 2 && Time.current.hour >= 3
          ra.lesson_status_03 = 8
        end
        if ra.lesson_status_04 == 2 && Time.current.hour >= 4
          ra.lesson_status_04 = 8
        end
        if ra.lesson_status_05 == 2 && Time.current.hour >= 5
          ra.lesson_status_05 = 8
        end
        if ra.lesson_status_06 == 2 && Time.current.hour >= 6
          ra.lesson_status_06 = 8
        end
        if ra.lesson_status_07 == 2 && Time.current.hour >= 7
          ra.lesson_status_07 = 8
        end
        if ra.lesson_status_08 == 2 && Time.current.hour >= 8
          ra.lesson_status_08 = 8
        end
        if ra.lesson_status_09 == 2 && Time.current.hour >= 9
          ra.lesson_status_09 = 8
        end
        if ra.lesson_status_10 == 2 && Time.current.hour >= 10
          ra.lesson_status_10 = 8
        end
        if ra.lesson_status_11 == 2 && Time.current.hour >= 11
          ra.lesson_status_11 = 8
        end
        if ra.lesson_status_12 == 2 && Time.current.hour >= 12
          ra.lesson_status_12 = 8
        end
        if ra.lesson_status_13 == 2 && Time.current.hour >= 13
          ra.lesson_status_13 = 8
        end
        if ra.lesson_status_14 == 2 && Time.current.hour >= 14
          ra.lesson_status_14 = 8
        end
        if ra.lesson_status_15 == 2 && Time.current.hour >= 15
          ra.lesson_status_15 = 8
        end
        if ra.lesson_status_16 == 2 && Time.current.hour >= 16
          ra.lesson_status_16 = 8
        end
        if ra.lesson_status_17 == 2 && Time.current.hour >= 17
          ra.lesson_status_17 = 8
        end
        if ra.lesson_status_18 == 2 && Time.current.hour >= 18
          ra.lesson_status_18 = 8
        end
        if ra.lesson_status_19 == 2 && Time.current.hour >= 19
          ra.lesson_status_19 = 8
        end
        if ra.lesson_status_20 == 2 && Time.current.hour >= 20
          ra.lesson_status_20 = 8
        end
        if ra.lesson_status_21 == 2 && Time.current.hour >= 21
          ra.lesson_status_21 = 8
        end
        if ra.lesson_status_22 == 2 && Time.current.hour >= 22
          ra.lesson_status_22 = 8
        end
        if ra.lesson_status_23 == 2 && Time.current.hour >= 23
          ra.lesson_status_23 = 8
        end
        ra.save
      end
      @reservation_applications = reservation_applications
    end

    # reservation_applications.each do |ra|
    #   if ra.worked_on >= Date.today 
    #     ra.
    #   end
    # end

    # current_userがparentだったらparentが予約申請した日のattendanceを@parent_rsv_attendancesに入れ、ステータスを確認できるようにする。
    # lesson_xx_parent_idにparentのidが入っていたら
    # nilの時はnilが入る
    # @parent_rsv_attendances = current_user.parent? || current_user == @user ? Attendance.where("(lesson_00_parent_id = ?) OR (lesson_01_parent_id = ?) OR (lesson_02_parent_id = ?) OR (lesson_03_parent_id = ?) OR (lesson_04_parent_id = ?) OR (lesson_05_parent_id = ?) OR (lesson_06_parent_id = ?) OR (lesson_07_parent_id = ?) OR (lesson_08_parent_id = ?) OR (lesson_09_parent_id = ?) OR (lesson_10_parent_id = ?) OR (lesson_11_parent_id = ?) OR (lesson_12_parent_id = ?) OR (lesson_13_parent_id = ?) OR (lesson_14_parent_id = ?) OR (lesson_15_parent_id = ?) OR (lesson_16_parent_id = ?) OR (lesson_17_parent_id = ?) OR (lesson_18_parent_id = ?) OR (lesson_19_parent_id = ?) OR (lesson_20_parent_id = ?) OR (lesson_21_parent_id = ?) OR (lesson_22_parent_id = ?) OR (lesson_23_parent_id = ?)", @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id).order(worked_on: "DESC") : nil
    parent_rsv_attendances = current_user.parent? || current_user == @user ? Attendance.where("(lesson_00_parent_id = ?) OR (lesson_01_parent_id = ?) OR (lesson_02_parent_id = ?) OR (lesson_03_parent_id = ?) OR (lesson_04_parent_id = ?) OR (lesson_05_parent_id = ?) OR (lesson_06_parent_id = ?) OR (lesson_07_parent_id = ?) OR (lesson_08_parent_id = ?) OR (lesson_09_parent_id = ?) OR (lesson_10_parent_id = ?) OR (lesson_11_parent_id = ?) OR (lesson_12_parent_id = ?) OR (lesson_13_parent_id = ?) OR (lesson_14_parent_id = ?) OR (lesson_15_parent_id = ?) OR (lesson_16_parent_id = ?) OR (lesson_17_parent_id = ?) OR (lesson_18_parent_id = ?) OR (lesson_19_parent_id = ?) OR (lesson_20_parent_id = ?) OR (lesson_21_parent_id = ?) OR (lesson_22_parent_id = ?) OR (lesson_23_parent_id = ?)", @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id, @user.id).order(worked_on: "DESC") : nil
    parent_rsv_attendances.each do |pra|
      # ステータス２のまま授業時間になったらタイムアウトステータス８を入れる
      if pra.worked_on >= Date.today 
        if pra.lesson_00_parent_id == current_user.id && Time.current.hour >= 0 && pra.lesson_status_00 == 2
          pra.lesson_status_00 = 8
        end
        if pra.lesson_01_parent_id == current_user.id && Time.current.hour >= 1 && pra.lesson_status_01 == 2
          pra.lesson_status_01 = 8
        end
        if pra.lesson_02_parent_id == current_user.id && Time.current.hour >= 2 && pra.lesson_status_02 == 2
          pra.lesson_status_02 = 8
        end
        if pra.lesson_03_parent_id == current_user.id && Time.current.hour >= 3 && pra.lesson_status_03 == 2
          pra.lesson_status_03 = 8
        end
        if pra.lesson_04_parent_id == current_user.id && Time.current.hour >= 4 && pra.lesson_status_04 == 2
          pra.lesson_status_04 = 8
        end
        if pra.lesson_05_parent_id == current_user.id && Time.current.hour >= 5 && pra.lesson_status_05 == 2
          pra.lesson_status_05 = 8
        end
        if pra.lesson_06_parent_id == current_user.id && Time.current.hour >= 6 && pra.lesson_status_06 == 2
          pra.lesson_status_06 = 8
        end
        if pra.lesson_07_parent_id == current_user.id && Time.current.hour >= 7 && pra.lesson_status_07 == 2
          pra.lesson_status_07 = 8
        end
        if pra.lesson_08_parent_id == current_user.id && Time.current.hour >= 8 && pra.lesson_status_08 == 2
          pra.lesson_status_08 = 8
        end
        if pra.lesson_09_parent_id == current_user.id && Time.current.hour >= 9 && pra.lesson_status_09 == 2
          pra.lesson_status_09 = 8
        end
        if pra.lesson_10_parent_id == current_user.id && Time.current.hour >= 10 && pra.lesson_status_10 == 2
          pra.lesson_status_10 = 8
        end
        if pra.lesson_11_parent_id == current_user.id && Time.current.hour >= 11 && pra.lesson_status_11 == 2
          pra.lesson_status_11 = 8
        end
        if pra.lesson_12_parent_id == current_user.id && Time.current.hour >= 12 && pra.lesson_status_12 == 2
          pra.lesson_status_12 = 8
        end
        if pra.lesson_13_parent_id == current_user.id && Time.current.hour >= 13 && pra.lesson_status_13 == 2
          pra.lesson_status_13 = 8
        end
        pra.save
      end
    end
    @parent_rsv_attendances = parent_rsv_attendances
  end
  
  def new
    @user = User.new
  end

  def tutor_new
    @user = User.new
  end

  def create
    @user = User.new(
      user_params
    )
    if @user.save
      log_in @user
      flash[:success] = '新規作成に��功しました。'
      redirect_to @user 
    else
      render :new
    end
  end
  
  def tutor_create
    @user = User.new(
      user_params
    )
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user 
    else
      render :new
    end
  end

  def edit
  end

#   :password_confirmation, :favorite_subject, :self_introduction, :image
  def update
    # if @user.update_attributes(user_params)
    @user.name = params[:user][:name]
    @user.department = params[:user][:department]
    @user.favorite_subject = params[:user][:favorite_subject]
    @user.email = params[:user][:email]
    @user.self_introduction = params[:user][:self_introduction]
    @user.password = params[:user][:password]
    if params[:user][:image]
      @user.image = "user_#{@user.id}.png"
      File.binwrite("public/user_images/#{@user.image}", params[:user][:image].read)
    end  
    if @user.save
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
       render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def edit_basic_info
  end
  
  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation, :favorite_subject, :self_introduction, :image, :tutor, :parent)
    end
     
    def basic_info_params
      params.require(:user).permit(:department, :basic_time, :work_time)
    end
end

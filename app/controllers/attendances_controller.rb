class AttendancesController < ApplicationController
  before_action :set_user, only: [:edit_one_month, :update_one_month]
  before_action :logged_in_user, only: [:update,:edit_one_month]
  before_action :set_one_month,only: :edit_one_month
  
  
  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください。"
  
  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    # 出勤時間が未登録であることを判定します。
    if @attendance.started_at.nil?
      if @attendance.update_attributes(started_at: Time.current.change(sec:0))
        flash[:info] = "おはようございます！"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    elsif @attendance.finished_at.nil?
      if @attendance.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れ様でした。"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    end
    redirect_to @user
  end

  def edit_one_month
  end

  def update_one_month
    ActiveRecord::Base.transaction do #トランザクションを開始します。
      attendances_params.each do |id, item|
        attendance = Attendance.find(id)
        attendance.update_attributes!(item)
      end
    end
    flash[:success] = "1ヶ月分の勤怠情報を更新しました。"
    redirect_to user_url(date: params[:date])
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
     flash[:danger] = "無効なデータ入力があった為、更新をキャンセルしました。"
     redirect_to attendances_edit_one_month_user_url(date:params[:date])
    
  end

  # tutorがattendanceを一日単位でアップデートする為の編集画面
  def edit_one_day
    @user = User.find(params[:id])
    # @day = Attendance.find_by(worked_on: params[:worked_on])
    # 三項演算子
    # もし指定の日のattendanceがなくてnilだったらnewしたものを、すでにあれば検索したものを、@dayに代入
    @attendance = Attendance.find_by(worked_on: params[:worked_on]).nil? ? @user.attendances.new(worked_on: params[:worked_on]) : Attendance.find_by(worked_on: params[:worked_on])
  end

  # tutorがattendanceを一日単位でアップデートする
  # 更新と新規作成を同時にやっているところに問題がある
  #attendance が未登録なら新規作成、すでにあるなら更新
  def update_one_day
    @user = User.find(params[:id])
    date_param = params[:user][:attendance][:worked_on]

    # @attendance = Attendance.find_by(user_id: @user.id, worked_on: params[:worked_on]).nil? ? @user.attendances.new(user_id: @user.id) : Attendance.find_by(user_id: @user.id, worked_on: "2020-09-21")
    @attendance = Attendance.find_by(user_id: @user.id, worked_on: date_param).nil? ? @user.attendances.new(worked_on: date_param) : Attendance.find_by(user_id: @user.id, worked_on: date_param)


    # user_idと日付でAttendanceを検索してnilだったらAttendanceをパラメーターを更新
    # if Attendance.find_by(user_id: @user.id, worked_on: date_param).nil?
      # date_param = params[:user][:attendance][:worked_on]
      # @attendance = @user.attendances.new
      @attendance.worked_on = date_param
      @attendance.lesson_status_00 = params[:user][:attendance][:lesson_status_00]
      @attendance.lesson_status_01 = params[:user][:attendance][:lesson_status_01]
      @attendance.lesson_status_02 = params[:user][:attendance][:lesson_status_02]
      @attendance.lesson_status_03 = params[:user][:attendance][:lesson_status_03]
      @attendance.lesson_status_04 = params[:user][:attendance][:lesson_status_04]
      @attendance.lesson_status_05 = params[:user][:attendance][:lesson_status_05]
      @attendance.lesson_status_06 = params[:user][:attendance][:lesson_status_06]
      @attendance.lesson_status_07 = params[:user][:attendance][:lesson_status_07]
      @attendance.lesson_status_08 = params[:user][:attendance][:lesson_status_08]
      @attendance.lesson_status_09 = params[:user][:attendance][:lesson_status_09]
      @attendance.lesson_status_10 = params[:user][:attendance][:lesson_status_10]
      @attendance.lesson_status_11 = params[:user][:attendance][:lesson_status_11]
      @attendance.lesson_status_12 = params[:user][:attendance][:lesson_status_12]
      @attendance.lesson_status_13 = params[:user][:attendance][:lesson_status_13]
      @attendance.lesson_status_14 = params[:user][:attendance][:lesson_status_14]
      @attendance.lesson_status_15 = params[:user][:attendance][:lesson_status_15]
      @attendance.lesson_status_16 = params[:user][:attendance][:lesson_status_16]
      @attendance.lesson_status_17 = params[:user][:attendance][:lesson_status_17]
      @attendance.lesson_status_18 = params[:user][:attendance][:lesson_status_18]
      @attendance.lesson_status_19 = params[:user][:attendance][:lesson_status_19]
      @attendance.lesson_status_20 = params[:user][:attendance][:lesson_status_20]
      @attendance.lesson_status_21 = params[:user][:attendance][:lesson_status_21]
      @attendance.lesson_status_22 = params[:user][:attendance][:lesson_status_22]
      @attendance.lesson_status_23 = params[:user][:attendance][:lesson_status_23]
      if @attendance.save
        flash[:success] = '授業可能時間を設定しました。'
        redirect_to @user 
      else
        flash[:danger] = '授業可能時間の設定に失敗しました。'
        redirect_to @user
      end
  end



  private
  # 1ヶ月分の勤怠情報を扱います
  def attendances_params
    params.require(:user).permit(attendances: [:started_at, :finished_at, :note, :worked_on, :user_id, :lesson_status_00, :lesson_status_01, :lesson_status_02, :lesson_status_03, :lesson_status_04, :lesson_status_05, :lesson_status_06, :lesson_status_07, :lesson_status_08, :lesson_status_09, :lesson_status_10, :lesson_status_11, :lesson_status_12, :lesson_status_13, :lesson_status_14, :lesson_status_15, :lesson_status_16, :lesson_status_17, :lesson_status_18, :lesson_status_19, :lesson_status_20, :lesson_status_21, :lesson_status_22, :lesson_status_023])[:attendances]
  end
  
  # beforeフィルター
  
  # 管理者権限、又は現在ログインしているユーザーを許可します。
  def admin_or_correct_user
    @user = User.find(params[:user_id]) if @user.blank?
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "編集権限がありません。"
      redirect_to(root_url)
    end
  end
  
end

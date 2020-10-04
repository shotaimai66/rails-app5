class AttendancesController < ApplicationController
  before_action :set_user, only: [:edit_one_month, :update_one_month, :check_reservation]
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
    @attendance = Attendance.find_by(worked_on: params[:worked_on], user_id: @user.id).nil? ? @user.attendances.new(worked_on: params[:worked_on]) : Attendance.find_by(worked_on: params[:worked_on], user_id: @user.id)
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

  # parentが授業の予約申請を行う編集画面
  def edit_reservation
    @user = User.find(params[:id])
    @attendance = Attendance.find_by(worked_on: params[:worked_on], user_id: @user.id)
    # @attendanceの0〜２３時までの値を配列attendance_lesson_statusesに入れ、＠attendance_lesson_statusesに代入
    attendance_lesson_statuses = []
    attendance_lesson_statuses.push(@attendance.lesson_status_00)
    attendance_lesson_statuses.push(@attendance.lesson_status_01)
    attendance_lesson_statuses.push(@attendance.lesson_status_02)
    attendance_lesson_statuses.push(@attendance.lesson_status_03)
    attendance_lesson_statuses.push(@attendance.lesson_status_04)
    attendance_lesson_statuses.push(@attendance.lesson_status_05)
    attendance_lesson_statuses.push(@attendance.lesson_status_06)
    attendance_lesson_statuses.push(@attendance.lesson_status_07)
    attendance_lesson_statuses.push(@attendance.lesson_status_08)
    attendance_lesson_statuses.push(@attendance.lesson_status_09)
    attendance_lesson_statuses.push(@attendance.lesson_status_10)
    attendance_lesson_statuses.push(@attendance.lesson_status_11)
    attendance_lesson_statuses.push(@attendance.lesson_status_12)
    attendance_lesson_statuses.push(@attendance.lesson_status_13)
    attendance_lesson_statuses.push(@attendance.lesson_status_14)
    attendance_lesson_statuses.push(@attendance.lesson_status_15)
    attendance_lesson_statuses.push(@attendance.lesson_status_16)
    attendance_lesson_statuses.push(@attendance.lesson_status_17)
    attendance_lesson_statuses.push(@attendance.lesson_status_18)
    attendance_lesson_statuses.push(@attendance.lesson_status_19)
    attendance_lesson_statuses.push(@attendance.lesson_status_20)
    attendance_lesson_statuses.push(@attendance.lesson_status_21)
    attendance_lesson_statuses.push(@attendance.lesson_status_22)
    attendance_lesson_statuses.push(@attendance.lesson_status_23)
    @attendance_lesson_statuses = attendance_lesson_statuses
  end

  # parentが授業の予約申請確認を行う画面
  def confirm_reservation
    @attendance = Attendance.find(params[:attendance_id])
    @user = User.find(params[:user_id])
    @lesson_status_time = params[:lesson_status_time]
    @parent = User.find(params[:parent_id])
  end

  # parentが授業の予約申請を行う保存処理
  def update_reservation
    @attendance = Attendance.find(params[:user][:attendance][:attendance_id])
    @user = User.find(@attendance.user_id)

    # param_lesson_status_timeにはindex iがStringで入っている
    param_lesson_status_time = params[:user][:attendance][:lesson_time]
    param_parent_id = params[:user][:attendance][:parent_id]
    if param_lesson_status_time == "0"
      @attendance.lesson_status_00 = 2      # ステータス２は申請中
      @attendance.lesson_00_parent_id = param_parent_id
    elsif param_lesson_status_time == "1"
      @attendance.lesson_status_01 = 2
      @attendance.lesson_01_parent_id = param_parent_id
    elsif param_lesson_status_time == "2"
      @attendance.lesson_status_02 = 2
      @attendance.lesson_02_parent_id = param_parent_id
    elsif param_lesson_status_time == "3"
      @attendance.lesson_status_03 = 2
      @attendance.lesson_03_parent_id = param_parent_id
    elsif param_lesson_status_time == "4"
      @attendance.lesson_status_04 = 2
      @attendance.lesson_04_parent_id = param_parent_id
    elsif param_lesson_status_time == "5"
      @attendance.lesson_status_05 = 2
      @attendance.lesson_05_parent_id = param_parent_id
    elsif param_lesson_status_time == "6"
      @attendance.lesson_status_06 = 2
      @attendance.lesson_06_parent_id = param_parent_id
    elsif param_lesson_status_time == "7"
      @attendance.lesson_status_07 = 2
      @attendance.lesson_07_parent_id = param_parent_id
    elsif param_lesson_status_time == "8"
      @attendance.lesson_status_08 = 2
      @attendance.lesson_08_parent_id = param_parent_id
    elsif param_lesson_status_time == "9"
      @attendance.lesson_status_09 = 2
      @attendance.lesson_09_parent_id = param_parent_id
    elsif param_lesson_status_time == "10"
      @attendance.lesson_status_10 = 2
      @attendance.lesson_10_parent_id = param_parent_id
    elsif param_lesson_status_time == "11"
      @attendance.lesson_status_11 = 2
      @attendance.lesson_11_parent_id = param_parent_id
    elsif param_lesson_status_time == "12"
      @attendance.lesson_status_12 = 2
      @attendance.lesson_12_parent_id = param_parent_id
    elsif param_lesson_status_time == "13"
      @attendance.lesson_status_13 = 2
      @attendance.lesson_13_parent_id = param_parent_id
    elsif param_lesson_status_time == "14"
      @attendance.lesson_status_14 = 2
      @attendance.lesson_14_parent_id = param_parent_id
    elsif param_lesson_status_time == "15"
      @attendance.lesson_status_15 = 2
      @attendance.lesson_15_parent_id = param_parent_id
    elsif param_lesson_status_time == "16"
      @attendance.lesson_status_16 = 2
      @attendance.lesson_16_parent_id = param_parent_id
    elsif param_lesson_status_time == "17"
      @attendance.lesson_status_17 = 2
      @attendance.lesson_17_parent_id = param_parent_id
    elsif param_lesson_status_time == "18"
      @attendance.lesson_status_18 = 2
      @attendance.lesson_18_parent_id = param_parent_id
    elsif param_lesson_status_time == "19"
      @attendance.lesson_status_19 = 2
      @attendance.lesson_19_parent_id = param_parent_id
    elsif param_lesson_status_time == "20"
      @attendance.lesson_status_20 = 2
      @attendance.lesson_20_parent_id = param_parent_id
    elsif param_lesson_status_time == "21"
      @attendance.lesson_status_21 = 2
      @attendance.lesson_21_parent_id = param_parent_id
    elsif param_lesson_status_time == "22"
      @attendance.lesson_status_22 = 2
      @attendance.lesson_22_parent_id = param_parent_id
    elsif param_lesson_status_time == "23"
      @attendance.lesson_status_23 = 2
      @attendance.lesson_23_parent_id = param_parent_id
    end
    
    if @attendance.save
      flash[:success] = "家庭教師　#{@user.name}さんの#{@attendance.worked_on}　#{param_lesson_status_time}時の授業の予約申請を送信しました。"
      redirect_to @user
    else
      flash[:danger] = "予約申請に失敗しました。"
      redirect_to @user
    end
  end
    
  # tutorが予約申請を承認・否認する編集モーダル
  def check_reservation
    # tutorへ授業申請されたattendanceインスタンスが複数が入っている
    @reservation_applications = @user.attendances.where(lesson_status_00: 2).or(@user.attendances.where(lesson_status_01: 2)).or(@user.attendances.where(lesson_status_02: 2)).or(@user.attendances.where(lesson_status_03: 2)).or(@user.attendances.where(lesson_status_04: 2)).or(@user.attendances.where(lesson_status_05: 2)).or(@user.attendances.where(lesson_status_06: 2)).or(@user.attendances.where(lesson_status_07: 2)).or(@user.attendances.where(lesson_status_08: 2)).or(@user.attendances.where(lesson_status_09: 2)).or(@user.attendances.where(lesson_status_10: 2)).or(@user.attendances.where(lesson_status_11: 2)).or(@user.attendances.where(lesson_status_12: 2)).or(@user.attendances.where(lesson_status_13: 2)).or(@user.attendances.where(lesson_status_14: 2)).or(@user.attendances.where(lesson_status_15: 2)).or(@user.attendances.where(lesson_status_16: 2)).or(@user.attendances.where(lesson_status_17: 2)).or(@user.attendances.where(lesson_status_18: 2)).or(@user.attendances.where(lesson_status_19: 2)).or(@user.attendances.where(lesson_status_20: 2)).or(@user.attendances.where(lesson_status_21: 2)).or(@user.attendances.where(lesson_status_22: 2)).or(@user.attendances.where(lesson_status_23: 2)).order(worked_on: "ASC") 
  end

  # tutorが予約申請の承認・否認を判断したものを保存する
  def decide_reservation
  end

  private
  # 1ヶ月分の勤怠情報を扱います
  def attendances_params
    params.require(:user).permit(attendances: [:attendance_id, :started_at, :finished_at, :note, :worked_on, :user_id, :lesson_status_00, :lesson_status_01, :lesson_status_02, :lesson_status_03, :lesson_status_04, :lesson_status_05, :lesson_status_06, :lesson_status_07, :lesson_status_08, :lesson_status_09, :lesson_status_10, :lesson_status_11, :lesson_status_12, :lesson_status_13, :lesson_status_14, :lesson_status_15, :lesson_status_16, :lesson_status_17, :lesson_status_18, :lesson_status_19, :lesson_status_20, :lesson_status_21, :lesson_status_22, :lesson_status_023])[:attendances]
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

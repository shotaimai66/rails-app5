class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  $days_of_the_week = %w{日 月 火 水 木 金 土}



  #　beforeフィルター
   
  # paramsハッシュからユーザーを取得します。
  def set_user
    @user = User.find(params[:id])
  end
    
  # ログイン済みのユーザーか確認します。
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
     end
  end
    
  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
    
   # システム管理権限者かどうか判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end



  # ページ出力前に1ヶ月分のデータの存在を確認・セットします。
  def set_one_month 
    @first_day = params[:date].nil? ? Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    one_month = [*@first_day..@last_day] # 対象の月の日数を代入します

    # 今月の１日は何曜日から始まる？  sun: 0, mon: 1, tue: 2, wed: 3, thu: 4, fri: 5,sat: 6   2：火曜日
    @day_of_the_week = @first_day.wday
    # @first_dayの前月１ヶ月分の日数を取得
    prev_month = @first_day.prev_month.all_month
    # @first_dayの翌月１ヶ月分の日数を取得
    next_month = @first_day.next_month.all_month

    # ユーザーに紐付く一ヶ月分のレコードを検索し取得します。
    # @attendances = @user.attendances.where(worked_on: @first_day..@last_day).order(:worked_on)
    
    # @first_day.all_weekは月曜日始まりなので日曜日をたす
    # 前月の日を求める　月曜始まりを日曜始まりへ変更 そして１ヶ月たす
    # 月初が日曜日だったらone_monthに前月の日数を入れる
    @day_of_the_week > 1 ? one_month = ( (@first_day.all_week.to_a.unshift(@first_day.all_week.to_a.slice(0).prev_day)).to_a.slice(0..(@day_of_the_week-1)) + one_month ) : one_month
    # @one_monthに来月の日にちをたす。
    @one_month_calendar = one_month.to_a + next_month.to_a.slice(0..(42 - one_month.count - 1))

    # URLのidからTutorを探し@userへ代入
    @user = User.find(params[:id])
    # tutorに紐付く１ヶ月分のattendances(授業可能時間が設定されたもがattendance)を取得。数はある分だけ取れる
    # ないときは[ ]が返ってくる
    @attendances = @user.attendances.where(worked_on: @first_day..@last_day)
  #   unless one_month.count == @attendances.count # それぞれの件数（日数）が一致するか評価します。
  #     ActiveRecord::Base.transaction do # トランザクションを開始します。
  #       # 繰り返し処理により、1ヶ月分の勤怠データを生成します。
  #       one_month.each { |day| @user.attendances.create!(worked_on: day) }
  #     end
  #     # @attendances = @user.attendances.where(worked_on: @first_day..@last_day).order(:worked_on)
      
  #     # 月曜日始まりなので日曜日をたす
  #     # 前月の日を求める　月曜始まりを日曜始まりへ変更 そして１ヶ月たす
  #     # 月初が日曜日だったらone_monthに前月の日数を入れる
  #     @day_of_the_week > 1 ? one_month = ( (@first_day.all_week.to_a.unshift(@first_day.all_week.to_a.slice(0).prev_day)).to_a.slice(0..(@day_of_the_week-1)) + one_month ) : one_month
  #     # @one_monthに来月の日にちをたす
  #     @attendances = one_month.to_a + next_month.to_a.slice(0..(42 - one_month.count - 1))

  #   end

  # rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
  #   flash[:danger] = "ページ情報の取得に失敗しました、再アクセスしてください。"
  #   redirect_to root_url
    
  end
end
module UsersHelper
  
  # 勤怠基本情報を指定のフォーマットで返します。
  def format_basic_info(time)
    format("%.2f", ((time.hour * 60) + time.min)/ 60.0)
  end
  
  # Attendanceモデルのオブジェクトを入れるとその日の授業の最初の時間と、終わりの時間を返します
  def first_and_last_lesson
    # ここに処理を書く
  end
end

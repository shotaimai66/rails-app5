module ApplicationHelper
  
  # ページごとにタイトルを返す
  def full_title(page_name = "")  # メソッドと引数の定義
    base_title = "AttendanceApp"  # 基本となるアプリケーション名を変数に代入
    if page_name.empty?  # 引数を受け取っているかを判断
      base_title         # 引数page_nameが空文字の場合はbase_titleのみ返す
    else  # 引数page_namが空文字ではない場合
      page_name + " | " + base_title  # 文字列を連結して返す
    end
  end
  
  # Attendanceモデルのオブジェクトを入れるとその日の授業の最初の時間と、終わりの時間時間を表示する文言を返します
  # 引き数はAttendanceモデル
  def first_and_last_lesson_time(user, attendance)
    lesson_time_array = []
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_01)
    lesson_time_array.push(attendance.lesson_status_02)
    lesson_time_array.push(attendance.lesson_status_03)
    lesson_time_array.push(attendance.lesson_status_04)
    lesson_time_array.push(attendance.lesson_status_05)
    lesson_time_array.push(attendance.lesson_status_06)
    lesson_time_array.push(attendance.lesson_status_07)
    lesson_time_array.push(attendance.lesson_status_08)
    lesson_time_array.push(attendance.lesson_status_09)
    lesson_time_array.push(attendance.lesson_status_10)
    lesson_time_array.push(attendance.lesson_status_11)
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_00)
    lesson_time_array.push(attendance.lesson_status_00)
    return "授業の設定あ-り"
  end
  
end

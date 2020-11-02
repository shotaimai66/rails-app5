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
  # 引き数は(Userオブジェクト, Attendanceオブジェクト)
  def first_and_last_lesson_time(user, attendance)
    lesson_time_array = []
    # もしattendanceが本日の日付だったら現在時刻以前はnilを入れる
    if attendance.worked_on == Date.today
      # lesson_time_array.push(attendance.lesson_status_00)
      Time.current.hour >= 0 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_00)
      Time.current.hour >= 1 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_01)
      Time.current.hour >= 2 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_02)
      Time.current.hour >= 3 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_03)
      Time.current.hour >= 4 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_04)
      Time.current.hour >= 5 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_05)
      Time.current.hour >= 6 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_06)
      Time.current.hour >= 7 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_07)
      Time.current.hour >= 8 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_08)
      Time.current.hour >= 9 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_09)
      Time.current.hour >= 10 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_10)
      Time.current.hour >= 11 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_11)
      Time.current.hour >= 12 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_12)
      Time.current.hour >= 13 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_13)
      Time.current.hour >= 14 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_14)
      Time.current.hour >= 15 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_15)
      Time.current.hour >= 16 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_16)
      Time.current.hour >= 17 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_17)
      Time.current.hour >= 18 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_18)
      Time.current.hour >= 19 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_19)
      Time.current.hour >= 20 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_20)
      Time.current.hour >= 21 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_21)
      Time.current.hour >= 22 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_22)
      Time.current.hour >= 23 ? lesson_time_array.push(nil) : lesson_time_array.push(attendance.lesson_status_23)
    # もしattendanceが本日でなければ通常通りステータスを入れる
    else
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
      lesson_time_array.push(attendance.lesson_status_12)
      lesson_time_array.push(attendance.lesson_status_13)
      lesson_time_array.push(attendance.lesson_status_14)
      lesson_time_array.push(attendance.lesson_status_15)
      lesson_time_array.push(attendance.lesson_status_16)
      lesson_time_array.push(attendance.lesson_status_17)
      lesson_time_array.push(attendance.lesson_status_18)
      lesson_time_array.push(attendance.lesson_status_19)
      lesson_time_array.push(attendance.lesson_status_20)
      lesson_time_array.push(attendance.lesson_status_21)
      lesson_time_array.push(attendance.lesson_status_22)
      lesson_time_array.push(attendance.lesson_status_23)
    end

    # ボタンに表示する授業可能時間の最初の時間をfirst_timeに入れる
    first_time = lesson_time_array.find_index { |n| n == 1 }

    # 授業可能時間のステータス（１）が０時から23時分まで配列に入っているのでreverseして、その日の最後の授業可能時間を求める
    lesson_time_array_reverse = lesson_time_array.reverse
    last_time = lesson_time_array_reverse.find_index { |n| n == 1 }

    if last_time == 0
      last_time = 23
    elsif last_time == 1
      last_time = 22
    elsif last_time == 2
      last_time = 21
    elsif last_time == 3
      last_time = 20
    elsif last_time == 4
      last_time = 19
    elsif last_time == 5
      last_time = 18
    elsif last_time == 6
      last_time = 17
    elsif last_time == 7
      last_time = 16
    elsif last_time == 8
      last_time = 15
    elsif last_time == 9
      last_time = 14
    elsif last_time == 10
      last_time = 13
    elsif last_time == 11
      last_time = 12
    elsif last_time == 12
      last_time = 11
    elsif last_time == 13
      last_time = 10
    elsif last_time == 14
      last_time = 9
    elsif last_time == 15
      last_time = 8
    elsif last_time == 16
      last_time = 7
    elsif last_time == 17
      last_time = 6
    elsif last_time == 18
      last_time = 5
    elsif last_time == 19
      last_time = 4
    elsif last_time == 20
      last_time = 3
    elsif last_time == 21
      last_time = 2
    elsif last_time == 22
      last_time = 1
    elsif last_time == 23
      last_time = 0
      # else
      #   どの値にも一致しない場合に行う処理
    end

    if first_time == nil && last_time == nil && current_user.tutor?
      return "現在予約可能な授業設定なし"
    elsif first_time == nil && last_time == nil
      return "Full"
    end

    return "#{first_time}:00〜#{last_time}:59"
  end
  
end

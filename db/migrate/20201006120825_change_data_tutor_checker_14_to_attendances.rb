class ChangeDataTutorChecker14ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_14, :string
  end
end

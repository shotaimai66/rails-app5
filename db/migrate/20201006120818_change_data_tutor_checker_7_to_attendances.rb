class ChangeDataTutorChecker7ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_7, :string
  end
end

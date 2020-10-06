class ChangeDataTutorChecker21ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_21, :string
  end
end

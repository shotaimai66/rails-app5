class ChangeDataTutorChecker1ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_1, :string
  end
end

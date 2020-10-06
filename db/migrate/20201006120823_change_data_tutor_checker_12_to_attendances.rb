class ChangeDataTutorChecker12ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_12, :string
  end
end

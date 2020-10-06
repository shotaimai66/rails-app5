class ChangeDataTutorChecker3ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_3, :string
  end
end

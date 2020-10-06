class ChangeDataTutorChecker6ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_6, :string
  end
end

class ChangeDataTutorChecker20ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_20, :string
  end
end

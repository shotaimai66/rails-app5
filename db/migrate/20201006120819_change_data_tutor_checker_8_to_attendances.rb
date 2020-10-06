class ChangeDataTutorChecker8ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_8, :string
  end
end

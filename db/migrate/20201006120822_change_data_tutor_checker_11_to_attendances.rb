class ChangeDataTutorChecker11ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_11, :string
  end
end

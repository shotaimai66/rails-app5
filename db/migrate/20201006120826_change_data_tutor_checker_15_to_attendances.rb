class ChangeDataTutorChecker15ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_15, :string
  end
end

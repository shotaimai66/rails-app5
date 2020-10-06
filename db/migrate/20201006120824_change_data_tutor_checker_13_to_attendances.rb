class ChangeDataTutorChecker13ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_13, :string
  end
end

class ChangeDataTutorChecker18ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_18, :string
  end
end

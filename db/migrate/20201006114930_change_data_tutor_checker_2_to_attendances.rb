class ChangeDataTutorChecker2ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_2, :string
  end
end

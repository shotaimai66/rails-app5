class ChangeDataTutorChecker23ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_23, :string
  end
end

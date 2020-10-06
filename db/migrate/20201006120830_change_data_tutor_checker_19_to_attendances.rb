class ChangeDataTutorChecker19ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_19, :string
  end
end

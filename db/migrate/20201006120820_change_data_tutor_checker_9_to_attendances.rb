class ChangeDataTutorChecker9ToAttendances < ActiveRecord::Migration[5.1]
  def change
        change_column :attendances, :tutor_checker_9, :string
  end
end

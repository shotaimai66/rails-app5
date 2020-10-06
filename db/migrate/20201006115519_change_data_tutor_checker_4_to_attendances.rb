class ChangeDataTutorChecker4ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_4, :string
  end
end

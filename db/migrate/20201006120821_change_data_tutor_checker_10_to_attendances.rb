class ChangeDataTutorChecker10ToAttendances < ActiveRecord::Migration[5.1]
  def change
  change_column :attendances, :tutor_checker_10, :string
  end
end

class ChangeDataTutorChecker0ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_0, :string
  end
end

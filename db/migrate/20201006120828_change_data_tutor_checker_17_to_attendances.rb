class ChangeDataTutorChecker17ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_17, :string
  end
end

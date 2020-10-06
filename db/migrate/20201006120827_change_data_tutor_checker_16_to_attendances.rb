class ChangeDataTutorChecker16ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_16, :string
  end
end

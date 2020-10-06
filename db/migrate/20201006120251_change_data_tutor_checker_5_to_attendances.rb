class ChangeDataTutorChecker5ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_5, :string
  end
end

class ChangeDataTutorChecker22ToAttendances < ActiveRecord::Migration[5.1]
  def change
    change_column :attendances, :tutor_checker_22, :string
  end
end

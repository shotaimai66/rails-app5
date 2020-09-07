class AddLessonStatusesAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :lesson_status_00, :integer, default: 0
    add_column :attendances, :lesson_status_01, :integer, default: 0
    add_column :attendances, :lesson_status_02, :integer, default: 0
    add_column :attendances, :lesson_status_03, :integer, default: 0
    add_column :attendances, :lesson_status_04, :integer, default: 0
    add_column :attendances, :lesson_status_05, :integer, default: 0
    add_column :attendances, :lesson_status_06, :integer, default: 0
    add_column :attendances, :lesson_status_07, :integer, default: 0
    add_column :attendances, :lesson_status_08, :integer, default: 0
    add_column :attendances, :lesson_status_09, :integer, default: 0
    add_column :attendances, :lesson_status_10, :integer, default: 0
    add_column :attendances, :lesson_status_11, :integer, default: 0
    add_column :attendances, :lesson_status_12, :integer, default: 0
    add_column :attendances, :lesson_status_13, :integer, default: 0
    add_column :attendances, :lesson_status_14, :integer, default: 0
    add_column :attendances, :lesson_status_15, :integer, default: 0
    add_column :attendances, :lesson_status_16, :integer, default: 0
    add_column :attendances, :lesson_status_17, :integer, default: 0
    add_column :attendances, :lesson_status_18, :integer, default: 0
    add_column :attendances, :lesson_status_19, :integer, default: 0
    add_column :attendances, :lesson_status_20, :integer, default: 0
    add_column :attendances, :lesson_status_21, :integer, default: 0
    add_column :attendances, :lesson_status_22, :integer, default: 0
    add_column :attendances, :lesson_status_23, :integer, default: 0
  end
end

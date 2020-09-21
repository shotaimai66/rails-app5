class AddLessonParentIdAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :lesson_00_parent_id, :integer
    add_column :attendances, :lesson_01_parent_id, :integer
    add_column :attendances, :lesson_02_parent_id, :integer
    add_column :attendances, :lesson_03_parent_id, :integer
    add_column :attendances, :lesson_04_parent_id, :integer
    add_column :attendances, :lesson_05_parent_id, :integer
    add_column :attendances, :lesson_06_parent_id, :integer
    add_column :attendances, :lesson_07_parent_id, :integer
    add_column :attendances, :lesson_08_parent_id, :integer
    add_column :attendances, :lesson_09_parent_id, :integer
    add_column :attendances, :lesson_10_parent_id, :integer
    add_column :attendances, :lesson_11_parent_id, :integer
    add_column :attendances, :lesson_12_parent_id, :integer
    add_column :attendances, :lesson_13_parent_id, :integer
    add_column :attendances, :lesson_14_parent_id, :integer
    add_column :attendances, :lesson_15_parent_id, :integer
    add_column :attendances, :lesson_16_parent_id, :integer
    add_column :attendances, :lesson_17_parent_id, :integer
    add_column :attendances, :lesson_18_parent_id, :integer
    add_column :attendances, :lesson_19_parent_id, :integer
    add_column :attendances, :lesson_20_parent_id, :integer
    add_column :attendances, :lesson_21_parent_id, :integer
    add_column :attendances, :lesson_22_parent_id, :integer
    add_column :attendances, :lesson_23_parent_id, :integer
  end
end

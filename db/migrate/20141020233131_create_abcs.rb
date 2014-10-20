class CreateAbcs < ActiveRecord::Migration
  def change
    create_table :abcs do |t|
      t.string :name

      t.timestamps
    end
  end
end

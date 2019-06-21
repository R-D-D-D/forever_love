class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :event, index: true
      t.timestamps
    end
  end
end

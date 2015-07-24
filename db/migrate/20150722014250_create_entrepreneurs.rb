class CreateEntrepreneurs < ActiveRecord::Migration
  def change
    create_table(:entrepreneurs) do |t|

        t.timestamps null: false
    end

  end
end

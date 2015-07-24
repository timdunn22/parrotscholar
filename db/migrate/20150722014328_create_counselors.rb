class CreateCounselors < ActiveRecord::Migration
  def change
    create_table(:counselors) do |t|

        t.timestamps null: false
    end

  end
end

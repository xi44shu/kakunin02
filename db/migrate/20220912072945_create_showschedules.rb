class CreateShowschedules < ActiveRecord::Migration[6.0]
  def change
    create_table :showschedules do |t|
      t.time :start_time            
      t.references :trading_company,              foreign_key: true
      t.references :public_utility,               foreign_key: true
      t.references :schedule,              null: false, foreign_key: true
      t.references :user,              null: false, foreign_key: true
      t.text :content      

      t.timestamps
    end
  end
end

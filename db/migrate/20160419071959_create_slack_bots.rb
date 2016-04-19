class CreateSlackBots < ActiveRecord::Migration
  def change
    create_table :slack_bots do |t|
      t.string :token

      t.timestamps null: false
    end
  end
end

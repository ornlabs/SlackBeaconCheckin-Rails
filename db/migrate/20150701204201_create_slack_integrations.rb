class CreateSlackIntegrations < ActiveRecord::Migration
  def change
    create_table :slack_integrations do |t|
      t.text :hook_url

      t.timestamps null: false
    end
  end
end

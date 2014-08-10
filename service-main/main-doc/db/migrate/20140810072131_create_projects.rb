class CreateProjects < ActiveRecord::Migration
  def change
    execute "create extension hstore"
    create_table :projects do |t|
      t.hstore :projects_docs

      t.timestamps
    end
  end
end

class ClaseEnUsuarioNull < ActiveRecord::Migration[6.0]
  def up
    change_column :usuario, :clase_id, :integer, null: true
  end
  def down
    change_column :usuario, :clase_id, :integer, null: false,
      default: 10128
  end
end

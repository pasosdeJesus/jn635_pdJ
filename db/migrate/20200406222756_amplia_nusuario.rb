class AmpliaNusuario < ActiveRecord::Migration[6.0]
  def up
    change_column :usuario, :nusuario, :string, limit: 1024
  end
  def down
    change_column :usuario, :nusuario, :string, limit: 15
  end
end

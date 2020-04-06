class UsuarioConUnGrupo < ActiveRecord::Migration[6.0]
  def change
    add_column :usuario, :grupo_id, :integer
    add_foreign_key :usuario, :sip_grupo, column: :grupo_id, null: false,
      default: 30
  end
end

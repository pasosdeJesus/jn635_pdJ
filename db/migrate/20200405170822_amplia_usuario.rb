class AmpliaUsuario < ActiveRecord::Migration[6.0]
  def change
    rename_column :usuario, :nombre, :nombres
    add_column :usuario, :apellidos, :string, limit: 128, 
      null: false, default: 'N'
    add_column :usuario, :departamento_id, :integer, null: false,
      default: 43
    add_column :usuario, :municipio_id, :integer, null: false,
      default: 480
    add_column :usuario, :clase_id, :integer, null: false, 
      default: 10128
    add_column :usuario, :barrio_vereda, :string, limit: 128
    add_column :usuario, :telefono, :string, limit: 128, null: false,
      default: 'N'
    add_column :usuario, :telefono_con_whatsapp, :boolean
    add_column :usuario, :web, :string, limit: 1024
    add_column :usuario, :facebook, :string, limit: 1024
    add_column :usuario, :twitter, :string, limit: 1024
    add_foreign_key :usuario, :sip_departamento, 
      column: :departamento_id
    add_foreign_key :usuario, :sip_municipio, 
      column: :municipio_id
    add_foreign_key :usuario, :sip_clase, 
      column: :clase_id
  end
end

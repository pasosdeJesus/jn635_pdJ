class Inigrupos < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO sip_grupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'PRODUCTOR', '', '2020-04-05', '2020-04-05', '2020-04-05', '2020-04-05');
      INSERT INTO sip_grupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'TRANSPORTADOR', '', '2020-04-05', '2020-04-05', '2020-04-05', '2020-04-05');
      INSERT INTO sip_grupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'COMPRADOR', '', '2020-04-05', '2020-04-05', '2020-04-05', '2020-04-05');
    SQL
  end

  def up
    execute <<-SQL
      DELETE FROM sip_grupo;
    SQL
  end
end

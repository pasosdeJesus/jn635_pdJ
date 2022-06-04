require 'mr519_gen/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Mr519Gen::Concerns::Models::Usuario

  devise :registerable, :confirmable
  campofecha_localizado :confirmed_at
  campofecha_localizado :locked_at


  belongs_to :clase, foreign_key: "clase_id", 
    validate: true, class_name: "Sip::Clase", optional: true

  belongs_to :departamento, foreign_key: "departamento_id", 
    validate: true, class_name: "Sip::Departamento", optional: true

  belongs_to :grupo, foreign_key: "grupo_id", 
    validate: true, class_name: "Sip::Grupo", optional: true

  belongs_to :municipio, foreign_key: "municipio_id", 
    validate: true, class_name: "Sip::Municipio", optional: true

  def email_required?
    true
  end

  validates :nombres, presence: true

  validates :apellidos, length: {maximum: 128}, presence: true

  validates :departamento_id, presence: true

  validates :municipio_id, presence: true

  validates :barrio_vereda, length: {maximum: 128}, presence: true

  validates :telefono, length: { maximum: 128 }, presence: true

  validates :web, length: {maximum: 1024}

  validates :facebook, length: {maximum: 1024}

  validates :twitter, length: {maximum: 1024}

  def presenta_nombre
    r = self.nusuario
    if self.nombres
      r += ' - ' + self.nombres
    end
    if self.apellidos
      r += ' ' + self.apellidos
    end
    r 
  end

  scope :filtro_departamento_id, lambda { |d|
    where(departamento_id: d)
  }

  scope :filtro_municipio_id, lambda { |m|
    where(municipio_id: m)
  }

  scope :filtro_clase_id, lambda { |m|
    where(clase_id: m)
  }

  scope :filtro_nombres, lambda { |n|
    where("unaccent(nombres) ILIKE '%' || unaccent(?) || '%'", n)
  }

  scope :filtro_apellidos, lambda { |a|
    where("unaccent(apellidos) ILIKE '%' || unaccent(?) || '%'", a)
  }

  scope :filtro_barrio_vereda, lambda { |b|
    where("unaccent(barrio_vereda) ILIKE '%' || unaccent(?) || '%'", 
          b)
  }

  scope :filtro_telefono, lambda { |t|
    where("unaccent(telefono) ILIKE '%' || unaccent(?) || '%'", 
          t)
  }

  scope :filtro_web, lambda { |w|
    where("unaccent(web) ILIKE '%' || unaccent(?) || '%'", 
          w)
  }

  scope :filtro_facebook, lambda { |f|
    where("unaccent(facebook) ILIKE '%' || unaccent(?) || '%'", f)
  }

  scope :filtro_twitter, lambda { |t|
    where("unaccent(twitter) ILIKE '%' || unaccent(?) || '%'", t)
  }


end


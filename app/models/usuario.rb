# encoding: UTF-8

require 'sip/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sip::Concerns::Models::Usuario

  devise :registerable, :confirmable
  campofecha_localizado :confirmed_at
  campofecha_localizado :locked_at


  belongs_to :clase, foreign_key: "clase_id", 
    validate: true, class_name: "Sip::Clase", optional: true
  belongs_to :departamento, foreign_key: "departamento_id", 
    validate: true, class_name: "Sip::Departamento"
  belongs_to :municipio, foreign_key: "municipio_id", 
    validate: true, class_name: "Sip::Municipio"

  def email_required?
    true
  end

  validates_presence_of :nombres

  validates_length_of :apellidos, maximum: 128
  validates_presence_of :apellidos

  validates_presence_of :departamento_id
  
  validates_presence_of :municipio_id

  validates_length_of :barrio_vereda, maximum: 128
  validates_presence_of :barrio_vereda

  validates_length_of :telefono, maximum: 128
  validates_presence_of :telefono

  validates_length_of :web, maximum: 1024

  validates_length_of :facebook, maximum: 1024

  validates_length_of :twitter, maximum: 1024

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


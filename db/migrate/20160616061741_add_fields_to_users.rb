class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birth_date, :date
    add_column :users, :assurance, :boolean
    add_column :users, :adress, :string
    add_column :users, :cellphone, :string
    add_column :users, :phone, :string
    add_column :users, :godfather_id, :integer
    add_column :users, :iniciacion, :date
    add_column :users, :father_name, :string
    add_column :users, :father_info, :string
    add_column :users, :father_adress, :string
    add_column :users, :father_mail, :string
    add_column :users, :mather_name, :string
    add_column :users, :mather_adress, :string
    add_column :users, :mather_mail, :string
    add_column :users, :estado_civil, :string
    add_column :users, :nombre_esposa, :string
    add_column :users, :taller_nombre, :string
    add_column :users, :taller_numero, :string
  end
end

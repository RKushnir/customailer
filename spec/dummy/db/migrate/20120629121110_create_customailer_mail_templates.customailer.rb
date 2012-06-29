# This migration comes from customailer (originally 20120629120356)
class CreateCustomailerMailTemplates < ActiveRecord::Migration
  def change
    create_table :customailer_mail_templates do |t|
      t.text :body
      t.string :path
      t.string :format
      t.string :locale
      t.string :handler
      t.boolean :partial, default: false

      t.timestamps
    end
  end
end

require_relative '../config'

# Create legislator table


class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|

      t.string     :first_name
      t.string     :last_name
      t.string     :title
      t.string     :state
      t.string     :phone
      t.string     :party
      t.string     :in_office
      t.string     :email
      t.string     :website
      t.string     :gender
      t.date       :birthday
      t.string     :twitter_id
      t.string     :fax
      t.timestamps  null: false

    end
  end
end


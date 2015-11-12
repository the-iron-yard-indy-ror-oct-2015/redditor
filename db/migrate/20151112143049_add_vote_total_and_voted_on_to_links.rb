class AddVoteTotalAndVotedOnToLinks < ActiveRecord::Migration
  def change
    add_column :links, :vote_total, :integer, :default => 0
    add_column :links, :voted, :boolean, :default => false
  end
end

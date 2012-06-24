class AddDocumentToReports < ActiveRecord::Migration
  def self.up
    add_attachment :reports, :document
  end

  def self.down
    remove_attachment :reports, :document
  end
end

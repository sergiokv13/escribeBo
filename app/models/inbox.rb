class Inbox < ActiveRecord::Base
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'

  validates :subject, :content, :user2_id, presence: true
  validates :subject, :content, length: { minimum: 4 }
  validates :subject, length: { maximum: 50 }
  validates :user2_id, :presence => true

  has_attached_file :inbox_att
  validates_attachment_content_type :inbox_att, :content_type => ["application/zip"]

  def hide
    self.inbox_hidden = true
    self.save
  end

  def visto
    if self.seen?
      "Si"
    else
      "No"
    end

  end

end

class Document < ActiveRecord::Base
	serialize :creator_data
	has_paper_trail
  belongs_to :owner, polymorphic: true
	has_attached_file :paper, styles: {thumb: ["100x100#", :jpg]}
	validates_attachment :paper, content_type: { content_type: ['application/pdf', 'image/jpeg', 'image/tiff', 'image/bmp', 'image/png' ]}
  validates :paper, attachment_presence: true
end

class Document < ActiveRecord::Base
	serialize :creator_data
	has_paper_trail
  belongs_to :owner, polymorphic: true
	#has_attached_file :paper, styles: {thumb: { geometry: "200x", format: :png, animated: false }}
	#validates_attachment :paper, content_type: { content_type: ['application/pdf', 'image/jpeg', 'image/tiff', 'image/bmp', 'image/png' ]}
  #validates :paper, attachment_presence: true
  
  has_attached_file :paper, path: ":rails_root/storage/:class/:attachment/:id_partition/:style/:filename", 
  default_url: ":rails_root/storage/:class/:attachment/:id_partition/:style/:filename", styles: {thumb: { geometry: "200x", format: :png, animated: false }}
  validates_attachment :paper, content_type: { content_type: ['application/pdf', 'image/jpeg', 'image/tiff', 'image/bmp', 'image/png' ]}
  validates :paper, attachment_presence: true
  #validates_attachment_content_type :paper, :content_type => /(pdf)/ 


  def extract_images(size="100x")
    Docsplit.extract_images(paper.path, :format => :png, :output => File.dirname(paper.path))
    update_column(:page_number, Docsplit.extract_length(paper.path))
    true
  end
  
  def page_path(number)
    dirname=File.dirname(paper.path)
    extname=File.extname(paper_file_name)
    basename=File.basename(paper_file_name,extname)
    File.join(dirname,"#{basename}_#{number}.png")
  end
  
  
  after_save :extract_images
end

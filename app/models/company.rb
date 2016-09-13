class Company < ActiveRecord::Base
  audited

  before_create :generate_identifier
  before_validation :format_fields

  has_attached_file :contract, default_url: nil

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '100x100#',
    medium: '300x300>'
  }

  validates_presence_of :name, :email, :phone, :document
  validates_uniqueness_of :document, :identifier

  validates :contract, attachment_presence: true, on: :create
  validates_attachment :contract, content_type: { content_type: "application/pdf" }

 # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def generate_identifier
    self.identifier = 6.times.map { rand(9) }.join
    generate_identifier if Company.exists?(identifier: self.identifier)
  end
end

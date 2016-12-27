# frozen_string_literal: true
# A nursery is one part in the registration process. It is the place, where the
# parents want to register their child.
class Nursery < ApplicationRecord
  include ActiveSupport::Inflector

  cattr_accessor :markdown
  Nursery.markdown = Redcarpet::Markdown.new(
    Redcarpet::Render::HTML.new(escape_html: true, hard_wrap: true)
  )

  after_initialize :ensure_url_name

  composed_of :address, mapping: [%w(address_street street),
                                  %w(address_zip zip),
                                  %w(address_city city)]

  validates :name, presence: true
  validates :url_name, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :mail, presence: true
  validates_associated :address

  def to_param
    url_name
  end

  # Starts a registration of the given children at this nursery.
  def first_request(children)
    Registration.create(nursery: self, children: children)
  end

  def education_concept_as_html
    markdown.render(education_concept)
  end

  private

  def ensure_url_name
    self.url_name ||= parameterize(name) if name
  end
end

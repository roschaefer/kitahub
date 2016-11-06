# A nursery is one part in the registration process. It is the place, where the
# parents want to register their child.
class Nursery < ApplicationRecord
  include ActiveSupport::Inflector

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

  def first_request(children)
    raise 'Only children of the same parents allowed' unless
      Child.same_parents? children

    registrations = children.map do |child|
      Registration.create(nursery: self, child: child)
    end

    NurseryMailer.first_request(registrations).deliver_now
    registrations
  end

  def education_concept_as_html
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(education_concept)
  end

  private

  def ensure_url_name
    self.url_name ||= parameterize(name) if name
  end
end

class Nursery < ApplicationRecord
  composed_of :address, mapping: [ %w(address_street street), %w(address_zip zip), %w(address_city city) ]
end

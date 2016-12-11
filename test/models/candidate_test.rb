require 'test_helper'

# Tests for candidate aggregate
class CandidateTest < ActiveSupport::TestCase
  test 'registration has candidates' do
    registration = registrations(:mustermann_spatzennest)
    assert_equal 2, registration.candidates.size
    assert_equal 2, registration.children.size
  end
end

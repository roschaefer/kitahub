require 'test_helper'

# Test for nursery entity.
class NurseryTest < ActiveSupport::TestCase
  test 'validation of address' do
    nursery = nurseries(:kinderland)
    nursery.address = Address.new('Park Avenue 4 A', 'foo', 'bar')
    assert_not nursery.valid?
  end

  test 'validation of name' do
    nursery = nurseries(:kinderland)
    nursery.name = nil
    assert_not nursery.valid?
    assert_includes nursery.errors[:name], 'can\'t be blank'
  end

  test 'validation of phone number' do
    nursery = nurseries(:kinderland)
    nursery.phone = nil
    assert_not nursery.valid?
    assert_includes nursery.errors[:phone], 'can\'t be blank'
  end

  test 'validation of mail address' do
    nursery = nurseries(:kinderland)
    nursery.mail = nil
    assert_not nursery.valid?
    assert_includes nursery.errors[:mail], 'can\'t be blank'
  end

  test 'url_name generation' do
    nursery = nurseries(:kinderland)
    assert_equal 'kinder-land', nursery.url_name

    # Save the nursery to validate the uniqueness of url_name
    nursery.save
    assert_not nursery.dup.valid?
  end

  test 'url_name is used in urls' do
    assert_equal 'kinder-land', nurseries(:kinderland).to_param
  end

  test 'education concept as html' do
    nursery = nurseries(:kinderland)
    nursery.education_concept = '* bilingual (deutsch-englisch)'
    assert_equal "<ul>\n<li>bilingual (deutsch-englisch)</li>\n</ul>\n",
                 nursery.education_concept_as_html
  end

  test 'education concept as html does html escaping' do
    nursery = nurseries(:kinderland)
    nursery.education_concept = 'bilingual (deutsch-englisch)<br>'
    assert_equal "<p>bilingual (deutsch-englisch)&lt;br&gt;</p>\n",
                 nursery.education_concept_as_html
  end

  test 'education concept as html includes line breaks' do
    nursery = nurseries(:kinderland)
    nursery.education_concept = "bilingual\n(deutsch-englisch)"
    assert_equal "<p>bilingual<br>\n(deutsch-englisch)</p>\n",
                 nursery.education_concept_as_html
  end
end

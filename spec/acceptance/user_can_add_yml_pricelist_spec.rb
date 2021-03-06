require_relative 'acceptance_helper'
require_relative '../page_objects/new_pricelist_page'

feature 'User can upload YML pricelist' do
  include_context 'yandex_ml_example'

  let!(:page_object) { NewPricelistPage.new(page, new_pricelist_path).visit }

  scenario 'User sees file upload field and submit button' do
    expect(page_object).to have_element :attachment_file_field
    expect(page_object).to have_element :submit_button
  end

  scenario 'User uploads pricelist' do
    page_object.attach_file_to_attachment(yandex_ml_example_path)
    page_object.submit
    expect(Pricelist.all.last.attachment.file).to_not be_nil
  end
end

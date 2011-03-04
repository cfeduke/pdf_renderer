require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test 'pdf request sends a pdf as a file' do
    visit home_path
    click_link 'pdf'
    
    assert_equal 'binary', headers['Content-Transfer-Encoding']
    assert_equal 'attachment; filename="contents.pdf"', headers['Content-Disposition']
    assert_equal 'application/pdf', headers['Content-type']
    assert_match /Prawn/, page.body
  end
  test "truth" do
    assert_kind_of Dummy::Application, Rails.application
  end
  
  protected
  def headers
    page.response_headers
  end 
end

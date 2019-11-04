require "application_system_test_case"

class CrawlersTest < ApplicationSystemTestCase
  setup do
    @crawler = crawlers(:one)
  end

  test "visiting the index" do
    visit crawlers_url
    assert_selector "h1", text: "Crawlers"
  end

  test "creating a Crawler" do
    visit crawlers_url
    click_on "New Crawler"

    click_on "Create Crawler"

    assert_text "Crawler was successfully created"
    click_on "Back"
  end

  test "updating a Crawler" do
    visit crawlers_url
    click_on "Edit", match: :first

    click_on "Update Crawler"

    assert_text "Crawler was successfully updated"
    click_on "Back"
  end

  test "destroying a Crawler" do
    visit crawlers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Crawler was successfully destroyed"
  end
end

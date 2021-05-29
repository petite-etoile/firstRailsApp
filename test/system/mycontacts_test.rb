require "application_system_test_case"

class MycontactsTest < ApplicationSystemTestCase
  setup do
    @mycontact = mycontacts(:one)
  end

  test "visiting the index" do
    visit mycontacts_url
    assert_selector "h1", text: "Mycontacts"
  end

  test "creating a Mycontact" do
    visit mycontacts_url
    click_on "New Mycontact"

    fill_in "Age", with: @mycontact.age
    fill_in "Mail", with: @mycontact.mail
    fill_in "Name", with: @mycontact.name
    check "Nationality" if @mycontact.nationality
    click_on "Create Mycontact"

    assert_text "Mycontact was successfully created"
    click_on "Back"
  end

  test "updating a Mycontact" do
    visit mycontacts_url
    click_on "Edit", match: :first

    fill_in "Age", with: @mycontact.age
    fill_in "Mail", with: @mycontact.mail
    fill_in "Name", with: @mycontact.name
    check "Nationality" if @mycontact.nationality
    click_on "Update Mycontact"

    assert_text "Mycontact was successfully updated"
    click_on "Back"
  end

  test "destroying a Mycontact" do
    visit mycontacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mycontact was successfully destroyed"
  end
end

require 'rails_helper'

RSpec.describe "Registered User Top Articles Search" do
  it "allows a Registered User to look for top articles" do
    VCR.use_cassette("features/search/registered_top_spec") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      within(:css, "div#top_select") do
        select "Books", from: :section
        click_on "Submit"
      end

      expect(current_path).to eq(top_path)
      expect(page).to have_css("tr#article_0") do
        with_tag("a", text: "Save")
      end




    end
  end
end
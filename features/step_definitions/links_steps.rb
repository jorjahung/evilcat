Given(/^I am on the homepage$/) do
  visit root_path
end

Given(/^I am on the new link page$/) do
  visit new_link_path
end

Given(/^I have added a link$/) do
  visit new_link_path
  fill_in "link[name]", with: "Google"
  fill_in "link[url]", with: "http://google.com"
  fill_in "link[description]", with: "You know what Google is."
  click_button "Add Link"
end

When(/^I click on "(.*?)"$/) do |link|
  click_link link
end

When(/^I add a new link$/) do
  fill_in "link[name]", with: "Google"
  fill_in "link[url]", with: "http://google.com"
  fill_in "link[description]", with: "You know what Google is."
  click_button "Add Link"
end

When(/^I view the profile page for that link$/) do
  link = Link.find_by_name("Google")
  visit link_path(link)
end

Then(/^I should see new link form$/) do
  expect(current_path).to eq new_link_path
  expect(page).to have_content "Name"
  expect(page).to have_content "URL"
  expect(page).to have_content "Description"
  expect(page).to have_field("link[name]")
  expect(page).to have_field("link[url]")
  expect(page).to have_field("link[description]")
end

Then(/^I should see the link on the homepage$/) do
  visit root_path
  expect(page).to have_content "Google"
  expect(page).to have_content "You know what Google is."
  expect(page).to have_link("Google", href: "http://google.com")
end

Then(/^I should see all its details$/) do
  expect(page).to have_content "Google"
  expect(page).to have_content "You know what Google is."
  expect(page).to have_link("http://google.com", href: "http://google.com")
end
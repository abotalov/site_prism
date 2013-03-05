Then /^I can see elements in the section$/ do
  @test_site.home.should have_people
  @test_site.home.people.title.text.should == "People"
end

Then /^that section is there too$/ do
  @test_site.page_with_people.should have_people_list
  @test_site.page_with_people.people_list.title.text.should == "People"
end

Then /^I can see a section within a section$/ do
  @test_site.section_experiments.should have_parent_section
  @test_site.section_experiments.parent_section.should have_child_section
  @test_site.section_experiments.parent_section.child_section.nice_label.text.should == "something"
end

Then /^I can see a collection of sections$/ do
  @test_site.section_experiments.should have_search_results
  @test_site.section_experiments.search_results.each_with_index do |search_result, i|
    search_result.title.text.should == "title #{i}"
    search_result.link.text.should == "link #{i}"
    search_result.description.text.should == "description #{i}"
  end
  @test_site.section_experiments.search_results.size.should == 4
end

Then /^the section is visible$/ do
  @test_site.home.people.should be_visible
end

Then /^I can get at the people section root element$/ do
  @test_site.home.people.root_element.class.should == Capybara::Node::Element
end

Then /^all expected elements are present in the search results$/ do
  @test_site.section_experiments.search_results.first.should be_all_there
end

Then /^I can run javascript against the search results$/ do
  @test_site.section_experiments.search_results.first.set_cell_value
  @test_site.section_experiments.search_results.first.cell_value.should == "wibble"
end

Then /^I can see individual people in the people list$/ do
  @test_site.home.people.should have(4).individuals
end

Then /^Anonymous sections should find elements within context$/ do
  @test_site.home.anonymous_section_table.should have_first_row
end

Then /^Anonymous sections should not find elements outside of context$/ do
  @test_site.home.anonymous_section_table.should_not have_header
end

Then /^Anonymous sections are recursive$/ do
  @test_site.section_experiments.anonymous_parent_section.anonymous_child_section.should have_nice_label
end

Then /^Anonymous sections can be defined for collections of elements$/ do
  @test_site.section_experiments.anonymous_search_results.all? do |result|
    result.should have_title
  end
end


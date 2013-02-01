class TestSectionExperiments < SitePrism::Page
  set_url '/section_experiments.htm'

  section :parent_section, Parent, '.parent-div'

  sections :search_results, SearchResult, '.search-results .search-result'

  # Anonymous sections which match sections from above
  element :anonymous_parent_section, '.parent-div' do |aps|
    aps.element :slow_section_element, 'a.slow'
    aps.element :anonymous_child_section, '.child-div' do |acs|
      acs.element :nice_label, '.nice-label'
    end
  end

  elements :anonymous_search_results, '.search_results .search_result' do |asr|
    asr.element :title, 'span.title'
    asr.element :link, 'a'
    asr.element :description, 'span.description'
  end

end


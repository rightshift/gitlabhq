class Spinach::Features::DashboardWithArchivedProjects < Spinach::FeatureSteps
  include SharedAuthentication
  include SharedPaths
  include SharedProject

  When 'project "Forum" is archived' do
    project = Project.find_by(name: "Forum")
    project.update_attribute(:archived, true)
  end

  step 'I should see "Shop" project link' do
    page.should have_link "Shop"
  end

  step 'I should not see "Forum" project link' do
    page.should_not have_link "Forum"
  end

  step 'I should see "Forum" project link' do
    page.should have_link "Forum"
  end
end

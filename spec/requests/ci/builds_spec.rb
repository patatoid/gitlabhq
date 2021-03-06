require 'spec_helper'

describe "Builds" do
  before do
    @commit = FactoryGirl.create :ci_commit
    @build = FactoryGirl.create :ci_build, commit: @commit
  end

  describe "GET /:project/builds/:id/status.json" do
    before do
      get status_ci_project_build_path(@commit.project, @build), format: :json
    end

    it { expect(response.status).to eq(200) }
    it { expect(response.body).to include(@build.sha) }
  end
end

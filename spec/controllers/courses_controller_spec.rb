require "spec_helper"

RSpec.describe CoursesController, type: :controller do
  let(:courses) { create_list :course, 3 }
  describe "GET index" do
    it "returns a 200" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "get @courses details" do
      course = Course.create
      get :index
      expect(JSON.parse(response.body)["data"]["courses"].last["course"]["id"] ).to eq(course.id)
    end
  end

  describe "POST create" do
    data = FactoryGirl.attributes_for(:course, tutors_attributes: [FactoryGirl.build(:tutor).attributes])
    it "get success respose" do
      post :create, params: {course: data}
      expect(JSON.parse(response.body)["data"]['success']).to eq(true)
    end

    it "get @courses details" do
      post :create, params: {course: data}
      expect(JSON.parse(response.body)["data"]["course_details"]["id"].present?).to eq(true)
      expect(JSON.parse(response.body)["data"]["tutors"].present?).to eq(true)
    end
  end
end

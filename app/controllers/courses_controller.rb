class CoursesController < ApplicationController

  def index
    @jresponse.set_response_body(courses: get_course_details)
    render json: @jresponse.done
  end

  def create
    course = Course.new(course_params)
    if course.save
      @jresponse.set_success_response_with_data(course_details: {id: course.id, name: course.name}, tutors: course.tutors)
    else
      @jresponse.set_error(:unprocessable_entity)
    end
    render json: @jresponse.done
  end

  private
  def course_params
    params.require(:course).permit(:name, tutors_attributes: [:id, :name])
  end

  def get_course_details
    courses = Course.includes(:tutors)
    course_list = []
    courses.each do |course|
      course_list.push({ course: course, tutors: course.tutors })
    end
    course_list
  end
end

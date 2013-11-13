class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find_by(id: params[:id])
    @course = Course.find_by(id: @meeting.course_id)
    # @student = Student.find_by(id: @course)
    # @attendance = Attendance.where(:meeting_id => params[:id])
    # @student = Student.where(:)
  end

  def new
    @course = Course.all
  end

  def create
    @meeting = Meeting.new
    @meeting.held_on = params[:held_on]
    @meeting.course_id = params[:course_id]

    if @meeting.save
      redirect_to meetings_url, notice: "Meeting created successfully."
    else
      render 'new'
    end
  end

  def edit
    @meeting = Meeting.find_by(id: params[:id])
  end

  def update
    @meeting = Meeting.find_by(id: params[:id])
    @meeting.held_on = params[:held_on]
    @meeting.course_id = params[:course_id]


    if @meeting.save
      redirect_to meetings_url, notice: "Meeting updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @meeting = Meeting.find_by(id: params[:id])
    @meeting.destroy

    redirect_to meetings_url, notice: "Meeting deleted."
  end
end

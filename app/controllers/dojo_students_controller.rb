class DojoStudentsController < ApplicationController
  def new
    @dojo_student = DojoStudent.new
    
    # If request comes from students#show page, prefetch student using params
    if params[:from] = "student"
      @student = Student.find(params[:id])
    else
      @student = nil
    end
  end
  
  def create
    @dojo_student = DojoStudent.new(params[:dojo_student])
    
    if @dojo_student.save
      @student = @dojo_student.student
      flash[:notice] = "Successfully updated #{@student.proper_name}'s dojo history"
      redirect_to @student
    else
      redirect_to home_path, notice: "Uh oh.."
    end
    
  end
end

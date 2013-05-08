class DojoStudentsController < ApplicationController
  def new
    @dojo_student = DojoStudent.new
    @student = nil
    @dojo = nil
    
    # If request comes from students#show page, prefetch student using params
    if params[:from] = "student"
      @student = Student.find(params[:id])
    elsif params[:from] = "dojo"
      @dojo = Dojo.find(params[:id])
    else
      # Do nothing
    end
  end
  
  def create
    @dojo_student = DojoStudent.new(params[:dojo_student])
    
    if @dojo_student.save
      @student = @dojo_student.student
      flash[:notice] = "Successfully updated #{@student.proper_name}'s dojo history"
      redirect_to @student
    else
      render :action => 'new'
    end
    
  end
end

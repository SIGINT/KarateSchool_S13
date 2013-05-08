class DojosController < ApplicationController
  skip_before_filter :check_login, :only => [:index, :show]
  
  def index
    @dojos = Dojo.active.alphabetical.paginate(:page => params[:page]).per_page(8)
    
    if @dojos.empty?
      flash[:notice] = "There are currently no dojos in the system"
      redirect_to home_path
    end
  end

  def show
    @dojo = Dojo.find(params[:id])
    # --- REVISIT: limit to active students? pagination not possible using current_students method ---
    @students = @dojo.students.active.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  def new
    @dojo = Dojo.new
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def create
    @dojo = Dojo.new(params[:dojo])
    
    if @dojo.save
      flash[:notice] = "Successfully created #{@dojo.name} dojo"
      redirect_to @dojo
    else
      render :action => 'new'
    end
  end

  def update
    @dojo = Dojo.find(params[:id])
    
    if @dojo.update_attributes(params[:dojo])
      flash[:notice] = "Successfully updated #{@dojo.name} dojo"
      redirect_to @dojo
    else
      render :action => 'edit'
    end
  end

  def destroy
  end
end

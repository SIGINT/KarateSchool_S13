class DojosController < ApplicationController
  def index
    @dojos = Dojo.active.alphabetical.paginate(:page => params[:page]).per_page(8)
  end

  def show
    @dojo = Dojo.find(params[:id])
    # --- REVISIT: limit to active students? ---
    @students = @dojo.students.alphabetical.paginate(:page => params[:page]).per_page(8)
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
      flash[:notice] = "Successfully created #{@dojo.name}"
      redirect_to @dojo
    else
      render :action => 'new'
    end
  end

  def update
    @dojo = Dojo.find(params[:id])
    
    if @dojo.update_attributes(params[:dojo])
      flash[:notice] = "Successfully updated #{@dojo.name}."
      redirect_to @dojo
    else
      render :action => 'edit'
    end
  end

  def destroy
  end
end

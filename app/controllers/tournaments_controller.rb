class TournamentsController < ApplicationController
  def index
    # --- REVISIT ---
    @tournaments = Tournament.active.chronological.paginate(:page => params[:page]).per_page(8)
    
    if @tournaments.empty?
      flash[:notice] = "There are currently no tournaments in the system"
      redirect_to home_path
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
    temp = @tournament.sections.active.alphabetical
    @num_sections = temp.size
    @sections = temp.paginate(:page => params[:page]).per_page(10)
  end

  def new
    @tournament = Tournament.new
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def create
    @tournament = Tournament.new(params[:tournament])
    
    if @tournament.save
      flash[:notice] = "Successfully created #{@tournament.name}"
      redirect_to @tournament
    else
      render :action => 'new'
    end
  end

  def update
    @tournament = Tournament.find(params[:id])
    
    if @tournament.update_attributes(params[:tournament])
      flash[:notice] = "Successfully updated #{@tournament.name}."
      redirect_to @tournament
    else
      render :action => 'edit'
    end
  end

  def destroy
  end
end

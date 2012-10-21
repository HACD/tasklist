class TasksController < ApplicationController

  # GET /tasks
  # GET /tasks.json
  def index
    @roots = Task.all.select(&:is_root?)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @task.parent_id = params[:id] if params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new params[:task]

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    Task.destroy params[:id]

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  # PUT /task/1/done
  # PUT /task/1/done.json
  def done
    Task.find(params[:id]).mark_as_complete

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  # PUT /task/1/undo
  # PUT /task/1/undo.json
  def undo
    Task.find(params[:id]).completed = false

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  # PUT /task/1/reset
  # PUT /task/1/reset.json
  def reset
    Task.find(params[:id]).mark_as_incomplete

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end    
  end
   
  
end

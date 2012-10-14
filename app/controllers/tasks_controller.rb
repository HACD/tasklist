class TasksController < ApplicationController

  # GET /tasks
  # GET /tasks.json
  def index
    @roots = []
    tasks = Task.all

    tasks.each do |task|
        @roots << task if task.is_root?
    end

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

    if params[:id].present?
      parent = Task.find(params[:id])
      @task.parent = parent
    end

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
    boolean_to_datetime

    if params[:task][:parent_id].present?
      parent = Task.find(params[:task][:parent_id])
      @task.parent = parent
    end

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
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  # GET /task/1/done
  # GET /task/1/done.json
  def done
    # fetch the task
    task = Task.find(params[:id])

    # mark it as done and save
    task.completed = Time.now
    task.save

    # mark all sub tasks as done
    task.descendants.each do | child |
      if child.completed.nil?
        child.completed = Time.now
        child.save
      end
    end

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  # GET /task/1/done
  # GET /task/1/done.json
  def undo
    # fetch the task
    task = Task.find(params[:id])

    # mark it as done and save
    task.completed = nil
    task.save

    # mark all sub tasks as done
    task.descendants.each do | child |
      child.completed = nil
      child.save
    end

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private

  def boolean_to_datetime
    completed = params["task"].delete("completed") == "1"
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed: params[:task][:completed]
    )
    @task.completed = completed ? Time.now : nil
  end

end

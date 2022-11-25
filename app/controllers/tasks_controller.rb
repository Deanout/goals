class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_goal, only: %i[create update]

    def create
        @task = @goal.tasks.build(task_params)
        @task.user = current_user
        @task.save
        redirect_to(fallback_location: root_path)
    end

    def update
        @task = @goal.tasks.find(params[:id])
        @task.update(task_params)
        redirect_to(fallback_location: root_path)
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to(fallback_location: root_path)
    end

    private

    def set_goal
        @goal = Goal.find(params[:goal_id])
    end

    def task_params
        params.require(:task).permit(:name, :completed)
    end
end

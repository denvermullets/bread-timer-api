module Api
  module V1
    class ProjectTimesController < ApplicationController
      before_action :set_project_time, only: %i[show update destroy]

      # GET /project_times
      def index
        @project_times = ProjectTime.all

        render json: @project_times
      end

      # GET /project_times/1
      def show
        render json: @project_time
      end

      # POST /project_times
      def create
        @project_time = ProjectTime.new(project_time_params)

        if @project_time.save
          render json: @project_time, status: :created, location: @project_time
        else
          render json: @project_time.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /project_times/1
      def update
        if @project_time.update(project_time_params)
          render json: @project_time
        else
          render json: @project_time.errors, status: :unprocessable_entity
        end
      end

      # DELETE /project_times/1
      def destroy
        @project_time.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_project_time
        @project_time = ProjectTime.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def project_time_params
        params.fetch(:project_time, {})
      end
    end
  end
end

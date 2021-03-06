# frozen_string_literal: true

class LinesController < OpenReadController
  before_action :set_line, only: %i[show update destroy]

  # GET /lines
  def index
    @lines = Line.all

    render json: @lines
  end

  # GET /lines/1
  def show
    render json: @line
  end

  # POST /lines
  def create
    @line = current_user.lines.build(line_params)

    if @line.save
      render json: @line, status: :created, location: @line
    else
      render json: @line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lines/1
  def update
    if @line.update(line_params)
      render json: @line
    else
      render json: @line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lines/1
  def destroy
    @line.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line
    @line = if User.admin?(current_user)
              Line.find(params[:id])
            else
              current_user.lines.find(params[:id])
            end
  end

  # Only allow a trusted parameter "white list" through.
  def line_params
    params.require(:line).permit(:user_id, :text)
  end
end

class SlackBotsController < ApplicationController
  before_action :set_slack_bot, only: [:show, :edit, :update, :destroy]

  # GET /slack_bots
  # GET /slack_bots.json
  def index
    @slack_bots = SlackBot.all
  end

  # GET /slack_bots/1
  # GET /slack_bots/1.json
  def show
  end

  # GET /slack_bots/new
  def new
    @slack_bot = SlackBot.new
  end

  # GET /slack_bots/1/edit
  def edit
  end

  # POST /slack_bots
  # POST /slack_bots.json
  def create
    @slack_bot = SlackBot.new(slack_bot_params)

    respond_to do |format|
      if @slack_bot.save
        format.html { redirect_to @slack_bot, notice: 'Slack bot was successfully created.' }
        format.json { render :show, status: :created, location: @slack_bot }
      else
        format.html { render :new }
        format.json { render json: @slack_bot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slack_bots/1
  # PATCH/PUT /slack_bots/1.json
  def update
    respond_to do |format|
      if @slack_bot.update(slack_bot_params)
        format.html { redirect_to @slack_bot, notice: 'Slack bot was successfully updated.' }
        format.json { render :show, status: :ok, location: @slack_bot }
      else
        format.html { render :edit }
        format.json { render json: @slack_bot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slack_bots/1
  # DELETE /slack_bots/1.json
  def destroy
    @slack_bot.destroy
    respond_to do |format|
      format.html { redirect_to slack_bots_url, notice: 'Slack bot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slack_bot
      @slack_bot = SlackBot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slack_bot_params
      params.require(:slack_bot).permit(:token)
    end
end

class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    client = GistQuestionService.new(@test_passage.current_question)
    gist = client.call

    if client.success?

      current_user.gists.create!(question_id: @test_passage.current_question.id, 
        gist_url: gist.url)

      redirect_to @test_passage, notice: "#{t(".success")} #{view_context.link_to('Gist', gist.url)}"
    else
      redirect_to @test_passage, alert: t(".failure")
    end
  end


  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

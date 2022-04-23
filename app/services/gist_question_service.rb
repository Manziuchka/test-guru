class GistQuestionService
  ACCESS_TOKEN = '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'

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ACCESS_TOKEN )
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status.to_i.between?(200, 209)
  end

  private

  def gist_params
    { 
      description: I18n.t(".gist.title", title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
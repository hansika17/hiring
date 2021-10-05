class Account::QuestionCategoriesController < Account::BaseController
  before_action :set_question_category, only: %i[ show edit update destroy ]

  def index
    authorize :account

    @question_categories = Survey::QuestionCategory.all.order(:name)
    @question_category = Survey::QuestionCategory.new
  end

  def edit
    authorize :account
  end

  def create
    authorize :account

    @question_category = Survey::QuestionCategory.new(question_category_params)
    respond_to do |format|
      if @question_category.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.prepend(:question_categories, partial: "account/question_categories/question_category", locals: { question_category: @question_category }) +
                               turbo_stream.replace(Survey::QuestionCategory.new, partial: "account/question_categories/form", locals: { question_category: Survey::QuestionCategory.new, message: "Survey question category was created successfully." })
        }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(Survey::QuestionCategory.new, partial: "account/question_categories/form", locals: { question_category: @question_category }) }
      end
    end
  end

  def edit
    authorize :account
  end

  def update
    authorize :account
    respond_to do |format|
      if @question_category.update(question_category_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@question_category, partial: "account/question_categories/question_category", locals: { question_category: @question_category, message: "Survey question category was updated successfully." }) }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@question_category, template: "account/question_categories/edit", locals: { question_category: @question_category, messages: @question_category.errors.full_messages }) }
      end
    end
  end

  def destroy
    authorize :account

    @question_category.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@question_category) }
    end
  end

  private

  def set_question_category
    @question_category ||= Survey::QuestionCategory.find(params[:id])
  end

  def question_category_params
    params.require(:survey_question_category).permit(:name, :account_id)
  end
end
